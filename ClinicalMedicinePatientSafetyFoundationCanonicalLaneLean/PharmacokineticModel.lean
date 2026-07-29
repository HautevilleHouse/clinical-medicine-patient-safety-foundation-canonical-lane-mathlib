import canonicalLaneMathlib.AdmissibleClass
import ClinicalMedicinePatientSafetyFoundationCanonicalLaneLean.CompartmentModel

namespace HautevilleHouse
namespace ClinicalMedicinePatientSafetyFoundationCanonicalLaneLean

structure PharmacokineticModel (n : Nat) (C : CompartmentModel n) where
  drugDose : Real
  eliminationRate : Real
  bioavailability : Real
  volumeDistribution : Real
  doseAdministration : Prop
  eliminationRateDefined : Prop
  bioavailabilityDefined : Prop
  volumeDistributionDefined : Prop
  linearKinetics : Prop
  doseAdministrationTerm : doseAdministration
  eliminationRateDefinedTerm : eliminationRateDefined
  bioavailabilityDefinedTerm : bioavailabilityDefined
  volumeDistributionDefinedTerm : volumeDistributionDefined
  linearKineticsTerm : linearKinetics

structure PharmacokineticModelEvidence (n : Nat) (C : CompartmentModel n)
    (P : PharmacokineticModel n C) where
  doseAdministrationClosed : P.doseAdministration
  eliminationRateDefinedClosed : P.eliminationRateDefined
  bioavailabilityDefinedClosed : P.bioavailabilityDefined
  volumeDistributionDefinedClosed : P.volumeDistributionDefined
  linearKineticsClosed : P.linearKinetics

def PharmacokineticModelClosed (n : Nat) (C : CompartmentModel n)
    (P : PharmacokineticModel n C) : Prop :=
  P.doseAdministration ∧ P.eliminationRateDefined ∧
  P.bioavailabilityDefined ∧ P.volumeDistributionDefined ∧ P.linearKinetics

theorem pharmacokinetic_model_closed_from_evidence (n : Nat) (C : CompartmentModel n)
    (P : PharmacokineticModel n C) (E : PharmacokineticModelEvidence n C P) :
    PharmacokineticModelClosed n C P := by
  exact And.intro E.doseAdministrationClosed
    (And.intro E.eliminationRateDefinedClosed
      (And.intro E.bioavailabilityDefinedClosed
        (And.intro E.volumeDistributionDefinedClosed E.linearKineticsClosed)))

end ClinicalMedicinePatientSafetyFoundationCanonicalLaneLean
end HautevilleHouse