{...}: {
  programs.nixvim = {
    plugins = {
      telescope = {
        enable = true;
        extensions = {
          frecency.enable = true;
          media_files.enable = true;
          fzf-native.enable = true;
          undo.enable = true;
        };
      };
      which-key.registrations = {
        "<leader>f".name = " Find";
      };
    };
    keymaps = [
      {
        action = "<cmd>Telescope find_files<CR>";
        key = "<leader>ff";
      }
      {
        action = "<cmd>Telescope frecency<CR>";
        key = "<leader>fr";
      }
      {
        action = "<cmd>Telescope oldfiles<CR>";
        key = "<leader>fo";
      }
      {
        action = "<cmd>Telescope live_grep<CR>";
        key = "<leader>ft";
      }
      {
        action = "<cmd>Telescope buffers<CR>";
        key = "<leader>fb";
      }
      {
        action = "<cmd>Telescope media_files<CR>";
        key = "<leader>fm";
      }
      {
        action = "<cmd>Telescope undo<CR>";
        key = "<leader>fu";
      }
    ];
  };
}
