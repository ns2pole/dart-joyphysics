// faraday_electromagnetic_induction_law.dart
import '../../model.dart';

final electromagneticInductionLaw = TheoryTopic(
    title: 'ファラデーの電磁誘導の法則',
    imageAsset: 'assets/mindMap/forTopics/electromagneticInductionLaw.png',
    latexContent: r"""
    <div class="theory-common-box">定義（磁束）</div>
    <p>
    磁束（磁束密度の面積分）を
    $$
    \Phi_B := \iint_S \vec B\cdot d\vec S
    $$
    と定義する。
    </p>
    <div class="theory-common-box">定義（誘導起電力）</div>
    <p>
    $$
    V := \oint_{\partial S} \vec{E}\cdot d\vec{r}
    $$
    は、電磁誘導によって生じる電場が単位電荷に対してする周回仕事を表す。これを誘導起電力という。
    </p>

    <div class="theory-common-box">定義（誘導電流）</div>
    <p>
    誘導起電力によって回路に電流が流れる場合、これを誘導電流という。
    </p>

    <div class="theory-common-box">電磁誘導の法則（積分形）</div>
    <p>
    「磁束の時間変化が単位電荷に対する周回仕事（誘導起電力）を生む」<br>
    この法則を電磁誘導の法則といい、下式で表される。
    $$
    \oint_{\partial S} \vec{E}\cdot d\vec{r} = -\frac{d}{dt}\iint_{S} \vec{B}\cdot d\vec{S}.
    $$
    ※ 面 $S$ の法線ベクトル $\vec{n}$ と境界 $\partial S$ の積分方向は右手則で連動して決める。<br>
    ※ 電磁誘導の法則は勿論物質中でも成り立ち、かつこのまま利用することが一般的である。
    </p>


    <div class="theory-common-box">命題（レンツの法則）</div>
    <p>
    電磁誘導の法則とアンペール・マクスウェルの法則より、誘導電流が流れる向きは、負号（$-$）の意味は「誘導電流の向きは、誘導電流が作る磁場が元の磁束変化を妨げる向き」である。
    </p>

    <div class="theory-common-box">補足：導体が運動する場合</div>
    <p>
    導体が運動する場合、回路にはローレンツ力による起電力が追加して発生する。<br>
    すなわち、面 $S(t)$ や境界 $\partial S(t)$ が時間発展する場合、境界上の各点の速度を $\vec v$ として運動項を含めると次の形になる。
    $$
    \oint_{\partial S(t)} (\vec E + \vec v\times\vec B)\cdot d\vec r = -\frac{d}{dt}\iint_{S(t)}\vec B\cdot d\vec S
    $$
    ※ 運動項 $\vec v\times\vec B$ による起電力もレンツの法則に従い、磁束変化に抗する向きの電流を生じさせる。
    </p>
    """,
);


// <div class="theory-common-box">補足（レイノルズの輸送定理）</div>
// <p>
// 磁束の全導関数はレイノルズの輸送定理により分解できる：
// $$
// \frac{d}{dt}\iint_{S(t)} \vec{B}\cdot d\vec{S}
// = \iint_{S(t)} \frac{\partial\vec{B}}{\partial t}\cdot d\vec{S}
// + \oint_{\partial S(t)} (\vec v\times\vec B)\cdot d\vec r.
// $$
// この分解と上の式を合わせることで、運動項の起源と局所形（微分形）との整合性が明確になる。
// </p>