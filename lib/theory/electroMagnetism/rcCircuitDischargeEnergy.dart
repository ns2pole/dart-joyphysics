import '../../model.dart';

final rcCircuitDischargeEnergy = TheoryTopic(
  title: 'RC回路の放電におけるエネルギー（簡潔命題版）',
  imageAsset: 'assets/mindMap/forTopics/rcCircuitDischarge.png',
  latexContent: r"""

<div class="theory-common-box">導入 — 方針</div>
本稿はまず**一般的な表式（時刻依存を仮定しない）**を簡潔な命題で示し、各命題の直後に証明を置きます。
続いて放電解 \(V_c(t)=V_0 e^{-t/RC}\) を代入して**具体的時間変化**に関する簡潔な命題と証明を示します。
記法は前稿に従います（\(V_c(0)=V_0,\;I(t)=C V_c'(t)\) 等）。

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1) 一般表式（命題と直後に証明）
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

<div class="theory-common-box">命題 A：コンデンサーのエネルギー</div>
$$\begin{aligned}
U_C &= \tfrac{1}{2} C V^2.
\end{aligned}$$

<div class="proof-box">証明（命題A）</div>
<p>
微小電荷 \( \mathrm{d}Q\) を移す仕事 \( \mathrm{d}W = V(Q)\,\mathrm{d}Q\) を積分する。
\(Q=C V\) を用いると
$$\begin{aligned}
U_C &= \int_0^{Q} \frac{Q'}{C}\,\mathrm{d}Q'
    = \tfrac{1}{2}\frac{Q^2}{C}
    = \tfrac{1}{2} C V^2.
\end{aligned}$$
Q.E.D
</p>

---

<div class="theory-common-box">命題 B：瞬時電力の定義と収支</div>
$$\begin{aligned}
P_R(t) &= R I(t)^2, \qquad
P_C(t) = V_c(t)\,I(t), \qquad
P_R(t)+P_C(t)=0.
\end{aligned}$$

<div class="proof-box">証明（命題B）</div>
<p>
キルヒホッフ式 \(R I + V_c = 0\) に \(I\) を掛けると
$$\begin{aligned}
R I^2 + V_c I = 0,
\end{aligned}$$
左辺は \(P_R+P_C\) に一致するため \(P_R+P_C=0\) が得られる。Q.E.D
</p>

---

<div class="theory-common-box">命題 C：エネルギー微分と瞬時電力</div>
$$\begin{aligned}
\frac{\mathrm{d}}{\mathrm{d}t}U_C(t) &= P_C(t),
\qquad
P_R(t) = -\frac{\mathrm{d}}{\mathrm{d}t}U_C(t).
\end{aligned}$$

<div class="proof-box">証明（命題C）</div>
<p>
\(U_C(t)=\tfrac12 C V_c(t)^2\) より
$$\begin{aligned}
\frac{\mathrm{d}}{\mathrm{d}t}U_C(t) &= C V_c V_c' .
\end{aligned}$$
一方 \(I= C V_c'\) なので \(P_C=V_c I = C V_c V_c'\)。
よって \( \dfrac{\mathrm{d}}{\mathrm{d}t}U_C = P_C\) であり、命題Bより \(P_R=-P_C=-\dfrac{\mathrm{d}}{\mathrm{d}t}U_C\) が従う。Q.E.D
</p>

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2) 具体的時間変化（放電解を代入）
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

<div class="theory-common-box">節：放電解の代入</div>
ここから \(V_c(t)=V_0 e^{-t/RC}\) を代入して時間依存を求める。

---

<div class="theory-common-box">命題 D：電流の時間依存（放電）</div>
$$\begin{aligned}
I(t) &= -\frac{V_0}{R}\,e^{-t/RC}.
\end{aligned}$$

<div class="proof-box">証明（命題D）</div>
<p>
\(I=C V_c'\) に \(V_c(t)=V_0 e^{-t/RC}\) を代入する。
$$\begin{aligned}
V_c'(t) &= -\frac{V_0}{RC} e^{-t/RC}, \\
I(t) &= C V_c'(t) = -\frac{V_0}{R} e^{-t/RC}.
\end{aligned}$$
符号は定義した正方向に対して逆である。Q.E.D
</p>

---

<div class="theory-common-box">命題 E：抵抗の瞬時消費電力（放電）</div>
$$\begin{aligned}
P_R(t) &= \frac{V_0^2}{R}\,e^{-2t/RC}.
\end{aligned}$$

<div class="proof-box">証明（命題E）</div>
<p>
命題D を \(P_R=R I^2\) に代入する：
$$\begin{aligned}
P_R(t)
&= R\left(-\frac{V_0}{R}e^{-t/RC}\right)^2
= \frac{V_0^2}{R}\,e^{-2t/RC}.
\end{aligned}$$
指数項が \(e^{-2t/RC}\) となる点に注意。Q.E.D
</p>

---

<div class="theory-common-box">命題 F：コンデンサー残エネルギー（放電）</div>
$$\begin{aligned}
U_C(t) &= U_0\,e^{-2t/RC}, \qquad U_0=\tfrac{1}{2}C V_0^2.
\end{aligned}$$

<div class="proof-box">証明（命題F）</div>
<p>
命題A に \(V=V_c(t)=V_0 e^{-t/RC}\) を代入する：
$$\begin{aligned}
U_C(t)
&= \tfrac{1}{2} C \bigl(V_0 e^{-t/RC}\bigr)^2
= \tfrac{1}{2} C V_0^2 e^{-2t/RC}
= U_0 e^{-2t/RC}.
\end{aligned}$$
Q.E.D
</p>

---

<div class="theory-common-box">命題 G：放出エネルギーと保存則（放電）</div>
$$\begin{aligned}
E_R(t) &= U_0\bigl(1-e^{-2t/RC}\bigr),
\qquad
U_C(t)+E_R(t)=U_0.
\end{aligned}$$

<div class="proof-box">証明（命題G）</div>
<p>
方法1：命題E を積分する。
$$\begin{aligned}
E_R(t)
&= \int_0^t \frac{V_0^2}{R} e^{-2t'/RC}\,\mathrm{d}t' \\
&= \frac{V_0^2}{R}\cdot\frac{RC}{2}\bigl(1-e^{-2t/RC}\bigr)
= U_0\bigl(1-e^{-2t/RC}\bigr).
\end{aligned}$$

方法2：命題C の \(P_R=-\dfrac{\mathrm{d}}{\mathrm{d}t}U_C\) を積分する。
$$\begin{aligned}
E_R(t)
&= -\int_0^t \frac{\mathrm{d}}{\mathrm{d}t'}U_C(t')\,\mathrm{d}t'
= U_0 - U_C(t).
\end{aligned}$$

両方法は一致し、常に \(U_C(t)+E_R(t)=U_0\) が成り立つ。Q.E.D
</p>

---

<div class="theory-common-box">短い物理的解説</div>
電圧が \(e^{-t/RC}\) で減衰するため，エネルギーは二乗に比例して \(e^{-2t/RC}\) の時間依存を持つ。
キルヒホッフ式に電流を掛ける手順は瞬時電力の収支を直接与え、積分でエネルギー保存を示す効率的な方法である。

<div class="theory-common-box">数値例（直感の確認）</div>
例えば \(C=10\mu\mathrm{F},\;R=1\mathrm{k}\Omega,\;V_0=5\mathrm{V}\) のとき：

$$\begin{aligned}
U_0 &= \tfrac12 C V_0^2 = 125\ \mu\mathrm{J}, \\[6pt]
\tau &= RC = 10\ \mathrm{ms}, \\[6pt]
P_R(0) &= \frac{V_0^2}{R} = 25\ \mathrm{mW}, \\[6pt]
U_C(\tau) &= U_0 e^{-2} \approx 0.135\ U_0.
\end{aligned}$$

<div class="theory-common-box">実務的注意</div>
実回路では寄生インダクタンス、漏れ、放射損失などが存在し、モデルの修正が必要になる場合がある。

<div class="theory-common-box">まとめ</div>
命題は簡潔に提示し、各命題直後に証明を配置しました。
一般表式 → 具体的時間変化 の順で議論を行い、すべてキルヒホッフ式に電流を掛ける流れで導出しています。

""",
);
