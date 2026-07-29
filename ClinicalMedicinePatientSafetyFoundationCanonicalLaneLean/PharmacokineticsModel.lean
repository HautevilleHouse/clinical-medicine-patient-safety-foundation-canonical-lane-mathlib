import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicinePatientSafetyFoundationCanonicalLaneLean

structure PharmacokineticsPackage where
  drugDistribution : Type
  eliminationRateConstant : Type
  halfLife : Type
  volumeOfDistribution : Type
  clearance : Type
  compartmentCoupling : Prop
  firstOrderKinetics : Prop
  linearSuperposition : Prop
  constantInfusionFormula : Prop

structure PharmacokineticsEvidence (PK : PharmacokineticsPackage) where
  compartmentCouplingClosed : PK.compartmentCoupling
  firstOrderKineticsClosed : PK.firstOrderKinetics
  linearSuperpositionClosed : PK.linearSuperposition
  constantInfusionFormulaClosed : PK.constantInfusionFormula

def PharmacokineticsClosed (PK : PharmacokineticsPackage) : Prop :=
  PK.compartmentCoupling ∧ PK.firstOrderKinetics ∧ PK.linearSuperposition ∧ PK.constantInfusionFormula

theorem pharmacokinetics_closed_from_evidence (PK : PharmacokineticsPackage) (E : PharmacokineticsEvidence PK) : PharmacokineticsClosed PK :=
  by
    exact And.intro E.compartmentCouplingClosed (And.intro E.firstOrderKineticsClosed (And.intro E.linearSuperpositionClosed E.constantInfusionFormulaClosed))

end ClinicalMedicinePatientSafetyFoundationCanonicalLaneLean
end HautevilleHouse