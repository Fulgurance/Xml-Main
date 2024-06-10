class Target < ISM::Software
    
    def prepareInstallation
        super

        makeDirectory("#{builtSoftwareDirectoryPath}#{Ism.settings.rootPath}usr/share/xml/docbook/xml-dtd-4.5")
        makeDirectory("#{builtSoftwareDirectoryPath}#{Ism.settings.rootPath}etc/xml")

        copyFile("#{buildDirectoryPath}docbook.cat","#{builtSoftwareDirectoryPath}#{Ism.settings.rootPath}usr/share/xml/docbook/xml-dtd-4.5/docbook.cat")
        copyFile(Dir["#{buildDirectoryPath}*.dtd"],"#{builtSoftwareDirectoryPath}#{Ism.settings.rootPath}usr/share/xml/docbook/xml-dtd-4.5")
        copyDirectory("#{buildDirectoryPath}ent","#{builtSoftwareDirectoryPath}#{Ism.settings.rootPath}usr/share/xml/docbook/xml-dtd-4.5/ent")
        copyFile(Dir["#{buildDirectoryPath}*.mod"],"#{builtSoftwareDirectoryPath}#{Ism.settings.rootPath}usr/share/xml/docbook/xml-dtd-4.5")
    end

    def install
        super

        if !File.exists?("#{Ism.settings.rootPath}etc/xml/docbook")
            runXmlCatalogCommand([  "--noout",
                                    "--create",
                                    "/etc/xml/docbook"])
        end

        runXmlCatalogCommand([  "--noout",
                                "--add",
                                "public",
                                "\"-//OASIS//DTD DocBook XML V4.5//EN\"",
                                "http://www.oasis-open.org/docbook/xml/4.5/docbookx.dtd",
                                "/etc/xml/docbook"])
        runXmlCatalogCommand([  "--noout",
                                "--add",
                                "public",
                                "\"-//OASIS//DTD DocBook XML CALS Table Model V4.5//EN\"",
                                "file:///usr/share/xml/docbook/xml-dtd-4.5/calstblx.dtd",
                                "/etc/xml/docbook"])
        runXmlCatalogCommand([  "--noout",
                                "--add",
                                "public",
                                "\"-//OASIS//DTD XML Exchange Table Model 19990315//EN\"",
                                "file:///usr/share/xml/docbook/xml-dtd-4.5/soextblx.dtd",
                                "/etc/xml/docbook"])
        runXmlCatalogCommand([  "--noout",
                                "--add",
                                "public",
                                "\"-//OASIS//ELEMENTS DocBook XML Information Pool V4.5//EN\"",
                                "file:///usr/share/xml/docbook/xml-dtd-4.5/dbpoolx.mod",
                                "/etc/xml/docbook"])
        runXmlCatalogCommand([  "--noout",
                                "--add",
                                "public",
                                "\"-//OASIS//ELEMENTS DocBook XML Document Hierarchy V4.5//EN\"",
                                "file:///usr/share/xml/docbook/xml-dtd-4.5/dbhierx.mod",
                                "/etc/xml/docbook"])
        runXmlCatalogCommand([  "--noout",
                                "--add",
                                "public",
                                "\"-//OASIS//ELEMENTS DocBook XML HTML Tables V4.5//EN\"",
                                "file:///usr/share/xml/docbook/xml-dtd-4.5/htmltblx.mod",
                                "/etc/xml/docbook"])
        runXmlCatalogCommand([  "--noout",
                                "--add",
                                "public",
                                "\"-//OASIS//ENTITIES DocBook XML Notations V4.5//EN\"",
                                "file:///usr/share/xml/docbook/xml-dtd-4.5/dbnotnx.mod",
                                "/etc/xml/docbook"])
        runXmlCatalogCommand([  "--noout",
                                "--add",
                                "public",
                                "\"-//OASIS//ENTITIES DocBook XML Character Entities V4.5//EN\"",
                                "file:///usr/share/xml/docbook/xml-dtd-4.5/dbcentx.mod",
                                "/etc/xml/docbook"])
        runXmlCatalogCommand([  "--noout",
                                "--add",
                                "public",
                                "\"-//OASIS//ENTITIES DocBook XML Additional General Entities V4.5//EN\"",
                                "file:///usr/share/xml/docbook/xml-dtd-4.5/dbgenent.mod",
                                "/etc/xml/docbook"])
        runXmlCatalogCommand([  "--noout",
                                "--add",
                                "rewriteSystem",
                                "http://www.oasis-open.org/docbook/xml/4.5",
                                "file:///usr/share/xml/docbook/xml-dtd-4.5",
                                "/etc/xml/docbook"])
        runXmlCatalogCommand([  "--noout",
                                "--add",
                                "rewriteURI",
                                "http://www.oasis-open.org/docbook/xml/4.5",
                                "file:///usr/share/xml/docbook/xml-dtd-4.5",
                                "/etc/xml/docbook"])

        if !File.exists?("#{Ism.settings.rootPath}etc/xml/catalog")
            runXmlCatalogCommand([  "--noout",
                                    "--create",
                                    "/etc/xml/catalog"])
        end

        runXmlCatalogCommand([  "--noout",
                                "--add",
                                "delegatePublic",
                                "\"-//OASIS//ENTITIES DocBook XML\"",
                                "file:///etc/xml/docbook",
                                "/etc/xml/catalog"])
        runXmlCatalogCommand([  "--noout",
                                "--add",
                                "delegatePublic",
                                "\"-//OASIS//DTD DocBook XML\"",
                                "file:///etc/xml/docbook",
                                "/etc/xml/catalog"])
        runXmlCatalogCommand([  "--noout",
                                "--add",
                                "delegateSystem",
                                "http://www.oasis-open.org/docbook/",
                                "file:///etc/xml/docbook",
                                "/etc/xml/catalog"])
        runXmlCatalogCommand([  "--noout",
                                "--add",
                                "delegateURI",
                                "http://www.oasis-open.org/docbook/",
                                "file:///etc/xml/docbook",
                                "/etc/xml/catalog"])

        dtdVersions = ["4.1.2","4.2","4.3","4.4"]

        dtdVersions.each do |version|
            runXmlCatalogCommand([  "--noout",
                                    "--add",
                                    "public",
                                    "\"-//OASIS//DTD DocBook XML V#{version}//EN\"",
                                    "http://www.oasis-open.org/docbook/xml/#{version}/docbookx.dtd",
                                    "/etc/xml/docbook"])

            runXmlCatalogCommand([  "--noout",
                                    "--add",
                                    "rewriteSystem",
                                    "http://www.oasis-open.org/docbook/xml/#{version}",
                                    "file:///usr/share/xml/docbook/xml-dtd-4.5",
                                    "/etc/xml/docbook"])

            runXmlCatalogCommand([  "--noout",
                                    "--add",
                                    "rewriteURI",
                                    "http://www.oasis-open.org/docbook/xml/#{version}",
                                    "file:///usr/share/xml/docbook/xml-dtd-4.5",
                                    "/etc/xml/docbook"])

            runXmlCatalogCommand([  "--noout",
                                    "--add",
                                    "delegateSystem",
                                    "http://www.oasis-open.org/docbook/xml/#{version}",
                                    "file:///etc/xml/docbook",
                                    "/etc/xml/catalog"])

            runXmlCatalogCommand([  "--noout",
                                    "--add",
                                    "delegateURI",
                                    "http://www.oasis-open.org/docbook/xml/#{version}",
                                    "file:///etc/xml/docbook",
                                    "/etc/xml/catalog"])
        end
    end

end
