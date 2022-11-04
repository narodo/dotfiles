local aucmd_dict = {
    FileType = {
        {
            pattern = "dts,make",
            command = "setlocal noexpandtab tabstop=4"
        },
        {
            pattern = "python",
            command = "setlocal expandtab tabstop=4"
        },
    },
}

--"Change indent style for MAKE files and make c source kernel compatible
--autocmd FileType make set noexpandtab
--autocmd FileType c    set noexpandtab shiftwidth=8 tabstop=8
--autocmd FileType cpp  set noexpandtab shiftwidth=8 tabstop=8
--autocmd FileType dts  setlocal noexpandtab shiftwidth=8 tabstop=8

for event, opt_tbls in pairs(aucmd_dict) do
    for _, opt_tbl in pairs(opt_tbls) do
        vim.api.nvim_create_autocmd(event, opt_tbl)
    end
end 
