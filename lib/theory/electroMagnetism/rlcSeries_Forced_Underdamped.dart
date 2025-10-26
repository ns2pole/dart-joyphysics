import '../../model.dart';

final rlcSeries_Forced_Underdamped = TheoryTopic(
  title: '直列RLC：減衰振動のみ（α<ω₀）＋正弦印加 v=V₀ sin(ωt+θ) — キルヒホッフ→特殊解（天下り）→検算→一般解（D記号なし）',
  videoURL: "",
  // imageAsset: 'assets/mindMap/forTopics/rlcSeries.png',
  // iconName: "",
  latexContent: r"""

<div class="common-box">記号の定義</div>
\begin{aligned}
R &:= \text{抵抗},\quad
L := \text{インダクタンス},\quad
C := \text{キャパシタンス} \\[4pt]
q(t) &:= \text{コンデンサ電荷},\quad
i(t):=q'(t) \\[6pt]
\alpha &:= {\displaystyle \frac{R}{2L}},\quad
\omega_0:={\displaystyle \frac{1}{\sqrt{LC}}},\quad
\alpha<\omega_0\ \text{（減衰振動のみを扱う）} \\[6pt]
\omega_d &:= \sqrt{\omega_0^2-\alpha^2} \\[6pt]
v(t) &:= V_0\sin(\omega t+\theta)\quad(\text{印加電圧})
\end{aligned}

<div class="common-box">本記事の対象（微分方程式）</div>
\begin{aligned}
& L\,q''(t) \;+\; R\,q'(t) \;+\; {\displaystyle \frac{1}{C}}\,q(t)
\;=\; V_0\sin(\omega t+\theta)
\end{aligned}

<div class="theory-common-box">
命題（キルヒホッフによる回路方程式）：
直列に \(R,L,C\) を接続し，電源 \(v(t)=V_0\sin(\omega t+\theta)\) を印加したとき，回路の式は下記となる。
\begin{aligned}
& L\,q'' \;+\; R\,q' \;+\; {\displaystyle \frac{1}{C}}\,q \;=\; V_0\sin(\omega t+\theta)
\end{aligned}
</div>

<div class="proof-box">証明</div>
\begin{aligned}
& \text{回路一巡 }:\ v_R + v_L + v_C = v(t) \\[4pt]
& v_R = R i,\ \ v_L = L i',\ \ v_C = {\displaystyle \frac{1}{C}} q,\ \ i=q' \\[4pt]
\Rightarrow\ &
L q'' + R q' + {\displaystyle \frac{1}{C}} q = v(t)
\end{aligned}
Q.E.D.

<hr>

<div class="theory-common-box">
命題（特殊解：天下り提示・後で検算）：
減衰振動領域 \(\alpha<\omega_0\) のもとで，特殊解 \(q_p\) は下記で表される。
\begin{aligned}
q_p(t)
&= A\,\sin(\omega t+\theta)\;+\;B\,\cos(\omega t+\theta)
\end{aligned}
係数 \(A,B\) は下記となる。
\begin{aligned}
A &= {\displaystyle \frac{V_0\Bigl(\frac{1}{C}-L\omega^2\Bigr)}
           {\Bigl(\frac{1}{C}-L\omega^2\Bigr)^2+(R\omega)^2}}, \\[8pt]
B &= {\displaystyle -\,\frac{V_0(R\omega)}
           {\Bigl(\frac{1}{C}-L\omega^2\Bigr)^2+(R\omega)^2}}
\end{aligned}
</div>

<div class="proof-box">証明</div>
\begin{aligned}
q_p
&= A\sin(\omega t+\theta) \;+\; B\cos(\omega t+\theta) \\[6pt]
q_p'
&= A\omega\cos(\omega t+\theta) \;-\; B\omega\sin(\omega t+\theta) \\[6pt]
q_p''
&= -A\omega^2\sin(\omega t+\theta) \;-\; B\omega^2\cos(\omega t+\theta)
\end{aligned}
\begin{aligned}
& Lq_p'' \;+\; Rq_p' \;+\; {\displaystyle \frac{1}{C}}q_p \\[4pt]
=\, & \Bigl[-LA\omega^2 - RB\omega + {\displaystyle \tfrac{1}{C}}A\Bigr]\sin(\omega t+\theta) \\[2pt]
&\quad +\ \Bigl[-LB\omega^2 + RA\omega + {\displaystyle \tfrac{1}{C}}B\Bigr]\cos(\omega t+\theta)
\end{aligned}
\begin{aligned}
& \text{ここで }{\displaystyle \frac{1}{C}}-L\omega^2\ \text{をそのまま用いて} \\[2pt]
& \Bigl[\bigl({\textstyle \tfrac{1}{C}}-L\omega^2\bigr)A - (R\omega)B\Bigr]\sin(\omega t+\theta) \\[2pt]
&\quad +\ \Bigl[(R\omega)A + \bigl({\textstyle \tfrac{1}{C}}-L\omega^2\bigr)B\Bigr]\cos(\omega t+\theta)
\end{aligned}
\begin{aligned}
& A = {\displaystyle \frac{V_0\left(\frac{1}{C}-L\omega^2\right)}
                        {\left(\frac{1}{C}-L\omega^2\right)^2+(R\omega)^2}},\quad
  B = {\displaystyle -\,\frac{V_0(R\omega)}
                        {\left(\frac{1}{C}-L\omega^2\right)^2+(R\omega)^2}} \\[8pt]
\Rightarrow\ &
\Bigl(\tfrac{1}{C}-L\omega^2\Bigr)A - (R\omega)B
= {\displaystyle \frac{V_0\Bigl[\left(\frac{1}{C}-L\omega^2\right)^2+(R\omega)^2\Bigr]}
                       {\left(\frac{1}{C}-L\omega^2\right)^2+(R\omega)^2}}
= V_0 \\[8pt]
& (R\omega)A + \Bigl(\tfrac{1}{C}-L\omega^2\Bigr)B
= {\displaystyle \frac{V_0\Bigl[(R\omega)\!\left(\frac{1}{C}-L\omega^2\right)
 - \left(\frac{1}{C}-L\omega^2\right)(R\omega)\Bigr]}
 {\left(\frac{1}{C}-L\omega^2\right)^2+(R\omega)^2}}
= 0
\end{aligned}
\begin{aligned}
\therefore\quad
Lq_p'' + Rq_p' + {\displaystyle \frac{1}{C}}q_p
&= V_0\sin(\omega t+\theta)
\end{aligned}
Q.E.D.

<hr>

<div class="theory-common-box">
命題（定常電流の振幅・位相表示）：\(i_p=q_p'\) は下記で表される。
\begin{aligned}
i_p(t)= I_m\,\sin\bigl(\omega t+\theta+\phi\bigr)
\end{aligned}
ここで \(I_m,\phi\) は下記を満たす。
\begin{aligned}
I_m
&= {\displaystyle \frac{V_0}{\sqrt{\,R^2+\Bigl(\omega L-\frac{1}{\omega C}\Bigr)^2\,}}}, \\[8pt]
\phi
&= \arctan\!\Bigl({\displaystyle \frac{\frac{1}{C}-L\omega^2}{R\omega}}\Bigr)
\end{aligned}
</div>

<div class="proof-box">証明</div>

まず、前命題の \(q_p\) を微分する。

\begin{aligned}
q_p(t)
&= A\sin(\omega t+\theta)\;+\;B\cos(\omega t+\theta) \\[6pt]
i_p(t)
&= q_p'(t) \\[4pt]
&= A\omega\cos(\omega t+\theta)\;-\;B\omega\sin(\omega t+\theta) \\[6pt]
&= \omega\Bigl[\,-B\,\sin(\omega t+\theta)\;+\;A\,\cos(\omega t+\theta)\Bigr]
\end{aligned}

三角関数の合成より、ある \(I_m>0,\ \phi\) が存在して
\[
i_p(t)=I_m\,\sin\bigl((\omega t+\theta)+\phi\bigr)
\]
と書ける。係数比較を行う。

\begin{aligned}
I_m\cos\phi &= \omega(-B) \\[6pt]
I_m\sin\phi &= \omega A
\end{aligned}

ここから \(I_m,\ \tan\phi\) を求める。

\begin{aligned}
I_m
&= \omega\sqrt{A^2+B^2} \\[8pt]
\tan\phi
&= {\displaystyle \frac{I_m\sin\phi}{I_m\cos\phi}}
= {\displaystyle \frac{\omega A}{\omega(-B)}}
= -\,{\displaystyle \frac{A}{B}}
\end{aligned}

つぎに、前命題で与えた \(A,B\) を代入する。

\begin{aligned}
A
&= {\displaystyle \frac{V_0\Bigl(\frac{1}{C}-L\omega^2\Bigr)}
           {\Bigl(\frac{1}{C}-L\omega^2\Bigr)^2+(R\omega)^2}}, \\[8pt]
B
&= {\displaystyle -\,\frac{V_0(R\omega)}
           {\Bigl(\frac{1}{C}-L\omega^2\Bigr)^2+(R\omega)^2}}
\end{aligned}

\begin{aligned}
I_m
&= \omega\,
   {\displaystyle \frac{V_0\sqrt{\Bigl(\frac{1}{C}-L\omega^2\Bigr)^2+(R\omega)^2}}
                        {\Bigl(\frac{1}{C}-L\omega^2\Bigr)^2+(R\omega)^2}} \\[8pt]
&= {\displaystyle \frac{V_0\,\omega}
         {\sqrt{\Bigl(\frac{1}{C}-L\omega^2\Bigr)^2+(R\omega)^2}}} \\[8pt]
&= {\displaystyle \frac{V_0}
         {\sqrt{\,R^2+\Bigl(\omega L-\frac{1}{\omega C}\Bigr)^2\,}}}
\end{aligned}

\begin{aligned}
\tan\phi
&= -\,{\displaystyle \frac{A}{B}}
= {\displaystyle \frac{\frac{1}{C}-L\omega^2}{R\omega}}
\end{aligned}
Q.E.D.

<div class="theory-common-box">
命題（非斉次方程式の一般解：減衰振動のみ）：\(\alpha<\omega_0\) のとき，一般解 \(q\) は下記で表される。
\begin{aligned}
q(t)
&= q_h(t)\;+\;q_p(t)
\end{aligned}
ここで \(q_h\) は同次方程式の解（減衰振動のみ）で下記を満たす。
\begin{aligned}
q_h(t)
&= e^{-\alpha t}\Bigl(
C_1\cos\omega_d t \;+\; C_2\sin\omega_d t
\Bigr)
\end{aligned}
特殊解 \(q_p\) は下記で表される（係数 \(A,B\) を再掲）。
\begin{aligned}
q_p(t)
&= A\,\sin(\omega t+\theta)\;+\;B\,\cos(\omega t+\theta)
\end{aligned}
\begin{aligned}
A
&= {\displaystyle \frac{V_0\Bigl(\frac{1}{C}-L\omega^2\Bigr)}
           {\Bigl(\frac{1}{C}-L\omega^2\Bigr)^2+(R\omega)^2}} \\[8pt]
B
&= {\displaystyle -\,\frac{V_0(R\omega)}
           {\Bigl(\frac{1}{C}-L\omega^2\Bigr)^2+(R\omega)^2}}
\end{aligned}
初期条件 \(q(0)=q_0,\ i(0)=i_0\) のもとで，係数 \(C_1,C_2\) は下記を満たす。
\begin{aligned}
C_1 &= q_0 - q_p(0) \\[8pt]
C_2 &= {\displaystyle \frac{i_0 + \alpha\,C_1 - q_p'(0)}{\omega_d}}
\end{aligned}
※ \(q_p(0)=A\sin\theta + B\cos\theta,\ \ q_p'(0)=\omega(A\cos\theta - B\sin\theta)\) を用いる。
</div>

<div class="proof-box">証明</div>
\begin{aligned}
& \text{線形性より }q=q_h+q_p\text{ を方程式に代入} \\[2pt]
\Rightarrow\ &
\underbrace{(Lq_h''+Rq_h'+{\textstyle \tfrac{1}{C}}q_h)}_{=0}
\;+\;
\underbrace{(Lq_p''+Rq_p'+{\textstyle \tfrac{1}{C}}q_p)}_{=V_0\sin(\omega t+\theta)}
= V_0\sin(\omega t+\theta)
\end{aligned}
\begin{aligned}
& t=0\ \text{で } q(0)=q_h(0)+q_p(0)=q_0
\Rightarrow\ C_1 = q_0 - q_p(0) \\[6pt]
& i(0)=q'(0)=q_h'(0)+q_p'(0)=i_0,\ \ q_h'(0)=-\alpha C_1+\omega_d C_2 \\[2pt]
\Rightarrow\ &
\omega_d C_2 = i_0 - q_p'(0) + \alpha C_1
\ \Rightarrow\
C_2 = {\displaystyle \frac{i_0 + \alpha C_1 - q_p'(0)}{\omega_d}}
\end{aligned}
Q.E.D.

<div class="theory-common-box">補足</div>
本記事で用いた \(C_1, C_2\) は「斉次解 \(q_h(t)=e^{-\alpha t}\bigl(C_1\cos\omega_d t + C_2\sin\omega_d t\bigr)\) の係数」を表す記号である。数値は初期条件の入れ方が異なるため変わる。

（非斉次：強制あり，\(q(t)=q_h(t)+q_p(t)\)）
\begin{aligned}
\begin{cases}
C_1 &= q_0 - q_p(0) \\[6pt]
C_2 &= {\displaystyle \frac{i_0 + \alpha\,C_1 - q_p'(0)}{\omega_d}}
\end{cases}
\end{aligned}

（斉次：強制なし，\(q_p\equiv 0\)）
\begin{aligned}
\begin{cases}
C_1 &= q_0 \\[6pt]
C_2 &= {\displaystyle \frac{i_0 + \alpha\,q_0}{\omega_d}}
\end{cases}
\end{aligned}

線形性と解の一意性により，いずれの場合も与えられた初期条件に対して \(C_1, C_2\) はただ一組に定まる.

<hr>

<hr>

<!-- ▼▼▼ ここから追加：共振の項目前に「力率の定義」 ▼▼▼ -->
<div class="theory-common-box">
定義（力率）：
電圧 \(v(t)=V_0\sin(\omega t+\theta)\)，定常電流 \(i_p(t)=I_m\sin(\omega t+\theta+\phi)\) に対し，
力率（power factor）を
\[
\cos\phi \;=\; \frac{P_{\mathrm{avg}}}{V_{\mathrm{rms}}\,I_{\mathrm{rms}}}
\]
で定義する。ここで
\begin{aligned}
V_{\mathrm{rms}}&=\frac{V_0}{\sqrt{2}},\quad
I_{\mathrm{rms}}=\frac{I_m}{\sqrt{2}},\\[4pt]
P_{\mathrm{avg}}&=V_{\mathrm{rms}}\,I_{\mathrm{rms}}\cos\phi
=\frac{V_0 I_m}{2}\cos\phi
\end{aligned}
である。直列RLCではインピーダンスの大きさ
\[
|Z|=\sqrt{\,R^2+\Bigl(\omega L-\frac{1}{\omega C}\Bigr)^2\,}
\]
より
\[
\cos\phi=\frac{R}{|Z|}
=\frac{R}{\sqrt{\,R^2+\Bigl(\omega L-\frac{1}{\omega C}\Bigr)^2\,}}.
\]
付記：\(\phi>0\)（遅れ，誘導性），\(\phi<0\)（進み，容量性）。共振では \(\phi=0\) となり力率は \(1\)。
</div>

<div class="theory-common-box">
命題（共振周波数：減衰振動のみ）：
定常電流の振幅 \(I_m(\omega)=\displaystyle \frac{V_0}{\sqrt{\,R^2+\bigl(\omega L-\frac{1}{\omega C}\bigr)^2\,}}\) は，周波数$\omega$が
\(\displaystyle \frac{1}{\sqrt{LC}}\) のとき最大となる。<br>
またこの時、
\(\phi=\displaystyle 0\)，\(\ I_m(\omega_0)=\displaystyle \frac{V_0}{R}\)，
平均電力は \(\displaystyle P_{\mathrm{avg}}=\frac{V_0^{2}}{2R}\) となる。<br><br>
※この周波数を共振周波数という。
</div>

<div class="proof-box">証明</div>
分母は \(R^2+\bigl(\omega L-\displaystyle \frac{1}{\omega C}\bigr)^2\ge R^2\) で，等号は
\begin{aligned}
\omega L-\frac{1}{\omega C}
&= 0
\end{aligned}
のときに成り立つ。ゆえに
\(\displaystyle \omega^{2}=\frac{1}{LC}\) が導かれ，\(\displaystyle \omega_0=\frac{1}{\sqrt{LC}}\) と定義する。
このとき
\begin{aligned}
I_m(\omega_0)
&= \frac{V_0}{\sqrt{R^2+0}}
= \frac{V_0}{R}
\end{aligned}
となる。位相は
\(\displaystyle \phi=\arctan\!\bigl(\tfrac{\frac{1}{C}-L\omega^{2}}{R\omega}\bigr)\) より
\(\omega=\omega_0\) で \(\displaystyle \phi=0\)。平均電力は
\(\displaystyle P_{\mathrm{avg}}=V_{\mathrm{rms}} I_{\mathrm{rms}} \cos\phi
=\frac{V_0}{\sqrt{2}}\cdot\frac{I_m(\omega_0)}{\sqrt{2}}\cdot 1
=\frac{V_0^{2}}{2R}\)。Q.E.D.
"""
);
