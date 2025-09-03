return {
  "mfussenegger/nvim-jdtls",
  dependencies = {
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
  },
  config = function()
    local home = os.getenv("HOME")
    local eclipse_jdtls_path = home .. '/.local/share/nvim/mason/packages/jdtls'
    local equinox_launcher_path = vim.fn.glob(eclipse_jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar", 1)
    local lombok = eclipse_jdtls_path .. "/lombok.jar"
    local config_linux = eclipse_jdtls_path .. "/config_linux"
    local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
    local workspace_dir = home .. "/.cache/jdtls/workspace/" .. project_name

    local java_debuger_path = home .. '/.local/share/nvim/mason/packages/java-debug-adapter'
    local java_debuger_launcher_path = { vim.fn.glob(
      java_debuger_path .. "/extension/server/com.microsoft.java.debug.plugin-*.jar", 1) }

    local config = {
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
        workspace_dir,
      },
      root_dir = vim.fs.root(0, {
        ".git",
        "build.gradle",
        "build.gradle.kts",
        "build.xml",
        "pom.xml",
        "settings.gradle",
        "settings.gradle.kts",
      }),
      init_options = {
        bundles = java_debuger_launcher_path
      },
    }

    vim.lsp.config("jdtls", config)
  end
}
