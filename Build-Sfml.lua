project "SFML"
   kind "StaticLib"
   language "C++"
   cppdialect "C++14"
   targetdir "Binaries/%{cfg.buildcfg}"
   staticruntime "off"

   defines{ "SFML_STATIC", "AL_STATIC", "FLAC__NO_DLL" }
   files { "include/SFML/**.hpp", "src/SFML/**.cpp", "src/SFML/**.hpp",
		"extlibs/headers/**.h", "include/SFML/**.inl", "src/SFML/Window/Win32/WglExtensions.txt"}
        
    removefiles{ "src/SFML/Main/SFMLActivity.cpp", 
		"src/SFML/Main/MainAndroid.cpp",
		"src/SFML/System/Android/*.cpp",
		"src/SFML/Network/**.cpp",
		"src/SFML/System/Unix/*.cpp",
		"src/SFML/Window/Android/**.cpp",
		"src/SFML/Window/EGLCheck.cpp",
		"src/SFML/Window/EGLContext.cpp",
		"src/SFML/Window/OSX/**.cpp",
		"src/SFML/Window/Unix/**.cpp",
		"src/SFML/Window/FreeBSD/**.cpp"

    }
   includedirs
   {
        "src", "include",
		"src/SFML/System",
		"extlibs/headers/AL",
		"extlibs/headers/FLAC",
		"extlibs/headers/freetype2",
		"extlibs/headers/mingw",
		"extlibs/headers/ogg",
		"extlibs/headers/stb_image",
		"extlibs/headers"
   }

   targetdir ("../Binaries/" .. OutputDir .. "/%{prj.name}")
   objdir ("../Binaries/Intermediates/" .. OutputDir .. "/%{prj.name}")

   filter "system:windows"
       systemversion "latest"
       defines { }

   filter "configurations:Debug"
       defines { "DEBUG" }
       runtime "Debug"
       symbols "On"

   filter "configurations:Release"
       defines { "RELEASE" }
       runtime "Release"
       optimize "On"
       symbols "On"

   filter "configurations:Dist"
       defines { "DIST" }
       runtime "Release"
       optimize "On"
       symbols "Off"