import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicinePatientSafetyFoundationCanonicalLaneLean

structure CompartmentModel (n : Nat) where
  compartments : Fin n -> Type
  transferRates : Fin n -> Fin n -> Real
  concentrationFunction : Real -> Fin n -> Real
  initialCondition : Fin n -> Real
  positivityPreserving : Prop
  massConservation : Prop
  positivityPreservingTerm : positivityPreserving
  massConservationTerm : massConservation

structure CompartmentModelEvidence (n : Nat) (C : CompartmentModel n) where
  positivityPreservingClosed : C.positivityPreserving
  massConservationClosed : C.massConservation

def CompartmentModelClosed (n : Nat) (C : CompartmentModel n) : Prop :=
  C.positivityPreserving ∧ C.massConservation

theorem compartment_model_closed_from_evidence (n : Nat) (C : CompartmentModel n)
    (E : CompartmentModelEvidence n C) : CompartmentModelClosed n C := by
  exact And.intro E.positivityPreservingClosed E.massConservationClosed

end ClinicalMedicinePatientSafetyFoundationCanonicalLaneLean
end HautevilleHouse