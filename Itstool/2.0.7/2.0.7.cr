class Target < ISM::Software
    
    def configure
        super

        configureSource(arguments: ["--prefix=/usr"],
                        path: buildDirectoryPath,
                        environment: {"PYTHON" => "/usr/bin/python3"})
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
