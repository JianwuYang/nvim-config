local eclipse_jdtls_path = vim.fn.expand("$MASON/packages/jdtls")
local equinox_launcher_path = vim.fn.glob(eclipse_jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar", 1)
local lombok = eclipse_jdtls_path .. "/lombok.jar"
local config_linux = eclipse_jdtls_path .. "/config_linux"
return {
	cmd = {
		"java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.level=ALL",
		"-Xmx1G",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",
		"-javaagent:" .. lombok,
		"-jar",
		equinox_launcher_path,
		"-configuration",
		config_linux,
		"-data",
		"/home/yangjianwu/.cache/jdtls/workspace",
	},
	filetypes = { "java" },
	settings = {
		java = {},
	},
	init_options = {
		jvm_args = {
			"-javaagent:" .. lombok,
		},
		workspace = "/home/yangjianwu/.cache/jdtls/workspace",
	},
	root_markers = {
		".git",
		"build.gradle",
		"build.gradle.kts",
		"build.xml",
		"pom.xml",
		"settings.gradle",
		"settings.gradle.kts",
	},
}
