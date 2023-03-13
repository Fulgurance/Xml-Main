class Target < ISM::Software
    
    def prepareInstallation
        super

        makeDirectory("#{builtSoftwareDirectoryPath(false)}#{Ism.settings.rootPath}usr/share/xml/docbook/xml-dtd-4.5")
        makeDirectory("#{builtSoftwareDirectoryPath(false)}#{Ism.settings.rootPath}etc/xml")

        copyFile("#{buildDirectoryPath(false)}docbook.cat","#{builtSoftwareDirectoryPath(false)}#{Ism.settings.rootPath}usr/share/xml/docbook/xml-dtd-4.5/docbook.cat")
        copyFile(Dir["#{buildDirectoryPath(false)}*.dtd"],"#{builtSoftwareDirectoryPath(false)}#{Ism.settings.rootPath}usr/share/xml/docbook/xml-dtd-4.5")
        copyDirectory("#{buildDirectoryPath(false)}ent","#{builtSoftwareDirectoryPath(false)}#{Ism.settings.rootPath}usr/share/xml/docbook/xml-dtd-4.5/ent")
        copyFile(Dir["#{buildDirectoryPath(false)}*.mod"],"#{builtSoftwareDirectoryPath(false)}#{Ism.settings.rootPath}usr/share/xml/docbook/xml-dtd-4.5")
    end

    def install
        super

        if !File.exists("#{Ism.settings.rootPath}etc/xml/catalog")
            runXmlCatalogCommand([  "--noout",
                                    "--create",
                                    "#{Ism.settings.rootPath}etc/xml/docbook"])
        end

        runXmlCatalogCommand([  "--noout",
                                "--add",
                                "\"public\"",
                                "\"-//OASIS//DTD DocBook XML V4.5//EN\"",
                                "\"http://www.oasis-open.org/docbook/xml/4.5/docbookx.dtd\"",
                                "#{Ism.settings.rootPath}etc/xml/docbook"])
        runXmlCatalogCommand([  "--noout",
                                "--add",
                                "\"public\"",
                                "\"-//OASIS//DTD DocBook XML CALS Table Model V4.5//EN\"",
                                "\"file:///usr/share/xml/docbook/xml-dtd-4.5/calstblx.dtd\"",
                                "#{Ism.settings.rootPath}etc/xml/docbook"])
        runXmlCatalogCommand([  "--noout",
                                "--add",
                                "\"public\"",
                                "\"-//OASIS//DTD XML Exchange Table Model 19990315//EN\"",
                                "\"file:///usr/share/xml/docbook/xml-dtd-4.5/soextblx.dtd\"",
                                "#{Ism.settings.rootPath}etc/xml/docbook"])
        runXmlCatalogCommand([  "--noout",
                                "--add",
                                "\"public\"",
                                "\"-//OASIS//ELEMENTS DocBook XML Information Pool V4.5//EN\"",
                                "\"file:///usr/share/xml/docbook/xml-dtd-4.5/dbpoolx.mod\"",
                                "#{Ism.settings.rootPath}etc/xml/docbook"])
        runXmlCatalogCommand([  "--noout",
                                "--add",
                                "\"public\"",
                                "\"-//OASIS//ELEMENTS DocBook XML Document Hierarchy V4.5//EN\"",
                                "\"file:///usr/share/xml/docbook/xml-dtd-4.5/dbhierx.mod\"",
                                "#{Ism.settings.rootPath}etc/xml/docbook"])
        runXmlCatalogCommand([  "--noout",
                                "--add",
                                "\"public\"",
                                "\"-//OASIS//ELEMENTS DocBook XML HTML Tables V4.5//EN\"",
                                "\"file:///usr/share/xml/docbook/xml-dtd-4.5/htmltblx.mod\"",
                                "#{Ism.settings.rootPath}etc/xml/docbook"])
        runXmlCatalogCommand([  "--noout",
                                "--add",
                                "\"public\"",
                                "\"-//OASIS//ENTITIES DocBook XML Notations V4.5//EN\"",
                                "\"file:///usr/share/xml/docbook/xml-dtd-4.5/dbnotnx.mod\"",
                                "#{Ism.settings.rootPath}etc/xml/docbook"])
        runXmlCatalogCommand([  "--noout",
                                "--add",
                                "\"public\"",
                                "\"-//OASIS//ENTITIES DocBook XML Character Entities V4.5//EN\"",
                                "\"file:///usr/share/xml/docbook/xml-dtd-4.5/dbcentx.mod\"",
                                "#{Ism.settings.rootPath}etc/xml/docbook"])
        runXmlCatalogCommand([  "--noout",
                                "--add",
                                "\"public\"",
                                "\"-//OASIS//ENTITIES DocBook XML Additional General Entities V4.5//EN\"",
                                "\"file:///usr/share/xml/docbook/xml-dtd-4.5/dbgenent.mod\"",
                                "#{Ism.settings.rootPath}etc/xml/docbook"])
        runXmlCatalogCommand([  "--noout",
                                "--add",
                                "\"rewriteSystem\"",
                                "\"http://www.oasis-open.org/docbook/xml/4.5\"",
                                "\"file:///usr/share/xml/docbook/xml-dtd-4.5\"",
                                "#{Ism.settings.rootPath}etc/xml/docbook"])
        runXmlCatalogCommand([  "--noout",
                                "--add",
                                "\"rewriteURI\"",
                                "\"http://www.oasis-open.org/docbook/xml/4.5\"",
                                "\"file:///usr/share/xml/docbook/xml-dtd-4.5\"",
                                "#{Ism.settings.rootPath}etc/xml/docbook"])

        if !File.exists("#{Ism.settings.rootPath}etc/xml/catalog")
            runXmlCatalogCommand([  "--noout",
                                    "--create",
                                    "#{Ism.settings.rootPath}etc/xml/catalog"])
        end

        runXmlCatalogCommand([  "--noout",
                                "--add",
                                "\"delegatePublic\"",
                                "\"-//OASIS//ENTITIES DocBook XML\"",
                                "\"file:///etc/xml/docbook\"",
                                "#{Ism.settings.rootPath}etc/xml/catalog"])
        runXmlCatalogCommand([  "--noout",
                                "--add",
                                "\"delegatePublic\"",
                                "\"-//OASIS//DTD DocBook XML\"",
                                "\"file:///etc/xml/docbook\"",
                                "#{Ism.settings.rootPath}etc/xml/catalog"])
        runXmlCatalogCommand([  "--noout",
                                "--add",
                                "\"delegateSystem\"",
                                "\"http://www.oasis-open.org/docbook/\"",
                                "\"file:///etc/xml/docbook\"",
                                "#{Ism.settings.rootPath}etc/xml/catalog"])
        runXmlCatalogCommand([  "--noout",
                                "--add",
                                "\"delegateURI\"",
                                "\"http://www.oasis-open.org/docbook/\"",
                                "\"file:///etc/xml/docbook\"",
                                "#{Ism.settings.rootPath}etc/xml/catalog"])
    end

end
