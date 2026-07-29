import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicinePatientSafetyFoundationCanonicalLaneLean

structure DiagnosticInferenceModel where
  priorDistribution : Real -> Real
  likelihoodFunction : Real -> Real -> Real
  posteriorComputed : Real -> Real -> Real
  decisionThreshold : Real
  specificity : Prop
  sensitivity : Prop
  positivePredictiveValue : Prop
  negativePredictiveValue : Prop
  bayesianCoherence : Prop
  specificityTerm : specificity
  sensitivityTerm : sensitivity
  positivePredictiveValueTerm : positivePredictiveValue
  negativePredictiveValueTerm : negativePredictiveValue
  bayesianCoherenceTerm : bayesianCoherence

structure DiagnosticInferenceEvidence (D : DiagnosticInferenceModel) where
  specificityClosed : D.specificity
  sensitivityClosed : D.sensitivity
  positivePredictiveValueClosed : D.positivePredictiveValue
  negativePredictiveValueClosed : D.negativePredictiveValue
  bayesianCoherenceClosed : D.bayesianCoherence

def DiagnosticInferenceClosed (D : DiagnosticInferenceModel) : Prop :=
  D.specificity ∧ D.sensitivity ∧ D.positivePredictiveValue ∧
  D.negativePredictiveValue ∧ D.bayesianCoherence

theorem diagnostic_inference_closed_from_evidence (D : DiagnosticInferenceModel)
    (E : DiagnosticInferenceEvidence D) : DiagnosticInferenceClosed D := by
  exact And.intro E.specificityClosed
    (And.intro E.sensitivityClosed
      (And.intro E.positivePredictiveValueClosed
        (And.intro E.negativePredictiveValueClosed E.bayesianCoherenceClosed)))

end ClinicalMedicinePatientSafetyFoundationCanonicalLaneLean
end HautevilleHouse