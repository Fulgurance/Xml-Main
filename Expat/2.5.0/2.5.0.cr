class Target < ISM::Software

    def configure
        super

        configureSource(arguments:  "--prefix=/usr                          \
                                    --host=#{Ism.settings.systemTarget}     \
                                    --build=#{Ism.settings.systemTarget}    \
                                    --target=#{Ism.settings.systemTarget}   \
                                    --disable-static                        \
                                    --docdir=/usr/share/doc/expat-2.5.0",
                        path: buildDirectoryPath)
    end

    def build
        super

        makeSource(path: buildDirectoryPath)
    end

    def prepareInstallation
        super

        makeSource( arguments:  "DESTDIR=#{builtSoftwareDirectoryPath}/#{Ism.settings.rootPath} install",
                    path:       buildDirectoryPath)
    end

end
