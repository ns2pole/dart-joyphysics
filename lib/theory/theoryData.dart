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
        simpleHarmonicMotionSolution,
        particle_motion_gravity_with_air_resistance,
      ],
    ),
    TheorySubcategory(
      name: '剛体の静力学',
      topics: [
        rigidBodyBalanceOfForces,
      ],
    ),
    TheorySubcategory(
      name: '剛体の動力学',
      topics: [
        moment_of_inertia,
        physical_pendulum
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
        universalGravitationEnergyConserv,
        t_1d_elastic_collision_energy_conservation,
        t_2d_elastic_collision_equal_mass_on_stationary
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
        simple_pendulum_period_elliptic_integrals,
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
      name: 'ケプラー問題',
      topics: [
        keplerSecondLaw,
        keplerThirdLaw,
        runge_lenz_vector,
        keplerFirstLaw,
      ],
    ),
  ],
  '電磁気学理論': [
    TheorySubcategory(
      name: '力学と電磁気学の対応',
      topics: [
        mech_em_differential_equations_mapping,
        mechanics_em_electricfield_gravity_mapping
      ],
    ),
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
        coulombs_law
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
      name: '静止電荷分布の作る静電場',
      topics: [
        e_field_point_charge,
        e_field_infinite_uniform_sheet,
        e_field_spherical_charge_distribution,
      ],
    ),
    // TheorySubcategory(
    //   name: '物質中のマクスウェル方程式',
    //   topics: [
    //     electoricGaussLawInMatter,
    //     ampereMaxwellLawInMatter
    //   ],
    // ),
    TheorySubcategory(
      name: '定常電流が作る磁場',
      topics: [
        infiniteStraightCurrent,
        circular_loop_magnetic_field_satisfies_ampere_law,
        solenoidMagneticFieldProp,
        biotSavartLaw,
        bioSarvartLawForCircleCurrent,
        magnetic_field_circular_loop_on_axis,
        magnetic_field_circular_loop_general_point,
        magnetic_field_solenoid_by_summation_of_circular_loop,
      ],
    ),
    TheorySubcategory(
      name: '電気回路',
      topics: [
        rcCircuitTheory,
        rcCircuitDischarge,
        rcCircuitDischargeEnergy,
        rl_circuit,
        lc_circuit,
        rlc_circuit
      ],
    ),
    TheorySubcategory(
      name: 'インダクタンス',
      topics: [
        solenoid_self_inductance
      ],
    ),
    TheorySubcategory(
      name: '電磁気力を受ける質点の運動',
      topics: [
        lorentzForceAndCircleMove,
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
    TheorySubcategory(
      name: 'その他',
      topics: [
        rightHandRule,
      ],
    ),
  ],
};