-- scaffold geniefile for boost

boost_script = path.getabsolute(path.getdirectory(_SCRIPT))
boost_root = path.join(boost_script, "boost")

boost_includedirs = {
	path.join(boost_script, "config"),
	boost_root,
}

boost_libdirs = {}
boost_links = {}
boost_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { boost_includedirs }
	end,

	_add_defines = function()
		defines { boost_defines }
	end,

	_add_libdirs = function()
		libdirs { boost_libdirs }
	end,

	_add_external_links = function()
		links { boost_links }
	end,

	_add_self_links = function()
		links { "boost" }
	end,

	_create_projects = function()

project "boost"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		boost_includedirs,
	}

	defines {}

	files {
		path.join(boost_script, "config", "**.h"),
		path.join(boost_root, "**.h"),
		path.join(boost_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
