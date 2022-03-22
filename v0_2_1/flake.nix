{
  description = ''Efficient string slices that works on a shared underlying string instead of copying'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-strslice-v0_2_1.flake = false;
  inputs.src-strslice-v0_2_1.owner = "PMunch";
  inputs.src-strslice-v0_2_1.ref   = "v0_2_1";
  inputs.src-strslice-v0_2_1.repo  = "strslice";
  inputs.src-strslice-v0_2_1.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-strslice-v0_2_1"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-strslice-v0_2_1";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}