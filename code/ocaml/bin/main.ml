open Owl
open SubgraphIsomorphism

let () =
  print_endline "Random permutation matrix:";;
  let n = 5 in
  let m = Utils.random_permutation_matrix n in
  Mat.print m
