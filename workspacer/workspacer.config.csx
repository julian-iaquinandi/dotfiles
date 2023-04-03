// Development
// #r "C:\Users\dalyisaac\Repos\workspacer\src\workspacer.Shared\bin\Debug\net5.0-windows\win10-x64\workspacer.Shared.dll"
// #r "C:\Users\dalyisaac\Repos\workspacer\src\workspacer.Bar\bin\Debug\net5.0-windows\win10-x64\workspacer.Bar.dll"
// #r "C:\Users\dalyisaac\Repos\workspacer\src\workspacer.Gap\bin\Debug\net5.0-windows\win10-x64\workspacer.Gap.dll"
// #r "C:\Users\dalyisaac\Repos\workspacer\src\workspacer.ActionMenu\bin\Debug\net5.0-windows\win10-x64\workspacer.ActionMenu.dll"
// #r "C:\Users\dalyisaac\Repos\workspacer\src\workspacer.FocusIndicator\bin\Debug\net5.0-windows\win10-x64\workspacer.FocusIndicator.dll"


// Production
#r "C:\Program Files\workspacer\workspacer.Shared.dll"
#r "C:\Program Files\workspacer\plugins\workspacer.Bar\workspacer.Bar.dll"
#r "C:\Program Files\workspacer\plugins\workspacer.Gap\workspacer.Gap.dll"
#r "C:\Program Files\workspacer\plugins\workspacer.ActionMenu\workspacer.ActionMenu.dll"
#r "C:\Program Files\workspacer\plugins\workspacer.FocusIndicator\workspacer.FocusIndicator.dll"

using System;
using System.Collections.Generic;
using System.Linq;
using workspacer;
using workspacer.Bar;
using workspacer.Bar.Widgets;
using workspacer.Gap;
using workspacer.ActionMenu;
using workspacer.FocusIndicator;

