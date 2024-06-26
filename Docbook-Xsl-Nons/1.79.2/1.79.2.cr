class Target < ISM::Software
    
    def prepareInstallation
        super

        makeDirectory("#{builtSoftwareDirectoryPath}#{Ism.settings.rootPath}etc/xml")
        makeDirectory("#{builtSoftwareDirectoryPath}#{Ism.settings.rootPath}usr/share/xml/docbook/xsl-stylesheets-nons-1.79.2")
        makeDirectory("#{builtSoftwareDirectoryPath}#{Ism.settings.rootPath}usr/share/doc/docbook-xsl-nons-1.79.2")

        directories = [ "VERSION", "assembly", "common", "eclipse", "epub", "epub3", "extensions",
                        "fo", "highlighting", "html", "htmlhelp", "images", "javahelp", "lib",
                        "manpages", "params", "profiling", "roundtrip", "slides", "template", "tests",
                        "tools", "webhelp", "website", "xhtml", "xhtml-1_1", "xhtml5"]

        directories.each do |directory|
            copyDirectory("#{buildDirectoryPath}#{directory}","#{builtSoftwareDirectoryPath}#{Ism.settings.rootPath}usr/share/xml/docbook/xsl-stylesheets-nons-1.79.2")
        end

        moveFile(   "#{buildDirectoryPath}README",
                    "#{builtSoftwareDirectoryPath}#{Ism.settings.rootPath}usr/share/doc/docbook-xsl-nons-1.79.2/README.txt")

        moveFile(   "#{buildDirectoryPath}RELEASE-NOTES*",
                    "#{builtSoftwareDirectoryPath}#{Ism.settings.rootPath}usr/share/doc/docbook-xsl-nons-1.79.2")

        moveFile(   "#{buildDirectoryPath}NEWS*",
                    "#{builtSoftwareDirectoryPath}#{Ism.settings.rootPath}usr/share/doc/docbook-xsl-nons-1.79.2")

        makeLink(   "VERSION",
                    "#{builtSoftwareDirectoryPath}#{Ism.settings.rootPath}usr/share/xml/docbook/xsl-stylesheets-nons-1.79.2/VERSION.xsl",:symbolicLink)
    end

    def install
        super

        if !File.exists?("#{Ism.settings.rootPath}etc/xml/catalog")
            runXmlCatalogCommand(arguments: "--noout    \
                                            --create    \
                                            /etc/xml/catalog")
        end

        runXmlCatalogCommand(arguments: "--noout                                            \
                                        --add                                               \
                                        rewriteSystem                                       \
                                        https://cdn.docbook.org/release/xsl-nons/1.79.2     \
                                        /usr/share/xml/docbook/xsl-stylesheets-nons-1.79.2  \
                                        /etc/xml/catalog")

        runXmlCatalogCommand(arguments: "--noout                                            \
                                        --add                                               \
                                        rewriteURI                                          \
                                        https://cdn.docbook.org/release/xsl-nons/1.79.2     \
                                        /usr/share/xml/docbook/xsl-stylesheets-nons-1.79.2  \
                                        /etc/xml/catalog")

        runXmlCatalogCommand(arguments: "--noout                                            \
                                        --add                                               \
                                        rewriteSystem                                       \
                                        https://cdn.docbook.org/release/xsl-nons/current    \
                                        /usr/share/xml/docbook/xsl-stylesheets-nons-1.79.2  \
                                        /etc/xml/catalog")

        runXmlCatalogCommand(arguments: "--noout                                            \
                                        --add                                               \
                                        rewriteURI                                          \
                                        https://cdn.docbook.org/release/xsl-nons/current    \
                                        /usr/share/xml/docbook/xsl-stylesheets-nons-1.79.2  \
                                        /etc/xml/catalog")

        runXmlCatalogCommand(arguments: "--noout                                            \
                                        --add                                               \
                                        rewriteSystem                                       \
                                        http://docbook.sourceforge.net/release/xsl/current  \
                                        /usr/share/xml/docbook/xsl-stylesheets-nons-1.79.2  \
                                        /etc/xml/catalog")

        runXmlCatalogCommand(arguments: "--noout                                            \
                                        --add                                               \
                                        rewriteURI                                          \
                                        http://docbook.sourceforge.net/release/xsl/current  \
                                        /usr/share/xml/docbook/xsl-stylesheets-nons-1.79.2  \
                                        /etc/xml/catalog")
    end

end
