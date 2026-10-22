-- nvim-jdtls arranca el servidor por proyecto; no va por vim.lsp.enable
local jdtls = require("jdtls")

local root = vim.fs.root(0, { "mvnw", "gradlew", "pom.xml", "build.gradle", ".git" })
if not root then
  return
end

-- jdtls necesita un JDK reciente (25+) para ejecutarse, aunque el proyecto
-- compile con otro; por eso no se usa JAVA_HOME. openjdk de Homebrew es keg-only
local jdtls_jdk = "/opt/homebrew/opt/openjdk/libexec/openjdk.jdk/Contents/Home"
local jdk21 = "/opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home"
local workspace = vim.fn.stdpath("data") .. "/jdtls-workspaces/" .. vim.fn.fnamemodify(root, ":p:h:t")

jdtls.start_or_attach({
  cmd = { "jdtls", "-data", workspace },
  cmd_env = { JAVA_HOME = jdtls_jdk },
  root_dir = root,
  capabilities = require("blink.cmp").get_lsp_capabilities(),
  settings = {
    java = {
      configuration = {
        runtimes = { { name = "JavaSE-21", path = jdk21 } },
      },
    },
  },
})