return new Action<IConfigContext>((IConfigContext context) =>
{
  /* Variables */
  var fontSize = 11;
  var barHeight = 26;
  var fontName = "CaskaydiaCove NF";
  var background = new Color(0x0, 0x0, 0x0);

  /* Config */
  context.CanMinimizeWindows = true;

  /* Gap */
  var gap = barHeight - 12;
  var gapPlugin = context.AddGap(new GapPluginConfig() { InnerGap = gap, OuterGap = gap / 2, Delta = gap / 2 });

  /* Bar */
  context.AddBar(new BarPluginConfig()
  {
    FontSize = fontSize,
    BarHeight = barHeight,
    FontName = fontName,
    DefaultWidgetBackground = background,
    LeftWidgets = () => new IBarWidget[]
    {
            new WorkspaceWidget(), new TextWidget(": "), new TitleWidget() {
                IsShortTitle = true
            }
    },
    RightWidgets = () => new IBarWidget[]
    {
            new BatteryWidget(),
            new ActiveLayoutWidget(),
            new TimeWidget(1000, "dd-MMM HH:mm"),
    }
  });

  /* Bar focus indicator */
  context.AddFocusIndicator();

  /* Default layouts */
  Func<ILayoutEngine[]> defaultLayouts = () => new ILayoutEngine[]
  {
        new TallLayoutEngine(),
        // new VertLayoutEngine(),
        // new HorzLayoutEngine(),
        new FullLayoutEngine(),
  };

  context.DefaultLayouts = defaultLayouts;

  /* Workspaces */
  // Array of workspace names and their layouts
  (string, ILayoutEngine[])[] workspaces =
  {
        ("main", defaultLayouts()),
        ("todo", new ILayoutEngine[] { new HorzLayoutEngine(), new TallLayoutEngine() }),
        ("cal", defaultLayouts()),
        ("chat", defaultLayouts()),
        ("media", defaultLayouts()),
        ("other", defaultLayouts()),
    };

  foreach ((string name, ILayoutEngine[] layouts) in workspaces)
  {
    context.WorkspaceContainer.CreateWorkspace(name, layouts);
  }

  /* Filters */
  // context.WindowRouter.AddFilter((window) => !window.ProcessFileName.Equals("1Password.exe"));
  // context.WindowRouter.AddFilter((window) => !window.ProcessFileName.Equals("pinentry.exe"));

  // The following filter means that Edge will now open on the correct display
  context.WindowRouter.AddFilter((window) => !window.Class.Equals("ShellTrayWnd"));

  /* Routes */
  context.WindowRouter.RouteProcessName("Slack", "chat");
  context.WindowRouter.RouteProcessName("Discord", "chat");
  context.WindowRouter.RouteProcessName("Spotify", "media");
  context.WindowRouter.RouteProcessName("OUTLOOK", "cal");
  context.WindowRouter.RouteTitle("Microsoft To Do", "todo");
  context.WindowRouter.RouteProcessName("Notion", "todo");

  /* Action menu */
  var actionMenu = context.AddActionMenu(new ActionMenuPluginConfig()
  {
    RegisterKeybind = false,
    MenuHeight = barHeight,
    FontSize = fontSize,
    FontName = fontName,
    Background = background,
  });

  /* Action menu builder */
  Func<ActionMenuItemBuilder> createActionMenuBuilder = () =>
  {
    var menuBuilder = actionMenu.Create();

    // Switch to workspace
    menuBuilder.AddMenu("switch", () =>
      {
        var workspaceMenu = actionMenu.Create();
        var monitor = context.MonitorContainer.FocusedMonitor;
        var workspaces = context.WorkspaceContainer.GetWorkspaces(monitor);

        Func<int, Action> createChildMenu = (workspaceIndex) => () =>
          {
            context.Workspaces.SwitchMonitorToWorkspace(monitor.Index, workspaceIndex);
          };

        int workspaceIndex = 0;
        foreach (var workspace in workspaces)
        {
          workspaceMenu.Add(workspace.Name, createChildMenu(workspaceIndex));
          workspaceIndex++;
        }

        return workspaceMenu;
      });

    // Move window to workspace
    menuBuilder.AddMenu("move", () =>
      {
        var moveMenu = actionMenu.Create();
        var focusedWorkspace = context.Workspaces.FocusedWorkspace;

        var workspaces = context.WorkspaceContainer.GetWorkspaces(focusedWorkspace).ToArray();
        Func<int, Action> createChildMenu = (index) => () => { context.Workspaces.MoveFocusedWindowToWorkspace(index); };

        for (int i = 0; i < workspaces.Length; i++)
        {
          moveMenu.Add(workspaces[i].Name, createChildMenu(i));
        }

        return moveMenu;
      });

    // Rename workspace
    menuBuilder.AddFreeForm("rename", (name) =>
      {
        context.Workspaces.FocusedWorkspace.Name = name;
      });

    // Create workspace
    menuBuilder.AddFreeForm("create workspace", (name) =>
      {
        context.WorkspaceContainer.CreateWorkspace(name);
      });

    // Delete focused workspace
    menuBuilder.Add("close", () =>
      {
        context.WorkspaceContainer.RemoveWorkspace(context.Workspaces.FocusedWorkspace);
      });

    // Workspacer
    menuBuilder.Add("toggle keybind helper", () => context.Keybinds.ShowKeybindDialog());
    menuBuilder.Add("toggle enabled", () => context.Enabled = !context.Enabled);
    menuBuilder.Add("restart", () => context.Restart());
    menuBuilder.Add("quit", () => context.Quit());

    return menuBuilder;
  };
  var actionMenuBuilder = createActionMenuBuilder();

  /* Keybindings */
  Action setKeybindings = () =>
  {
    KeyModifiers alt = KeyModifiers.Alt;
    KeyModifiers altShift = KeyModifiers.Alt | KeyModifiers.Shift;

    IKeybindManager manager = context.Keybinds;

    var workspaces = context.Workspaces;

    manager.UnsubscribeAll();
    manager.Subscribe(MouseEvent.LButtonDown, () => workspaces.SwitchFocusedMonitorToMouseLocation());

    // Focus
    // manager.Subscribe(alt, Keys.D, () => workspaces.FocusedWorkspace.FocusNextWindow(), "focus next window");
    // manager.Subscribe(alt, Keys.F, () => workspaces.FocusedWorkspace.FocusPreviousWindow(), "focus previous window");

    manager.Subscribe(alt, Keys.D1, () => context.Workspaces.SwitchToWorkspace(0), "switch to workspace 1");
    manager.Subscribe(alt, Keys.D2, () => context.Workspaces.SwitchToWorkspace(1), "switch to workspace 2");
    manager.Subscribe(alt, Keys.D3, () => context.Workspaces.SwitchToWorkspace(2), "switch to workspace 3");
    manager.Subscribe(alt, Keys.D4, () => context.Workspaces.SwitchToWorkspace(3), "switch to workspace 4");
    manager.Subscribe(alt, Keys.D5, () => context.Workspaces.SwitchToWorkspace(4), "switch to workspace 5");
    manager.Subscribe(alt, Keys.D6, () => context.Workspaces.SwitchToWorkspace(5), "switch to workspace 6");

    manager.Subscribe(alt, Keys.D7, () => context.Workspaces.SwitchFocusedMonitor(6), "switch to monitor 1");
    manager.Subscribe(alt, Keys.D8, () => context.Workspaces.SwitchFocusedMonitor(7), "switch to monitor 2");
    manager.Subscribe(alt, Keys.D9, () => context.Workspaces.SwitchFocusedMonitor(8), "switch to monitor 3");

    // Move
    manager.Subscribe(altShift, Keys.D1, () => context.Workspaces.MoveFocusedWindowToWorkspace(0), "switch focused window to workspace 1");
    manager.Subscribe(altShift, Keys.D2, () => context.Workspaces.MoveFocusedWindowToWorkspace(1), "switch focused window to workspace 2");
    manager.Subscribe(altShift, Keys.D3, () => context.Workspaces.MoveFocusedWindowToWorkspace(2), "switch focused window to workspace 3");
    manager.Subscribe(altShift, Keys.D4, () => context.Workspaces.MoveFocusedWindowToWorkspace(3), "switch focused window to workspace 4");
    manager.Subscribe(altShift, Keys.D5, () => context.Workspaces.MoveFocusedWindowToWorkspace(4), "switch focused window to workspace 5");
    manager.Subscribe(altShift, Keys.D6, () => context.Workspaces.MoveFocusedWindowToWorkspace(5), "switch focused window to workspace 6");

    manager.Subscribe(altShift, Keys.D7, () => context.Workspaces.MoveFocusedWindowToMonitor(0), "move focused window to monitor 1");
    manager.Subscribe(altShift, Keys.D8, () => context.Workspaces.MoveFocusedWindowToMonitor(1), "move focused window to monitor 2");
    manager.Subscribe(altShift, Keys.D9, () => context.Workspaces.MoveFocusedWindowToMonitor(2), "move focused window to monitor 3");

    manager.Subscribe(alt, Keys.C, () => context.Workspaces.FocusedWorkspace.CloseFocusedWindow(), "close focused window");

    manager.Subscribe(altShift, Keys.Space, () => context.Workspaces.FocusedWorkspace.NextLayoutEngine(), "next layout");
    manager.Subscribe(altShift, Keys.Q, context.Restart, "restart workspacer");
    manager.Subscribe(altShift, Keys.X, context.Quit, "quit workspacer");

    // Misc
    manager.Subscribe(altShift, Keys.J, () => workspaces.FocusedWorkspace.ShrinkPrimaryArea(), "shrink primary area");
    manager.Subscribe(altShift, Keys.OemSemicolon, () => workspaces.FocusedWorkspace.ExpandPrimaryArea(), "expand primary area");

    manager.Subscribe(alt, Keys.Add, () => workspaces.FocusedWorkspace.DecrementNumberOfPrimaryWindows(), "decrement number of primary windows");
    manager.Subscribe(alt, Keys.Subtract, () => workspaces.FocusedWorkspace.IncrementNumberOfPrimaryWindows(), "increment number of primary windows");

    // Other shortcuts
    manager.Subscribe(alt, Keys.P, () => actionMenu.ShowMenu(actionMenuBuilder), "show menu");
    manager.Subscribe(altShift, Keys.Escape, () => context.Enabled = !context.Enabled, "toggle enabled/disabled");
    manager.Subscribe(altShift, Keys.T, () => context.ToggleConsoleWindow(), "toggle console window");
  };
  setKeybindings();
});