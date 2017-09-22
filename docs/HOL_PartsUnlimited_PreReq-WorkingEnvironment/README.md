# Goal
Set up the development environment for the DevOps training course...

# Background
An Azure Dev Test Lab VM has been set up for you, log into this VM using the credentials shared with you. This VM is pre set up with the following software;
- Visual Studio 2017 Update 3
- dotNetCore 2.0

# Setup
Follow the below listed steps to set up the pre-req to get PartsUnlimited to work on this pre-provisioned virtual machine...

## Node & Grunt Install 
+ Download [NodeJs](https://nodejs.org/en/download/) for Windows x64
  ![Download NodeJs](./media/DownloadNodeJs.JPG)
+ Install NodeJs by accepting all the defaults
+ Launch `cmd` and type `PATH`, you should see the following in path ``
  ![NodeJs On Path](./media/NodeJsOnPath.JPG)
+ Launch `cmd` and type `npm install -g grunt` to install grunt 
  ![Install grunt](./media/NpmInstallGrunt.JPG)
+ Type `npm install -g grunt-cli` to install grunt-cli
  ![Install grunt-cli](./media/NpmInstallGrunt-cli.JPG)
+ To validate the install, launch cmd and type `where grunt`
  ![Validate grunt install](./media/ValidateGruntInstall.JPG)
+ To validate if dotnetcore2.0 is installed, launch `cmd` and type `dotnet --version`
  ![validate dotnetcore2.0](./media/ValidateDotNetCoreInstall.JPG)     

# Run PartsUnlimited with VisualStudioCode
Parts unlimited has already been cloned on your development virtual machine. To run it with Visual Studio Code follow the instructions below...
+ Launch Visual Studio Code and open the folder `C:\DevOpsTTT\source\repos\PartsUnlimited\src\PartsUnlimitedWebsite`
+ To build the solution in Visual Studio Code click `CTRL + SHIFT + B`. You'll see a prompt to configure a build task...
  ![VsCode Configure Build Task](./media/VsCodeConfigureBuildTask.JPG)
+ Configure dot net core build task, you'll notice a `task.json` gets auto created for you
  ![Configure dotNetCore Build Task](./media/BuildConfigurationDotNetCore.JPG)
+ `CTRL + SHIFT + B` to trigger a build, it will use this task.json to build the app, you'll be promoted to select the build task to run, choose `Build`
  ![VsCode Build Task to Run](./media/VsCodeBuildTaskToRun.JPG)
+ Wait for the build to succeed, check the results in the Terminal window 
  ![VsCode Build Results](./media/VsCodeBuildResults.JPG)
+ To Debug the application, in Visual Studio Code hit `F5`, you'll be promoted to select an `environment`, select more...
  ![VsCode F5 Debug](./media/VsCodeDebugF5.JPG)
+ Select the debugger `C#` and click install, reload once the install is complete... 
  ![Install C# Debug Environment](./media/InstallEnvironmentCSharp.JPG)
+ Hit `F5` again... You'll see that the packages related to PartsUnlimited start to restore, you'll be promoted to restore missing packages required to compile the solution, accept to add packages...
  ![Accept to add missing packages](./media/AcceptToAddMissingPackages.JPG)
+ Hit `F5` again and you'll be promoted to select the environment, select `dotnetcore`. You might be prompted to auto create a `launch.json` file if it doesn't already exist. If all goes well, you should see the `Parts Unlimited` website launch in debug mode...
  ![Parts Unlimited Debug](./media/PartsUnlimitedDotNetCoreDebug.JPG)