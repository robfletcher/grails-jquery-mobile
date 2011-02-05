includeTargets << grailsScript("_GrailsInit")

target(installMobileTemplates: "Installs the jQuery-mobile scaffolding templates") {
	depends(checkVersion, parseArguments)

	sourceDir = "${jqueryMobilePluginDir}/src/templates"
	targetDir = "${basedir}/src/templates"
	overwrite = false

	// only if template dir already exists in, ask to overwrite templates
	if (new File(targetDir).exists()) {
		if (!isInteractive || confirmInput("Overwrite existing templates?", "overwrite.templates")) {
			overwrite = true
		}
	} else {
		ant.mkdir(dir: targetDir)
	}

	ant.copy(todir: "$targetDir/scaffolding", overwrite: overwrite) {
		fileset dir: "$sourceDir/scaffolding"
	}

	event "StatusUpdate", ["jQuery-mobile templates installed successfully"]
}

setDefaultTarget installMobileTemplates