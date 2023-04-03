class Target < ISM::Software
    
    def configure
        super

        configureSource(arguments: ["--prefix=/usr"],
                        path: buildDirectoryPath,
                        environment: {"LINKS" => "/usr/bin/links"})
    end
    
    def build
        super

        makeSource(path: buildDirectoryPath)
    end
    
    def prepareInstallation
        super

        makeSource(["DESTDIR=#{builtSoftwareDirectoryPath}#{Ism.settings.rootPath}","install"],buildDirectoryPath)
    end

end
