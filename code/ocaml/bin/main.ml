open Owl
open SubgraphIsomorphism

let show_perms =
    let perm = PermGroup.random_permutation 8 in
    print_endline "Random permutation:";
    PermGroup.print_permutation perm;
    print_endline "Corresponding Matrix:";
    PermGroup.into_permutation_matrix perm |> Mat.print;;



(* Example usage *)
let () =
  let matrix = Mat.of_array
      [|0.; 1.; 0.; 1.; 1.; 0.; 0.; 0.;
        1.; 0.; 1.; 0.; 0.; 1.; 0.; 0.;
        0.; 1.; 0.; 1.; 0.; 0.; 1.; 0.;
        1.; 0.; 1.; 0.; 0.; 0.; 0.; 1.;
        1.; 0.; 0.; 0.; 0.; 1.; 0.; 1.;
        0.; 1.; 1.; 0.; 1.; 0.; 1.; 0.;
        0.; 0.; 0.; 0.; 0.; 1.; 0.; 1.;
        0.; 0.; 0.; 1.; 1.; 0.; 1.; 0.|] 8 8 in
  let p = Utils.random_permutation_matrix 8 in
  let dot_code = Utils.permute_adj_matrix matrix p
                 |> Utils.adjacency_to_dot_undirected in
  print_endline dot_code ;;
  show_perms;;

 (**
let () =
  print_endline "Random permutation matrix:";;
  let n = 5 in
  let m = Utils.random_permutation_matrix n in
  Mat.print m

  *)
