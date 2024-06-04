open SubgraphIsomorphism

(* Example usage *)
let () =
  let matrix = Owl.Mat.of_array
      [|0.; 1.; 0.; 1.; 1.; 0.; 0.; 0.;
        1.; 0.; 1.; 0.; 0.; 1.; 0.; 0.;
        0.; 1.; 0.; 1.; 0.; 0.; 1.; 0.;
        1.; 0.; 1.; 0.; 0.; 0.; 0.; 1.;
        1.; 0.; 0.; 0.; 0.; 1.; 0.; 1.;
        0.; 1.; 1.; 0.; 1.; 0.; 1.; 0.;
        0.; 0.; 0.; 0.; 0.; 1.; 0.; 1.;
        0.; 0.; 0.; 1.; 1.; 0.; 1.; 0.|] 8 8 in
  let cgraph = Graph.from_matrix matrix in
  Graph.print_matrix cgraph;
  let iso_subgraph = SubgraphIsomorphism.Graph.random_subgraph_congruence cgraph 4 in
  Graph.print_matrix iso_subgraph;

show_perms

(**
let () =
  print_endline "Random permutation matrix:";;
  let n = 5 in
  let m = Utils.random_permutation_matrix n in
  Mat.print m

  *)
