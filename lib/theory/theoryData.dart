import 'package:joyphysics/dataExporter.dart';
import 'package:joyphysics/model.dart';

final Map<String, List<TheorySubcategory>> theoryData = {
  '物理のための数学': [
      TheorySubcategory(
        name: '数列',
        topics: [
          sequencesInfiniteGeometricSeriesCoefficientOfRestitution,
          sequencesHarmonicSequence,
          sequencesTrigArithmeticInside,
        ],
      ),

      TheorySubcategory(
        name: '微分',
        topics: [
          differentiationProductRule,
          differentiationPositionVelocityAcceleration,
          differentiationChainRule,
          differentiationMaclaurinApproximation,
        ],
      ),

      TheorySubcategory(
        name: '積分',
        topics: [
          integrationDisplacementVelocityVariation,
          integrationFprimeOverF,
          integrationTrigRmsAverageZero,
          integrationGraphAverageValue,
          integrationReciprocalIsothermal,
          integrationPolynomialAdiabatic,
          integrationTanSubstitutionCircularCurrentSolenoid,
          integrationSubstitutionKxSquared,
          integrationMeanValueTheorem,
          integrationRiemannSum,
          integrationFundamentalTheoremCalculus,
        ],
      ),

      TheorySubcategory(
        name: 'ベクトル',
        topics: [
          vectorComponent, // 既存ファイルの変数名を残しています
          vectorsBasic,
          vectorsAddition,
          vectorsSubtractionRelativeVelocityPosition,
          vectorsNorm,
          vectorsDecomposition,
          vectorsComponents,
          vectorsLinearIndependence,
          vectorsCentroidInternalDivision,
          vectorsCrossProduct,
          vectorsDotProduct,
          vectorsCoordinateTransformation,
          vectorsVectorFields,
        ],
      ),

      TheorySubcategory(
        name: '三角関数',
        topics: [
          trigSumToProduct,
          trigFunctionsBasic,
          trigPeriodicity,
          trigSumToProductSeparation,
          trigAddition45deg,
        ],
      ),

      TheorySubcategory(
        name: '関数方程式',
        topics: [
          funceqRecurrenceInitialValue,
          funceqFunctionalEquations,
          funceqFreeFall,
          funceqBinetEquation,
          funceqSimpleHarmonicMotion,
          funceqAirResistance,
          funceqDampedOscillation,
          funceqHomogeneousDifferentialEquations,
          funceqNonhomogeneousDifferentialEquations,
          funceqSystemsCircuitsLorentz,
          funceqPoissonEquation,
          funceqUniquenessOfSolutions,
        ],
      ),

      TheorySubcategory(
        name: '二次曲線',
        topics: [
          conic2dWavesHyperbolaEquation,
          conicQuadraticVertexEllipse,
          conicEllipseArea,
          conicEllipseEquation,
          conicEllipseParametrization,
          conicCircleParabolaApproximation,
          conicFoci,
          conicEccentricity,
          conicPolarEquations,
        ],
      ),

      TheorySubcategory(
        name: '存在・全称',
        topics: [
          existenceForAllTFxTEqualsZeroNode,
          existenceForAllTFprimeFxTEqualsZeroAntinode,
          existenceExistsNSinThetaEqualsNa,
        ],
      ),

      TheorySubcategory(
        name: '多変数関数',
        topics: [
          multivarTrig1Plus1Vars,
          multivarTrig2Plus1Vars,
          multivarTrig3Plus1Vars,
        ],
      ),

      TheorySubcategory(
        name: 'その他',
        topics: [
          othersSystemsLinearEquations,
          othersHarmonicMean,
          othersLinePointSymmetryTransformations,
          othersSpiral,
          othersLineIntegrals,
          othersSurfaceIntegralsFlux,
          othersEnvelopeCurves,
          othersRmsVelocity,
          othersDimensionalAnalysis,
          othersEllipticIntegralsCircularCurrentPendulum,
        ],
      ),
  ],
  '力学理論': [
    TheorySubcategory(
      name: '運動方程式',
      topics: [
        eqOfMotion,
        simpleHarmonicMotionSolution
      ],
    ),
    TheorySubcategory(
      name: '剛体のつり合い',
      topics: [
        rigidBodyBalanceOfForces,
      ],
    ),
    TheorySubcategory(
      name: '等加速度直線運動',
      topics: [
        uniformAcceleration,
      ],
    ),
    TheorySubcategory(
      name: '運動量',
      topics: [
        momentum,
      ],
    ),
    TheorySubcategory(
      name: '仕事と線積分',
      topics: [
        workAndLineIntegral
      ],
    ),
    TheorySubcategory(
      name: 'エネルギー保存則',
      topics: [
        workAndEnergy,
        conservativeForce,
        surfaceGravityEnergyConservation,
        fookEnergyConservation,
        surfaceGravAndFookEnergyConservation,
        universalGravitationEnergyConserv
      ],
    ),
    TheorySubcategory(
      name: '角運動量',
      topics: [
        angularMomentumAndTorque,
      ],
    ),
    TheorySubcategory(
      name: '円運動',
      topics: [
        simplePendulum,
        conicalPendulum
      ],
    ),
    TheorySubcategory(
      name: '極座標',
      topics: [
        uniformCircularMotion,
        nonUniformCircularMotion,
        twoDimPolarCoordinatesEqOfMotion,
      ],
    ),
    TheorySubcategory(
      name: '慣性力',
      topics: [
        inertialForceParallel,
        inertialForceRotation
      ],
    ),
    TheorySubcategory(
      name: '二体問題',
      topics: [
        doubleMassPoint,
        collisionConservation,
        doubleMassPointEnergy
      ],
    ),

    TheorySubcategory(
      name: '質点系の力学',
      topics: [
        systemsOfParticles,
      ],
    ),
    TheorySubcategory(
      name: 'ケプラーの三法則',
      topics: [
        keplerFirstLaw,
        keplerSecondLaw,
        keplerThirdLaw,
      ],
    ),
  ],
  '電磁気学理論': [
    TheorySubcategory(
      name: '電荷と電流',
      topics: [
        definitionOfElectricChargeAndCurrent,
      ],
    ),
    TheorySubcategory(
      name: '電磁気力',
      topics: [
        electromagneticForce,
      ],
    ),
    TheorySubcategory(
      name: '電磁場の定義',
      topics: [
        definitionOfElectricField,
        definitionOfMagneticField,
      ],
    ),     
    TheorySubcategory(
      name: '流束と面積分',
      topics: [
        fluxAndAreaIntegral,
      ],
    ),
    TheorySubcategory(
      name: '真空中のマクスウェル方程式',
      topics: [
        electoricGaussLaw,
        magneticGaussLaw,
        electromagneticInductionLaw,
        ampereMaxwellLaw
      ],
    ),
    TheorySubcategory(
      name: '双極子',
      topics: [
        electricDipole,
        magneticDipole,
        dipoleComparison
      ],
    ),
    TheorySubcategory(
      name: '物質中の電場と磁場',
      topics: [
        permittivity,
        permeability,
        permittivityAndPermeabilityTable
      ],
    ),
    // TheorySubcategory(
    //   name: '物質中のマクスウェル方程式',
    //   topics: [
    //     electoricGaussLawInMatter,
    //     ampereMaxwellLawInMatter
    //   ],
    // ),
    // TheorySubcategory(
    //   name: '電荷が作る電場',
    //   topics: [
    //     electricDipole,
    //   ],
    // ),
    TheorySubcategory(
      name: '定常電流が作る磁場',
      topics: [
        biotSavartLaw,
        infiniteStraightCurrent,
        solenoidMagneticFieldProp,
        bioSarvartLawForCircleCurrent,
        // electricDipole
      ],
    ),
    TheorySubcategory(
      name: '電気回路',
      topics: [
        rcCircuitTheory,
        rcCircuitDischarge
      ],
    ),
    TheorySubcategory(
      name: '電磁気力を受ける質点の運動',
      topics: [
        lorentzForceAndCircleMove,
      ],
    ),
    // TheorySubcategory(
    //   name: 'その他',
    //   topics: [
    //     rightHandRule,
    //   ],
    // ),
  ],
};