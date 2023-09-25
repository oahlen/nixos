vim.api.nvim_create_user_command('NixFormat', function(_)
    if os.execute("alejandra -q .") == 0 then
        print("Formatted nix files")
    else
        print("Formatting nix files failed ...")
    end
end, {})
