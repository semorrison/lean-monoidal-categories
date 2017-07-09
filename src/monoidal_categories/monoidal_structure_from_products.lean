-- Copyright (c) 2017 Scott Morrison. All rights reserved.
-- Released under Apache 2.0 license as described in the file LICENSE.
-- Authors: Scott Morrison
import .braided_monoidal_category
import category_theory.universal.instances

open categories
open categories.functor
open categories.products
open categories.natural_transformation
open categories.monoidal_category
open categories.universal

namespace categories.monoidal_category

@[reducible,applicable] definition left_associated_triple_Product_projection_1 { C : Category } [ has_BinaryProducts C ] { X Y Z : C.Obj } : C.Hom (binary_product (binary_product X Y).product Z).product X :=
  C.compose (BinaryProduct.left_projection _) (BinaryProduct.left_projection _)
@[reducible,applicable] definition left_associated_triple_Product_projection_2 { C : Category } [ has_BinaryProducts C ] { X Y Z : C.Obj } : C.Hom (binary_product (binary_product X Y).product Z).product Y :=
  C.compose (BinaryProduct.left_projection _) (BinaryProduct.right_projection _)
@[reducible,applicable] definition right_associated_triple_Product_projection_2 { C : Category } [ has_BinaryProducts C ] { X Y Z : C.Obj } : C.Hom (binary_product X (binary_product Y Z).product).product Y :=
  C.compose (BinaryProduct.right_projection _) (BinaryProduct.left_projection _)
@[reducible,applicable] definition right_associated_triple_Product_projection_3 { C : Category } [ has_BinaryProducts C ] { X Y Z : C.Obj } : C.Hom (binary_product X (binary_product Y Z).product).product Z :=
  C.compose (BinaryProduct.right_projection _) (BinaryProduct.right_projection _)

@[simp] lemma left_factorisation_associated_1 { C : Category } [ has_BinaryProducts C ] { W X Y Z : C.Obj } 
  ( h : C.Hom W Z ) ( f : C.Hom Z X ) ( g : C.Hom Z Y ) : C.compose (C.compose h ((binary_product X Y).map f g)) (binary_product X Y).left_projection = C.compose h f := ♯ 
@[simp] lemma left_factorisation_associated_2 { C : Category } [ has_BinaryProducts C ] { W X Y Z : C.Obj } 
  ( h : C.Hom X W ) ( f : C.Hom Z X ) ( g : C.Hom Z Y ) : C.compose ((binary_product X Y).map f g) (C.compose (binary_product X Y).left_projection h) = C.compose f h := ♯
@[simp] lemma right_factorisation_associated_1 { C : Category } [ has_BinaryProducts C ] { W X Y Z : C.Obj } 
  ( h : C.Hom W Z ) ( f : C.Hom Z X ) ( g : C.Hom Z Y ) : C.compose (C.compose h ((binary_product X Y).map f g)) (binary_product X Y).right_projection = C.compose h g := ♯
@[simp] lemma right_factorisation_associated_2 { C : Category } [ has_BinaryProducts C ] { W X Y Z : C.Obj } 
  ( h : C.Hom Y W ) ( f : C.Hom Z X ) ( g : C.Hom Z Y ) : C.compose ((binary_product X Y).map f g) (C.compose (binary_product X Y).right_projection h) = C.compose g h := ♯

definition TensorProduct_from_Products ( C : Category ) [ has_BinaryProducts C ] : TensorProduct C := {
    onObjects     := λ p, (binary_product p.1 p.2).product,
    onMorphisms   := λ X Y f, ((binary_product Y.1 Y.2).map
                                (C.compose (binary_product X.1 X.2).left_projection (f.1))
                                (C.compose (binary_product X.1 X.2).right_projection (f.2))
                              ),
    identities    := ♯,
    functoriality := ♯
}

local attribute [simp] Category.associativity

-- PROJECT seems to be taking forever
-- definition Associator_for_Products ( C : Category ) [ has_BinaryProducts C ] : Associator (TensorProduct_from_Products C) := ♯

end categories.monoidal_category