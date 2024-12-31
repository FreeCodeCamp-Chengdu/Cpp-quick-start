add_rules("mode.debug", "mode.release")

target("Cpp-quick-start")
    set_kind("binary")
    add_files("src/*.cpp")
