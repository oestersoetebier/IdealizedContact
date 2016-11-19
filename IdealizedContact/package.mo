within ;
package IdealizedContact "Idealized Contact Library"
extends Modelica.Icons.Package;


  package UsersGuide "User's Guide of Idealized Contact Library"
  extends Modelica.Icons.Information;

    class ContactSurfaces "How to use the contact surfaces"
    extends Modelica.Icons.Information;
      annotation (preferredView="info",Documentation(info="<!DOCTYPE html><html>
<p>To describe elementary <a href=\"modelica://IdealizedContact.ContactSurfaces\">contact surfaces</a>, the library provides ready-to-use blocks. The surface definition represents a thin and massless layer, which can be connected to any kind of rigid body by a frame connector. The dimensions of the surface can be parameterized. In order to be able to use the dimensions in the contact block we introduce a new interface to connect the surface definition with a contact block. The figure shows the resulting shape of the contact area for all possible combinations that are analytically solved, as well as the number of contact points to describe it.</p>
<p><br><img src=\"modelica://IdealizedContact/Resources/Images/table_contactsurfaces.png\"/></p>
<p>Furthermore, the library offers the possibility to calculate contact points on convex surfaces using iterative Newton algorithm. These surfaces are described in a parametric form. Currently, the following <a href=\"modelica://IdealizedContact.ContactSurfaces.ParametricSurfaceDefinition\">parametric surfaces</a> are defined:</p>
<ul>
<li>spherical</li>
<li>ellipsoid</li>
<li>cylindrical</li>
<li>egg</li>
</ul>
<p><br>They can either collide with one another or with planar contact surfaces.</p>
</html>"));
    end ContactSurfaces;

    class ElementaryContactBodies "How to use the elementary contact bodies"
    extends Modelica.Icons.Information;
      annotation (preferredView="info",Documentation(info="<!DOCTYPE html><html>
<p>The library includes predefined, <a href=\"modelica://IdealizedContact.ElementaryContactBodies\">elementary bodies</a> like cuboids or cylinders which combine several contact surfaces and include a Multibody block. Each contact surface can be enabled separately. These do contain masses and moments of inertia, which are calculated by the dimensions and the density of the material. The Figure displays the<b> ElementaryContactBodies</b> that are currently available.</p>
<p><img src=\"modelica://IdealizedContact/Resources/Images/ElementaryContactBodies.png\"/> </p>
</html>"));
    end ElementaryContactBodies;

    class ContactBlock "How to use the contact block"
    extends Modelica.Icons.Information;
      annotation (preferredView="info",Documentation(info="<!DOCTYPE html><html>
<p>The <a href=\"modelica://IdealizedContact.ContactBlock.Contact\">contact block</a> calculates the appropriate force depending on the combination of surfaces. It is connected to a corresponding pair of contact surfaces. So, the respective combination of contact surfaces has to be chosen at first by setting the parameter contactDefinition. This will use the Modelica replaceable statement to define the appropriate components of the contact block. Then connect the contact interfaces of the two contact surfaces to the respective port of the contact block (first&nbsp;surface&nbsp;mentioned&nbsp;must&nbsp;be&nbsp;connected&nbsp;to&nbsp;port&nbsp;1).</p>
<p>In the case of a collision of the two connected surface (the contact condition holds for at least one contact point) a three-dimensional contact force is applied. It consists of both the normal force and the tangential friction. The respective directions can be obtained by means of the local coordinate systems in the contact points. As compared to more complex models, the continuous surface layer is replaced by a nonlinear spring/damper element. Consequently, the normal force Fn&nbsp;is determined by means of the penetration p&nbsp;and the penetration velocity. A continuous contact force model with hysteresis damping according to [9] is implemented. Nevertheless, choosing n1=1 and n=0&nbsp;one can get the linear Kelvin-Voigt model, where the coefficients are the spring and damping constant. Choosing n1=n2&nbsp;one will get the formulation according to [10].</p>
<p><img src=\"modelica://IdealizedContact/Resources/Images/equations/Fn.jpg\"/></p>
<p><br/>In order to calculate the friction forces without further discontinuous events, which would decrease the simulation speed and impede controller design, we use the continuously differentiable friction model of Makkar et al. [11]. They introduced the following function of the relative velocity&nbsp;to approximate the friction coefficient&nbsp;of the characteristic Stribeck curve.</p>
<p><img src=\"modelica://IdealizedContact/Resources/Images/equations/mue.jpg\"/></p>
<p>In doing so, no ideal static friction can be obtained because the actual force to be applied in the static state is independent from the relative velocity&nbsp;of the two bodies. Static friction is rather represented by sliding with very small relative velocities. To set the unknown constants gamma_i we use five parameters, which can be seen in the figure. The parameters mue_s&nbsp;and mue_k&nbsp;denote the coefficients of static and kinetic friction. The limit velocity v_e1&nbsp;and v_e2&nbsp;define the beginning of mixed and viscous friction. The latter is described by the proportionality factor k_v.</p>
<p><br/><br/><img src=\"modelica://IdealizedContact/Resources/Images/mue.jpg\"/></p>
<p><br/>The complete vector of the contact force is then computed as follows.</p>
<p><img src=\"modelica://IdealizedContact/Resources/Images/equations/Fcontact.jpg\"/></p>
<p><b>Note:</b> The collision of two cylinders can lead to linear or punctiform contact regions. The calculation for these two cases is currently separated in two blocks. Integration of the two blocks is in progress.</p>
<p><b>see <a href=\"modelica://IdealizedContact.UsersGuide.Literature\">Literature</a> for references.</b></p>
</html>"));
    end ContactBlock;

    class ContactInterface "How to use the contact interface"
    extends Modelica.Icons.Information;
      annotation (preferredView="info",Documentation(info="<!DOCTYPE html><html>
<p>In order to be able to use the dimensions of the contact surfaces in the contact block a new <a href=\"modelica://IdealizedContact.Interfaces\">interface</a> to connect the surface definition with a contact block  is introduced. This adds a scalar vector to the MultiBody frame of the Modelica Standard Library that comprises maximum three terms to describe the surface geometry and the three direction vectors to resolve them in the connected frame. The latter constitutes the body coordinate system (BCS) of the contact surface.</p>
</html>"));
    end ContactInterface;

    class ReleaseNotes "Release notes"
    extends Modelica.Icons.ReleaseNotes;
      annotation (preferredView="info", Documentation(info="<html>
<h4>Version 0.2.0, 2014-12-01</h4>
<p>Uses Modelica Standard Library 3.2.1 </p>
<p>The main changes are:</p>
<ul>
<li>Added numerical contact point calculation for parametric convex surfaces</li>
<li>New Types for contact surfaces</li>
<li>Extended contact interface with ContactSurfaceType</li>
<li>More Examples</li>
</ul>
<p><br><b>Former Versions:</b></p>
<h4>Version 0.1.0, 2014-01-24</h4>
<p>Uses Modelica Standard Library 3.2 </p>
<p>First version of the IdealizedContact library.</p>
<p><b>Note:</b> The collision of two cylinders can lead to linear or punctiform contact regions. The calculation for these two cases are currently separated in two blocks. Integration of the two blocks is in progress. </p>
<p><br><b>Licensed by Heinz Nixdorf Institute under the Modelica License 2</b></p>
<p><i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica license 2, see <a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a> or visit <a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p>
<p><br><b>Acknowledgements:</b> </p>
<p>This work was developed in the project ENTIME: Entwurfstechnik Intelligente Mechatronik (Design Methods for Intelligent Mechatronic Systems). The project ENTIME is funded by the state of North Rhine-Westphalia (NRW), Germany and the EUROPEAN UNION, European Regional Development Fund, Investing in your future. <a href=\"http://entime.upb.de/\">ENTIME</a> </p>
</html>"));
    end ReleaseNotes;

    class Literature "Literature"
    extends Modelica.Icons.References;
      annotation (preferredView="info", Documentation(info="<!DOCTYPE html><html>
<p>The first implementation of the library is described in:</p>
<p>Felix Oesters&ouml;tebier, Peng Wang and Ansgar Tr&auml;chtler: <b><a href=\"http://dx.doi.org/10.3384/ecp14096929\">A Modelica Contact Library for Idealized Simulation of Independently Defined Contact Surfaces</a></b> submitted to the <b>10th International Modelica Conference 2014</b> in Lund/Sweden.</p>
<p><br>It is furthermore based on the following theses:</p>
<dl><dt>Peng Wang:</dt>
<dd><b>Idealisierte Modellierung von Kontakten in Dymola/Modelica</b>. Date: 21.12.2011</dd>
<dd>Supervisor: Felix Oesters&ouml;tebier</dd></dl>
<dl><dt>Peng Wang:</dt>
<dd><b>Aufbau einer Kontaktbibliothek f&uuml;r einfache Kontaktgeometrien in Dymola/Modelica</b>. Date: 23.11.2012</dd>
<dd>Supervisor: Felix Oesters&ouml;tebier</dd></dl>
<dl><dt>Matthias Gringard:</dt>
<dd><b>Erweiterung der lehrstuhleigenen Modelica-Kontaktbibliothek um rotationssymmetrische K&ouml;rper</b>. Date: 27.02.2014</dd>
<dd>Supervisors: Felix Oesters&ouml;tebier, Peng Wang</dd></dl>
<p>And, it also refers to these publications:</p>
<p>[1] T. Juh&aacute;sz. Advanced Solutions in Object Oriented Mechatronic Simulation. Ph.D. Thesis, Dept. of Control Engineering and Information Technology, Budapest University of Technology and Economics, 2008</p>
<p>[2] M. Otter, H. Elmqvist, J. D&iacute;az L&oacute;pez. Collision Handling for the Modelica MultiBody Library. Proceedings of the 4th International Modelica Conference, Hamburg, March 7-8, 2005</p>
<p>[3] G. Hippmann. Modellierung von Kontakten komplex geformter K&ouml;rper in der Mehrk&ouml;rperdynamik. Ph.D. Thesis Vienna University of Technology, 2004</p>
<p>[4] F. Bauer, J. Gausemeier, D. K&ouml;chling, F. Oesters&ouml;tebier: Approach for an Early Validation of Mechatronic Systems using Idealized Simulation Models within the Conceptual Design, Proceedings of the 5th CIRP Conference on Industrial Product-Service Systems, Bochum, March 14-15, 2013</p>
<p>[5] K. L. Johnson. Contact Mechanics. Cambridge University Press, Cambridge, 1985</p>
<p>[6] J. J. Kalker. Three-dimensional elastic bodies in rolling contact. Kluwer Academic Publishers, Norwell, 1990</p>
<p>[7] W. Sextro. Dynamical contact problems with friction, Springer-Verlag, Berlin, Heidelberg, 2007</p>
<p>[8] D. W. Marhefka, D. E. Orin. A Compliant Contact Model with Nonlinear Damping for Simulation of Robotic Systems. IEEE Transactions on Systems, Man, and Cybernetics, 29(6), 1999</p>
<p>[9] H. M. Lankarani, P. E. Nikravesh: Continuous Contact Force Models for Impact Analysis in Multibody Systems, Nonlinear Dynamics, 5, 1994</p>
<p>[10] K. H. Hunt, F. R. E. Crossley: Coefficient of restitution interpreted as damping in vibroimpact, ASME J. Appl. Mech, 1975</p>
<p>[11] C. Makkar, W. E. Dixon, W. G. Sawyer, G. Hu: A New Continuously Differentiable Friction Model for Control Systems Design, Proceedings of the 2005 IEEE/ASME International Conference on Advanced Intelligent Mechatronics, Monterey CA, July, 2005</p>
<p>[12] V.L. Popov. Kontaktmechanik und Reibung, Springer-Verlag, Berlin, Heidelberg, 2009</p>
<p>[13] B. Roh, H. Aum, D. Bae, H. Cho, H. Sung: A Relative Contact Formulation for Multibody System Dynamics, KSME International Journal, 14(12): 1328-1336, 2000</p>
</html>"));
    end Literature;

    class Contact "Contact"
    extends Modelica.Icons.Contact;
      annotation (Documentation(info="<html>
<h4>Please contact:</h4>
<table cellspacing=\"5\" cellpadding=\"2\" border=\"0\" width=\"650\"><tr>
<td><p><a href=\"http://www.hni.uni-paderborn.de/en/control-engineering-and-mechatronics/staff/136187502734681/\">Peng Wang</a></p><p>Heinz Nixdorf Institute</p><p>University of Paderborn</p><p>Control Engineering and Mechatronics</p><p>F&uuml;rstenallee 11</p><p>33102 Paderborn</p><p>GERMANY</p><p>E-Mail: peng.wang(at)hni.upb.de</p></td>
<td valign=\"middle\"><p align=\"center\">and</p></td>
<td><p><a href=\"http://www.hni.uni-paderborn.de/en/control-engineering-and-mechatronics/staff/118900600706213/\">Felix Oesters&ouml;tebier</a></p><p>Heinz Nixdorf Institute</p><p>University of Paderborn</p><p>Control Engineering and Mechatronics</p><p>F&uuml;rstenallee 11</p><p>33102 Paderborn</p><p>GERMANY</p><p>E-Mail: felix.oestersoetebier(at)hni.upb.de</p></td>
</tr>
<tr>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td colspan=\"3\"><p><b><a href=\"http://www.hni.uni-paderborn.de/en/control-engineering-and-mechatronics\">http://www.hni.uni-paderborn.de/en/control-engineering-and-mechatronics/</a></b></p></td>
</tr>
<tr>
<td></td>
<td></td>
<td></td>
</tr>
</table>
</html>"),    preferredView="info");
    end Contact;

  class ModelicaLicense2 "Modelica License 2"
    extends Modelica.Icons.Information;

    annotation (preferredView="info",Documentation(info="<!DOCTYPE html><html>
<head>
<title>RealTimeCoordinationLibrary.UsersGuide.The Modelica License 2</title>
<style type=\"text/css\">
* { font-size: 10pt; font-family: Arial,sans-serif; }
code { font-size: 9pt; font-family: Courier,monospace;}
h6 { font-size: 10pt; font-weight: bold; color: green; }
h5 { font-size: 11pt; font-weight: bold; color: green; }
h4 { font-size: 13pt; font-weight: bold; color: green; }
address { font-weight: normal}
td { solid #000; vertical-align:top; }
th { solid #000; vertical-align:top; font-weight: bold; }
table { solid #000; border-collapse: collapse;}
</style>
</head>

<p>All files in this directory and in all
subdirectories are licensed by the <b><u>Heinz Nixdorf Institute</u></b> under the <b><u>Modelica License 2</u></b> .</p>

<p style=\"margin-left: 40px;\"><b>Licensor:</b><br>
Heinz Nixdorf Institute<br>
 <br>
 Control Engineering and Mechatronics <br>
University of Paderborn <br>
F&uuml;rstenallee 11, <br>
33102 Paderborn <br>
Germany<br>
web: <a href=\"https://www.hni.uni-paderborn.de/en/control-engineering-and-mechatronics/\">https://www.hni.uni-paderborn.de/en/control-engineering-and-mechatronics/</a><br>


<p>
<a href=\"#The_Modelica_License_2-outline\">The Modelica License 2</a><br>
<a href=\"#Frequently_Asked_Questions-outline\">Frequently Asked Questions</a><br>
</p>

<hr>

<h4><a name=\"The_Modelica_License_2-outline\"></a>The Modelica License 2</h4>

<p>
<b>Preamble.</b> The goal of this license is that Modelica related
model libraries, software, images, documents, data files etc. can be
used freely in the original or a modified form, in open source and in
commercial environments (as long as the license conditions below are
fulfilled, in particular sections 2c) and 2d). The Original Work is
provided free of charge and the use is completely at your own risk.
Developers of free Modelica packages are encouraged to utilize this
license for their work.</p>

<p>
The Modelica License applies to any Original Work that contains the
following licensing notice adjacent to the copyright notice(s) for
this Original Work:</p>

<p><b>Licensed by the Heinz Nixdorf Institute under the Modelica License 2</b></p>

<p><b>1. Definitions.</b></p>
<ol type=\"a\">
  <li>&ldquo;License&rdquo; is this Modelica License.</li>

  <li>&ldquo;Original Work&rdquo; is any work of authorship, including
  software, images, documents, data files, that contains the above
  licensing notice or that is packed together with a licensing notice
  referencing it.</li>

  <li>&ldquo;Licensor&rdquo; is the provider of the Original Work who has
  placed this licensing notice adjacent to the copyright notice(s) for
  the Original Work. The Original Work is either directly provided by
  the owner of the Original Work, or by a licensee of the owner.</li>

  <li>&ldquo;Derivative Work&rdquo; is any modification of the Original
  Work which represents, as a whole, an original work of authorship.
  For the matter of clarity and as examples:

  <ol type=\"A\">
    <li>Derivative Work shall not include work that remains separable from
    the Original Work, as well as merely extracting a part of the
    Original Work without modifying it.</li>

    <li>Derivative Work shall not include (a) fixing of errors and/or (b)
    adding vendor specific Modelica annotations and/or (c) using a
    subset of the classes of a Modelica package, and/or (d) using a
    different representation, e.g., a binary representation.</li>

    <li>Derivative Work shall include classes that are copied from the
    Original Work where declarations, equations or the documentation
    are modified.</li>

    <li>Derivative Work shall include executables to simulate the models
    that are generated by a Modelica translator based on the Original
    Work (of a Modelica package).</li>
  </ol>

  <li>&ldquo;Modified Work&rdquo; is any modification of the Original Work
  with the following exceptions: (a) fixing of errors and/or (b)
  adding vendor specific Modelica annotations and/or (c) using a
  subset of the classes of a Modelica package, and/or (d) using a
  different representation, e.g., a binary representation.</li>

  <li>&quot;Source Code&quot; means the preferred form of the Original
  Work for making modifications to it and all available documentation
  describing how to modify the Original Work.</li>

  <li>&ldquo;You&rdquo; means an individual or a legal entity exercising
  rights under, and complying with all of the terms of, this License.</li>

  <li>&ldquo;Modelica package&rdquo; means any Modelica library that is
  defined with the &ldquo;<code><b>package</b>&nbsp;&lt;Name&gt;&nbsp;...&nbsp;<b>end</b>&nbsp;&lt;Name&gt;;</code>&rdquo; Modelica language element.</li>

</ol>

<p>
<b>2. Grant of Copyright License.</b> Licensor grants You a
worldwide, royalty-free, non-exclusive, sublicensable license, for
the duration of the copyright, to do the following:</p>

<ol type=\"a\">
  <li><p>
  To reproduce the Original Work in copies, either alone or as part of
  a collection.</p></li>
  <li><p>
  To create Derivative Works according to Section 1d) of this License.</p></li>
  <li><p>
  To distribute or communicate to the public copies of the <u>Original
  Work</u> or a <u>Derivative Work</u> under <u>this License</u>. No
  fee, neither as a copyright-license fee, nor as a selling fee for
  the copy as such may be charged under this License. Furthermore, a
  verbatim copy of this License must be included in any copy of the
  Original Work or a Derivative Work under this License.<br>
  For the matter of clarity, it is permitted A) to distribute or
  communicate such copies as part of a (possible commercial)
  collection where other parts are provided under different licenses
  and a license fee is charged for the other parts only and B) to
  charge for mere printing and shipping costs.</p></li>
  <li><p>
  To distribute or communicate to the public copies of a <u>Derivative
  Work</u>, alternatively to Section 2c), under <u>any other license</u>
  of your choice, especially also under a license for
  commercial/proprietary software, as long as You comply with Sections
  3, 4 and 8 below. <br> For the matter of clarity, no
  restrictions regarding fees, either as to a copyright-license fee or
  as to a selling fee for the copy as such apply.</p></li>
  <li><p>
  To perform the Original Work publicly.</p></li>
  <li><p>
  To display the Original Work publicly.</p></li>
</ol>

<p>
<b>3. Acceptance.</b> Any use of the Original Work or a
Derivative Work, or any action according to either Section 2a) to 2f)
above constitutes Your acceptance of this License.</p>

<p>
<b>4. Designation of Derivative Works and of Modified Works.
</b>The identifying designation of Derivative Work and of Modified
Work must be different to the corresponding identifying designation
of the Original Work. This means especially that the (root-level)
name of a Modelica package under this license must be changed if the
package is modified (besides fixing of errors, adding vendor specific
Modelica annotations, using a subset of the classes of a Modelica
package, or using another representation, e.g. a binary
representation).</p>

<p>
<b>5. Grant of Patent License.</b>
Licensor grants You a worldwide, royalty-free, non-exclusive, sublicensable license,
under patent claims owned by the Licensor or licensed to the Licensor by
the owners of the Original Work that are embodied in the Original Work
as furnished by the Licensor, for the duration of the patents,
to make, use, sell, offer for sale, have made, and import the Original Work
and Derivative Works under the conditions as given in Section 2.
For the matter of clarity, the license regarding Derivative Works covers
patent claims to the extent as they are embodied in the Original Work only.</p>

<p>
<b>6. Provision of Source Code.</b> Licensor agrees to provide
You with a copy of the Source Code of the Original Work but reserves
the right to decide freely on the manner of how the Original Work is
provided.<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;For the matter of clarity, Licensor might provide only a binary
representation of the Original Work. In that case, You may (a) either
reproduce the Source Code from the binary representation if this is
possible (e.g., by performing a copy of an encrypted Modelica
package, if encryption allows the copy operation) or (b) request the
Source Code from the Licensor who will provide it to You.</p>

<p>
<b>7. Exclusions from License Grant.</b> Neither the names of
Licensor, nor the names of any contributors to the Original Work, nor
any of their trademarks or service marks, may be used to endorse or
promote products derived from this Original Work without express
prior permission of the Licensor. Except as otherwise expressly
stated in this License and in particular in Sections 2 and 5, nothing
in this License grants any license to Licensor&rsquo;s trademarks,
copyrights, patents, trade secrets or any other intellectual
property, and no patent license is granted to make, use, sell, offer
for sale, have made, or import embodiments of any patent claims.<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;No license is granted to the trademarks of
Licensor even if such trademarks are included in the Original Work,
except as expressly stated in this License. Nothing in this License
shall be interpreted to prohibit Licensor from licensing under terms
different from this License any Original Work that Licensor otherwise
would have a right to license.</p>

<p>
<b>8. Attribution Rights.</b> You must retain in the Source
Code of the Original Work and of any Derivative Works that You
create, all author, copyright, patent, or trademark notices, as well
as any descriptive text identified therein as an &quot;Attribution
Notice&quot;. The same applies to the licensing notice of this
License in the Original Work. For the matter of clarity, &ldquo;author
notice&rdquo; means the notice that identifies the original
author(s). <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;You must cause the Source Code for any Derivative
Works that You create to carry a prominent Attribution Notice
reasonably calculated to inform recipients that You have modified the
Original Work. <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;In case the Original Work or Derivative Work is not provided in
Source Code, the Attribution Notices shall be appropriately
displayed, e.g., in the documentation of the Derivative Work.</p>

<p><b>9. Disclaimer
of Warranty. <br></b><u><b>The Original Work is provided under this
License on an &quot;as is&quot; basis and without warranty, either
express or implied, including, without limitation, the warranties of
non-infringement, merchantability or fitness for a particular
purpose. The entire risk as to the quality of the Original Work is
with You.</b></u> This disclaimer of warranty constitutes an
essential part of this License. No license to the Original Work is
granted by this License except under this disclaimer.</p>

<p>
<b>10. Limitation of Liability.</b> Under no circumstances and
under no legal theory, whether in tort (including negligence),
contract, or otherwise, shall the Licensor, the owner or a licensee
of the Original Work be liable to anyone for any direct, indirect,
general, special, incidental, or consequential damages of any
character arising as a result of this License or the use of the
Original Work including, without limitation, damages for loss of
goodwill, work stoppage, computer failure or malfunction, or any and
all other commercial damages or losses. This limitation of liability
shall not apply to the extent applicable law prohibits such
limitation.</p>

<p>
<b>11. Termination.</b> This License conditions your rights to
undertake the activities listed in Section 2 and 5, including your
right to create Derivative Works based upon the Original Work, and
doing so without observing these terms and conditions is prohibited
by copyright law and international treaty. Nothing in this License is
intended to affect copyright exceptions and limitations. This License
shall terminate immediately and You may no longer exercise any of the
rights granted to You by this License upon your failure to observe
the conditions of this license.</p>

<p>
<b>12. Termination for Patent Action.</b> This License shall
terminate automatically and You may no longer exercise any of the
rights granted to You by this License as of the date You commence an
action, including a cross-claim or counterclaim, against Licensor,
any owners of the Original Work or any licensee alleging that the
Original Work infringes a patent. This termination provision shall
not apply for an action alleging patent infringement through
combinations of the Original Work under combination with other
software or hardware.</p>

<p>
<b>13. Jurisdiction.</b> Any action or suit relating to this
License may be brought only in the courts of a jurisdiction wherein
the Licensor resides and under the laws of that jurisdiction
excluding its conflict-of-law provisions. The application of the
United Nations Convention on Contracts for the International Sale of
Goods is expressly excluded. Any use of the Original Work outside the
scope of this License or after its termination shall be subject to
the requirements and penalties of copyright or patent law in the
appropriate jurisdiction. This section shall survive the termination
of this License.</p>

<p>
<b>14. Attorneys&rsquo; Fees.</b> In any action to enforce the
terms of this License or seeking damages relating thereto, the
prevailing party shall be entitled to recover its costs and expenses,
including, without limitation, reasonable attorneys' fees and costs
incurred in connection with such action, including any appeal of such
action. This section shall survive the termination of this License.</p>

<p>
<b>15. Miscellaneous.</b>
</p>
<ol type=\"a\">
  <li>If any
  provision of this License is held to be unenforceable, such
  provision shall be reformed only to the extent necessary to make it
  enforceable.</li>

  <li>No verbal
  ancillary agreements have been made. Changes and additions to this
  License must appear in writing to be valid. This also applies to
  changing the clause pertaining to written form.</li>

  <li>You may use the
  Original Work in all ways not otherwise restricted or conditioned by
  this License or by law, and Licensor promises not to interfere with
  or be responsible for such uses by You.</li>
</ol>

<hr>

<h5><a name=\"Frequently_Asked_Questions-outline\"></a>
Frequently Asked Questions</h5>
<p>This
section contains questions/answer to users and/or distributors of
Modelica packages and/or documents under Modelica License 2. Note,
the answers to the questions below are not a legal interpretation of
the Modelica License 2. In case of a conflict, the language of the
license shall prevail.</p>

<h6>Using or Distributing a Modelica <u>Package</u> under the Modelica License 2</h6>

<p><b>What are the main
differences to the previous version of the Modelica License?</b></p>
<ol>
  <li><p>
  Modelica License 1 is unclear whether the licensed Modelica package
  can be distributed under a different license. Version 2 explicitly
  allows that &ldquo;Derivative Work&rdquo; can be distributed under
  any license of Your choice, see examples in Section 1d) as to what
  qualifies as Derivative Work (so, version 2 is clearer).</p>
  <li><p>
  If You modify a Modelica package under Modelica License 2 (besides
  fixing of errors, adding vendor specific Modelica annotations, using
  a subset of the classes of a Modelica package, or using another
  representation, e.g., a binary representation), you must rename the
  root-level name of the package for your distribution. In version 1
  you could keep the name (so, version 2 is more restrictive). The
  reason of this restriction is to reduce the risk that Modelica
  packages are available that have identical names, but different
  functionality.</p>
  <li><p>
  Modelica License 1 states that &ldquo;It is not allowed to charge a
  fee for the original version or a modified version of the software,
  besides a reasonable fee for distribution and support&rdquo;.
  Version 2 has a similar intention for all Original Work under
  <u>Modelica License 2</u> (to remain free of charge and open source)
  but states this more clearly as &ldquo;No fee, neither as a
  copyright-license fee, nor as a selling fee for the copy as such may
  be charged&rdquo;. Contrary to version 1, Modelica License 2 has no
  restrictions on fees for Derivative Work that is provided under a
  different license (so, version 2 is clearer and has fewer
  restrictions).</p>
  <li><p>
  Modelica License 2 introduces several useful provisions for the
  licensee (articles 5, 6, 12), and for the licensor (articles 7, 12,
  13, 14) that have no counter part in version 1.</p>
  <li><p>
  Modelica License 2 can be applied to all type of work, including
  documents, images and data files, contrary to version 1 that was
  dedicated for software only (so, version 2 is more general).</p>
</ol>

<p><b>Can I distribute a
Modelica package (under Modelica License 2) as part of my commercial
Modelica modeling and simulation environment?</b></p>
<p>Yes,
according to Section 2c). However, you are not allowed to charge a
fee for this part of your environment. Of course, you can charge for
your part of the environment.
</p>

<p><b>Can I distribute a
Modelica package (under Modelica License 2) under a different
license?</b></p>
<p>No.
The license of an unmodified Modelica package cannot be changed
according to Sections 2c) and 2d). This means that you cannot <u>sell</u>
copies of it, any distribution has to be free of charge.</p>

<p><b>Can I distribute a
Modelica package (under Modelica License 2) under a different license
when I first encrypt the package?</b></p>
<p>No.
Merely encrypting a package does not qualify for Derivative Work and
therefore the encrypted package has to stay under Modelica License 2.</p>

<p><b>Can I distribute a
Modelica package (under Modelica License 2) under a different license
when I first add classes to the package?</b></p>
<p>No.
The package itself remains unmodified, i.e., it is Original Work, and
therefore the license for this part must remain under Modelica
License 2. The newly added classes can be, however, under a different
license.
</p>

<p><b>Can
I copy a class out of a Modelica package (under Modelica License 2)
and include it </b><u><b>unmodified</b></u><b> in a Modelica package
under a </b><u><b>commercial/proprietary license</b></u><b>?</b></p>
<p>No,
according to article 2c). However, you can include model, block,
function, package, record and connector classes in your Modelica
package under <u>Modelica License 2</u>. This means that your
Modelica package could be under a commercial/proprietary license, but
one or more classes of it are under Modelica License 2.<br>Note, a
&ldquo;type&rdquo; class (e.g., type Angle = Real(unit=&rdquo;rad&rdquo;))
can be copied and included unmodified under a commercial/proprietary
license (for details, see the next question).</p>

<p><b>Can
I copy a type class or </b><u><b>part</b></u><b> of a model, block,
function, record, connector class, out of a Modelica package (under
Modelica License 2) and include it modified or unmodified in a
Modelica package under a </b><u><b>commercial/proprietary</b></u><b>
license</b></p>
<p>Yes,
according to article 2d), since this will in the end usually qualify
as Derivative Work. The reasoning is the following: A type class or
part of another class (e.g., an equation, a declaration, part of a
class description) cannot be utilized &ldquo;by its own&rdquo;. In
order to make this &ldquo;usable&rdquo;, you have to add additional
code in order that the class can be utilized. This is therefore
usually Derivative Work and Derivative Work can be provided under a
different license. Note, this only holds, if the additional code
introduced is sufficient to qualify for Derivative Work. Merely, just
copying a class and changing, say, one character in the documentation
of this class would be no Derivative Work and therefore the copied
code would have to stay under Modelica License 2.</p>

<p><b>Can
I copy a class out of a Modelica package (under Modelica License 2)
and include it in </b><u><b>modified </b></u><b>form in a
</b><u><b>commercial/proprietary</b></u><b> Modelica package?</b></p>
<p>Yes.
If the modification can be seen as a &ldquo;Derivative Work&rdquo;,
you can place it under your commercial/proprietary license. If the
modification does not qualify as &ldquo;Derivative Work&rdquo; (e.g.,
bug fixes, vendor specific annotations), it must remain under
Modelica License 2. This means that your Modelica package could be
under a commercial/proprietary license, but one or more parts of it
are under Modelica License 2.</p>

<p><b>Can I distribute a
&ldquo;save total model&rdquo; under my commercial/proprietary
license, even if classes under Modelica License 2 are included?</b></p>
<p>Your
classes of the &ldquo;save total model&rdquo; can be distributed
under your commercial/proprietary license, but the classes under
Modelica License 2 must remain under Modelica License 2. This means
you can distribute a &ldquo;save total model&rdquo;, but some parts
might be under Modelica License 2.</p>

<p><b>Can I distribute a
Modelica package (under Modelica License 2) in encrypted form?</b></p>
<p>Yes.
Note, if the encryption does not allow &ldquo;copying&rdquo; of
classes (in to unencrypted Modelica source code), you have to send
the Modelica source code of this package to your customer, if he/she
wishes it, according to article&nbsp;6.</p>

<p><b>Can I distribute an
executable under my commercial/proprietary license, if the model from
which the executable is generated uses models from a Modelica package
under Modelica License 2?</b></p>
<p>Yes,
according to article 2d), since this is seen as Derivative Work. The
reasoning is the following: An executable allows the simulation of a
concrete model, whereas models from a Modelica package (without
pre-processing, translation, tool run-time library) are not able to
be simulated without tool support. By the processing of the tool and
by its run-time libraries, significant new functionality is added (a
model can be simulated whereas previously it could not be simulated)
and functionality available in the package is removed (e.g., to build
up a new model by dragging components of the package is no longer
possible with the executable).</p>

<p><b>Is my modification to
a Modelica package (under Modelica License 2) a Derivative Work?</b></p>
<p>It
is not possible to give a general answer to it. To be regarded as &quot;an
original work of authorship&quot;, a derivative work must be
different enough from the original or must contain a substantial
amount of new material. Making minor changes or additions of little
substance to a preexisting work will not qualify the work as a new
version for such purposes.
</p>

<h6>Using or Distributing a Modelica <u>Document</u> under the Modelica License 2</h6>

<p>This
section is devoted especially for the following applications:</p>
<ol type=\"a\">
  <li><p>
  A Modelica tool extracts information out of a Modelica package and
  presents the result in form of a &ldquo;manual&rdquo; for this
  package in, e.g., html, doc, or pdf format.</p>
  <li><p>
  The Modelica language specification is a document defining the
  Modelica language. It will be licensed under Modelica License 2.</p>
  <li><p>
  Someone writes a book about the Modelica language and/or Modelica
  packages and uses information which is available in the Modelica
  language specification and/or the corresponding Modelica package.</p>
</ol>

<p><b>Can I sell a manual
that was basically derived by extracting information automatically
from a Modelica package under Modelica License 2 (e.g., a &ldquo;reference
guide&rdquo; of the Modelica Standard Library):</b></p>
<p>Yes.
Extracting information from a Modelica package, and providing it in a
human readable, suitable format, like html, doc or pdf format, where
the content is significantly modified (e.g. tables with interface
information are constructed from the declarations of the public
variables) qualifies as Derivative Work and there are no restrictions
to charge a fee for Derivative Work under alternative 2d).</p>

<p><b>Can
I copy a text passage out of a Modelica document (under Modelica
License 2) and use it </b><u><b>unmodified</b></u><b> in my document
(e.g. the Modelica syntax description in the Modelica Specification)?</b></p>
<p>Yes.
In case you distribute your document, the copied parts are still
under Modelica License 2 and you are not allowed to charge a license
fee for this part. You can, of course, charge a fee for the rest of
your document.</p>

<p><b>Can
I copy a text passage out of a Modelica document (under Modelica
License 2) and use it in </b><u><b>modified</b></u><b> form in my
document?</b></p>
<p>Yes,
the creation of Derivative Works is allowed. In case the content is
significantly modified this qualifies as Derivative Work and there
are no restrictions to charge a fee for Derivative Work under
alternative 2d).</p>

<p><b>Can I sell a printed
version of a Modelica document (under Modelica License 2), e.g., the
Modelica Language Specification?</b></p>
<p>No,
if you are not the copyright-holder, since article 2c) does not allow
a selling fee for a (in this case physical) copy. However, mere
printing and shipping costs may be recovered.</p>
</html>"));
  end ModelicaLicense2;

    annotation (Documentation(info="<!DOCTYPE html><html>
<p>The<b> Idealized Contact</b> Library is a free Modelica package for modeling and handling of collisions in MultiBody Systems.</p>
<p>Modeling of multibody mechanics plays a central role in the design of mechatronic systems. In technical use-cases, these often contain loose couplings, where contact is possible. The IdealizedContact library is ready-to-use contact library for Modelica. It comprises surface definitions for simple contact surfaces, which can be connected with the multibodies of the Modelica Standard Library. It furthermore implements a force-based approach between single contact points. The contact forces are calculated in configurable non-central contact blocks. </p>
<p>The aim is to bring the designer in the position to perform simulations of industrial applications including contacts. Thereby, the analysis of the principle functional capability of the system in the course of the conceptual design is focused. This entails specialized modeling principles concerning the usability and the interpretation of the simulation results, which both should be relatively easy. In addition, it should be possible to define each component separately in order to be able to reuse and combine approved patterns in new applications (c.f. [4]).</p>
<p>Detailed explenations of the concept can be found in the respective <a href=\"modelica://IdealizedContact.UsersGuide.Literature\">Literature</a>. Exemplarily the results of chosen experiments are shown therein. They are compared with benchmark simulations in RecurDyn. </p>
<h4>Licensed under the Modelica License 2</h4>
<p><i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica license 2, see the license conditions (including the disclaimer of warranty) at <a href=\"http://www.Modelica.org/licenses/ModelicaLicense2\">http://www.Modelica.org/licenses/ModelicaLicense2</a>.</i> </p>
<p><br><b>Acknowledgements:</b> </p>
<p>This work was developed in the project ENTIME: Entwurfstechnik Intelligente Mechatronik (Design Methods for Intelligent Mechatronic Systems). The project ENTIME is funded by the state of North Rhine-Westphalia (NRW), Germany and the EUROPEAN UNION, European Regional Development Fund, Investing in your future. <a href=\"http://entime.upb.de/\">ENTIME</a> </p>
</html>"),   preferredView="info");
  end UsersGuide;


  package Examples "Basic examples"
  extends Modelica.Icons.ExamplesPackage;
    model Example1 "Sphere to sphere"
    extends Modelica.Icons.Example;
      inner Modelica.Mechanics.MultiBody.World world(
        enableAnimation=true,
        animateWorld=true,
        animateGravity=true)
        annotation (Placement(transformation(extent={{-78,-26},{-66,-14}})));
      Modelica.Mechanics.MultiBody.Joints.FreeMotion freeMotion(animation=false,
        angles_fixed=false,
        w_rel_a_fixed=false,
        enforceStates=true,
        r_rel_a(start={-0.1,0.3,0}, each fixed=true))
        annotation (Placement(transformation(extent={{-48,8},{-24,32}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation(animation=false,
        n={0,0,1},
        angle=0)
        annotation (Placement(transformation(extent={{-46,-26},{-34,-14}})));
      IdealizedContact.ContactBlock.Contact contact(
        n2=1,
        exact=true,
        p_max=0.001,
        dampingCoefficient=1000,
        n1=1,
        mue_s=0.2,
        springCoefficient=1000000,
        mue_k=0.2,
      redeclare IdealizedContact.ContactBlock.PunctiformContact.SphereToSphere                              contactDefinition
        "SphereToSphere")
        annotation (Placement(transformation(extent={{38,-10},{58,10}})));
      ElementaryContactBodies.SphericalContactBody sphericalContactBody(color={
            0,0,255})
        annotation (Placement(transformation(extent={{-4,6},{24,34}})));
      ElementaryContactBodies.SphericalContactBody sphericalContactBody1(color=
            {255,0,0}, radius=0.12)
        annotation (Placement(transformation(extent={{-4,-34},{24,-6}})));
    equation
      connect(freeMotion.frame_a,world. frame_b) annotation (Line(
          points={{-48,20},{-60,20},{-60,-20},{-66,-20}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedRotation.frame_a,world. frame_b) annotation (Line(
          points={{-46,-20},{-66,-20}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(freeMotion.frame_b, sphericalContactBody.frame_a) annotation (
          Line(
          points={{-24,20},{-17.5111,20},{-17.5111,20.28},{-1.76,20.28}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedRotation.frame_b, sphericalContactBody1.frame_a) annotation (
         Line(
          points={{-34,-20},{-18.5111,-20},{-18.5111,-19.72},{-1.76,-19.72}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));

      connect(sphericalContactBody.contact_a,contact. Port1) annotation (Line(
          points={{22.88,20},{47.2889,20},{47.2889,10.9},{48,10.9}},
          color={255,128,0},
          smooth=Smooth.None));
      connect(sphericalContactBody1.contact_a,contact. Port2) annotation (Line(
          points={{22.88,-20},{48.2889,-20},{48.2889,-11.1},{48,-11.1}},
          color={255,128,0},
          smooth=Smooth.None));

      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}),
                          graphics),experiment(StartTime=0, StopTime=1));
    end Example1;

    model Example2 "Sphere to cylinder"
    extends Modelica.Icons.Example;
      inner Modelica.Mechanics.MultiBody.World world(
        enableAnimation=true,
        animateWorld=false,
        animateGravity=true,
        gravityArrowLength=0.03,
        gravityArrowDiameter=0.003)
        annotation (Placement(transformation(extent={{-88,0},{-68,20}})));
      Modelica.Mechanics.MultiBody.Joints.FreeMotion freeMotion(animation=false,
        angles_fixed=false,
        w_rel_a_fixed=false,
        enforceStates=false,
        r_rel_a(start={0,0.05,0.0025}, each fixed=true))
        annotation (Placement(transformation(extent={{-48,40},{-28,60}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation(animation=false,
        n={0,1,0} "y axis",
        angle=0)
        annotation (Placement(transformation(extent={{-48,0},{-28,20}})));
      ElementaryContactBodies.SphericalContactBody
                                                 ball(color={255,0,0})
        annotation (Placement(transformation(extent={{-2,38},{22,62}})));
      ElementaryContactBodies.CylindricalContactBody
                                                   cylinder(color={0,0,255},
          surfaceColor={0,0,255},
        enableFrontSurface1=false,
        enableFrontSurface2=false)
        annotation (Placement(transformation(extent={{26,-12},{48,10}})));

      IdealizedContact.ContactBlock.Contact contact(
        p_max=0.005,
        mue_s=0.03,
        mue_k=0.02,
        f=10000,
        exact=true,
        n1=1.5,
        n2=1.4,
        springCoefficient=1e5,
        dampingCoefficient=5e4,
      redeclare
        IdealizedContact.ContactBlock.PunctiformContact.SphereToCylinder                            contactDefinition
        "SphereToCylinder")
        annotation (Placement(transformation(extent={{28,18},{48,38}})));
    equation
      connect(freeMotion.frame_a,world. frame_b) annotation (Line(
          points={{-48,50},{-58,50},{-58,10},{-68,10}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedRotation.frame_a,world. frame_b) annotation (Line(
          points={{-48,10},{-68,10}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(freeMotion.frame_b, ball.frame_a) annotation (Line(
          points={{-28,50},{-16,50},{-16,50.24},{-0.08,50.24}},
          color={95,95,95},
          pattern=LinePattern.None,
          thickness=0.5,
          smooth=Smooth.None));
      connect(cylinder.frame_a, fixedRotation.frame_b) annotation (Line(
          points={{31.06,-7.6},{34,-7.6},{34,-16},{0,-16},{0,10},{-28,10}},
          color={95,95,95},
          pattern=LinePattern.None,
          thickness=0.5,
          smooth=Smooth.None));
      connect(cylinder.contact_lateral,contact. Port2) annotation (Line(
          points={{37,6.48},{37,11.36},{38,11.36},{38,16.9}},
          color={255,128,0},
          thickness=1,
          smooth=Smooth.None));
      connect(ball.contact_a,contact. Port1) annotation (Line(
          points={{21.04,50},{37.2889,50},{37.2889,38.9},{38,38.9}},
          color={255,128,0},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}),
                          graphics),experiment(StartTime=0, StopTime=1));
    end Example2;

    model Example3 "Sphere to rectangle"
    extends Modelica.Icons.Example;
      inner Modelica.Mechanics.MultiBody.World world(
        enableAnimation=true,
        animateGravity=true,
        animateWorld=false)
        annotation (Placement(transformation(extent={{-88,0},{-68,20}})));
      Modelica.Mechanics.MultiBody.Joints.FreeMotion freeMotion(animation=false,
        angles_fixed=false,
        w_rel_a_fixed=false,
        enforceStates=false,
        r_rel_a(start={0,0.05,0}, each fixed=true))
        annotation (Placement(transformation(extent={{-34,46},{-14,66}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation(animation=false,
        n={0,0,1},
        r={0,-0.015,0},
        angle=5)
        annotation (Placement(transformation(extent={{-48,-50},{-28,-30}})));
      ElementaryContactBodies.SphericalContactBody
                                                 ball(color={255,0,0})
        annotation (Placement(transformation(extent={{6,46},{26,66}})));
      ElementaryContactBodies.CuboidContactBody          rectangle(
        color={0,0,255}, height=0.03,
        width=0.04,
        enableSurface2=false,
        enableSurface3=false,
        enableSurface4=false,
        enableSurface5=false,
        enableSurface6=false)
        annotation (Placement(transformation(extent={{-8,-60},{32,-20}})));
      IdealizedContact.ContactBlock.Contact contact(
        p_max=0.003,
        v_e2=0.05,
        n1=1,
        n2=1,
        mue_k=0.03,
        mue_s=0.03,
        springCoefficient=10000,
        exact=true,
        dampingCoefficient=1000000,
        redeclare
        IdealizedContact.ContactBlock.PunctiformContact.SphereToRectangle
          contactDefinition "SphereToRectangle")
        annotation (Placement(transformation(extent={{34,-6},{62,22}})));

    equation
      connect(freeMotion.frame_a,world. frame_b) annotation (Line(
          points={{-34,56},{-58,56},{-58,10},{-68,10}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedRotation.frame_a,world. frame_b) annotation (Line(
          points={{-48,-40},{-58,-40},{-58,10},{-68,10}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(freeMotion.frame_b, ball.frame_a) annotation (Line(
          points={{-14,56},{-14,56.2},{7.6,56.2}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedRotation.frame_b, rectangle.frame_a) annotation (Line(
          points={{-28,-40},{-16.2,-40},{-16.2,-25.6},{-4.4,-25.6}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(contact.Port2, rectangle.contact_a1) annotation (Line(
          points={{48,-7.54},{48,-14},{12,-14},{12,-23}},
          color={255,128,0},
          smooth=Smooth.None));
      connect(ball.contact_a,contact. Port1) annotation (Line(
          points={{25.2,56},{25.2,55.975},{48,55.975},{48,23.26}},
          color={255,128,0},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),
                          graphics),experiment(StartTime=0, StopTime=1));
    end Example3;

    model Example4 "Sphere to circle"
    extends Modelica.Icons.Example;
      inner Modelica.Mechanics.MultiBody.World world(animateGravity=false,
        enableAnimation=true,
        animateWorld=false)
        annotation (Placement(transformation(extent={{-84,0},{-64,20}})));
      Modelica.Mechanics.MultiBody.Joints.FreeMotion freeMotion(animation=false,
        angles_fixed=false,
        w_rel_a_fixed=false,
        r_rel_a(start={0,0.03,0}, each fixed=true),
        enforceStates=false)
        annotation (Placement(transformation(extent={{-44,40},{-24,60}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation(animation=false,
        n={-1,0,1},
        angle=-4)
        annotation (Placement(transformation(extent={{-44,0},{-24,20}})));
      ElementaryContactBodies.SphericalContactBody
                                                 ball(color={255,0,0}, radius=0.01)
        annotation (Placement(transformation(extent={{-4,42},{12,58}})));
      ElementaryContactBodies.CylindricalContactBody circle(              color=
           {0,0,255},
        diameter=0.06,
        length=0.01,
        enableLateralSurface=false,
        enableFrontSurface2=false,
        lengthDirection={0,1,0})
        annotation (Placement(transformation(extent={{-2,0},{16,24}})));
      IdealizedContact.ContactBlock.Contact contact(
        mue_k=0.03,
        springCoefficient=100000,
        p_max=0.002,
        n1=1,
        n2=1,
        dampingCoefficient=1000000,
        exact=true,
        redeclare
        IdealizedContact.ContactBlock.PunctiformContact.SphereToCircle
          contactDefinition "SphereToCircle")
        annotation (Placement(transformation(extent={{20,20},{40,40}})));
    equation
      connect(freeMotion.frame_a,world. frame_b) annotation (Line(
          points={{-44,50},{-54,50},{-54,10},{-64,10}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedRotation.frame_a,world. frame_b) annotation (Line(
          points={{-44,10},{-64,10}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(freeMotion.frame_b, ball.frame_a) annotation (Line(
          points={{-24,50},{-14.1333,50},{-14.1333,50.16},{-2.72,50.16}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedRotation.frame_b, circle.frame_a) annotation (Line(
          points={{-24,10},{-18,10},{-18,-2},{2.14,-2},{2.14,4.8}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(circle.contact_front1,contact. Port2) annotation (Line(
          points={{15.64,12},{30,12},{30,18.9}},
          color={255,128,0},
          thickness=1,
          smooth=Smooth.None));
      connect(ball.contact_a,contact. Port1) annotation (Line(
          points={{11.36,50},{30.4667,50},{30.4667,40.9},{30,40.9}},
          color={255,128,0},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}),
                          graphics),experiment(StartTime=0, StopTime=1));
    end Example4;

    model Example5 "Cylinder to rectangle"
    extends Modelica.Icons.Example;
      inner Modelica.Mechanics.MultiBody.World world(animateGravity=false,
        enableAnimation=true,
        animateWorld=false)
        annotation (Placement(transformation(extent={{-82,18},{-62,38}})));
      Modelica.Mechanics.MultiBody.Joints.FreeMotion freeMotion(animation=false,
        w_rel_a_fixed=false,
        enforceStates=false,
        r_rel_a(start={0,0.03,0}, each fixed=true),
        angles_fixed=true,
      angles_start={0,1.5707963267949,0})
        annotation (Placement(transformation(extent={{-46,18},{-26,38}})));
      IdealizedContact.ContactSurfaces.CylindricalContactSurface
                                                   cylinder(
        lengthDirection={1,0,0},
        length=0.03,
        color={0,180,0},
        diameter=0.025)
        annotation (Placement(transformation(extent={{4,18},{24,38}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation(animation=false,
        r={0,0.003,0},
        angle=4,
        n={1,0,0})
        annotation (Placement(transformation(extent={{-42,-22},{-22,-2}})));
      IdealizedContact.ContactSurfaces.RectangularPlaneContactSurface
                                                         rectangle(
        color={0,0,255},
        length=0.2,
        width=0.2)
        annotation (Placement(transformation(extent={{0,-22},{20,-2}})));
      IdealizedContact.ContactBlock.Contact contact(
        v_e1=0.01,
        redeclare
        IdealizedContact.ContactBlock.LinearContact.CylinderToRectangle
          contactDefinition "CylinderToRectangle",
        springCoefficient=50000,
        dampingCoefficient=5000,
        n1=1,
        p_max=0.01,
        exact=false,
        n2=0,
        mue_r=0,
        mue_k=0.05,
        mue_s=0.05)
        annotation (Placement(transformation(extent={{42,0},{58,16}})));

      Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape(
        animation=false,
        animateSphere=false,
        r={0,0,0},
        r_CM={0,0,0},
        m=2) annotation (Placement(transformation(extent={{-20,20},{-4,36}})));
    equation
      connect(freeMotion.frame_a, world.frame_b) annotation (Line(
          points={{-46,28},{-62,28}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedRotation.frame_a, world.frame_b) annotation (Line(
          points={{-42,-12},{-52,-12},{-52,28},{-62,28}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(freeMotion.frame_b, bodyShape.frame_a) annotation (Line(
          points={{-26,28},{-20,28}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(bodyShape.frame_b, cylinder.frame_a) annotation (Line(
          points={{-4,28},{4.4,28}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(cylinder.contact_a,contact. Port1) annotation (Line(
          points={{23.3,28},{50,28},{50,16.72}},
          color={255,128,0},
          thickness=0.5,
          smooth=Smooth.None));
      connect(rectangle.contact_a,contact. Port2) annotation (Line(
          points={{19.3,-12},{19.3,-11.95},{50,-11.95},{50,-0.88}},
          color={255,128,0},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedRotation.frame_b, rectangle.frame_a) annotation (Line(
          points={{-22,-12},{0.4,-12}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}),
                          graphics),experiment(StartTime=0, StopTime=1),
      __Dymola_experimentSetupOutput);
    end Example5;

    model Example6 "Cylinder to circle"
    extends Modelica.Icons.Example;
      inner Modelica.Mechanics.MultiBody.World world(
        enableAnimation=true,
        animateWorld=false,
        animateGravity=true,
        gravityArrowDiameter=0.005,
        gravityArrowLength=0.05)
        annotation (Placement(transformation(extent={{-82,-10},{-62,10}})));
      Modelica.Mechanics.MultiBody.Joints.FreeMotion freeMotion(animation=false,
        angles_fixed=false,
        w_rel_a_fixed=false,
        angles_start={0,0,0},
        r_rel_a(start={0.005*0,0.02,0}, each fixed=true))
        annotation (Placement(transformation(extent={{-42,30},{-22,50}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation(animation=false,
        angle=5,
        n={1,0,0})
        annotation (Placement(transformation(extent={{-42,-10},{-22,10}})));
      ElementaryContactBodies.CylindricalContactBody
                                                   cylinder(
        color={255,0,0},
        length=0.03,
        enableFrontSurface1=false,
        enableFrontSurface2=false)
        annotation (Placement(transformation(extent={{-2,30},{18,50}})));
      IdealizedContact.ContactSurfaces.CircularPlaneContactSurface disk(color={0,
            0,255}, diameter=0.08)
        annotation (Placement(transformation(extent={{-2,-10},{18,10}})));
      IdealizedContact.ContactBlock.Contact contact(
        redeclare IdealizedContact.ContactBlock.LinearContact.CylinderToCircle
          contactDefinition "CylinderToCircle",
        mue_r=0,
        f=10000,
        springCoefficient=5e3,
        dampingCoefficient=5e2,
        n1=1,
        p_max=0.003,
        exact=true,
        n2=0,
        mue_k=0.0275,
        mue_s=0.038)
        annotation (Placement(transformation(extent={{24,10},{44,30}})));
      Modelica.Mechanics.MultiBody.Sensors.RelativeSensor relativeSensor(
        get_r_rel=true,
        get_v_rel=true,
        get_w_rel=true,
        animation=false) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={78,28})));
    equation
      connect(freeMotion.frame_a,world. frame_b) annotation (Line(
          points={{-42,40},{-52,40},{-52,0},{-62,0}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedRotation.frame_a,world. frame_b) annotation (Line(
          points={{-42,0},{-62,0}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(freeMotion.frame_b, cylinder.frame_a) annotation (Line(
          points={{-22,40},{-10,40},{-10,34},{2.6,34}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(cylinder.contact_lateral,contact. Port1) annotation (Line(
          points={{8,46.8},{8,64},{34,64},{34,30.9}},
          color={255,128,0},
          thickness=1,
          smooth=Smooth.None));
      connect(disk.contact_a, contact.Port2) annotation (Line(
          points={{17.3,0},{33.85,0},{33.85,8.9},{34,8.9}},
          color={255,128,0},
          thickness=1,
          smooth=Smooth.None));
      connect(fixedRotation.frame_b, disk.frame_a) annotation (Line(
          points={{-22,0},{-1.6,0}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(relativeSensor.frame_a, world.frame_b) annotation (Line(
          points={{78,18},{78,-24},{-52,-24},{-52,0},{-62,0}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(relativeSensor.frame_b, freeMotion.frame_b) annotation (Line(
          points={{78,38},{78,78},{-10,78},{-10,40},{-22,40}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}),
                          graphics),experiment(StartTime=0, StopTime=1));
    end Example6;

    model Example7 "Rectangle to rectangle"
    extends Modelica.Icons.Example;
      import SI = Modelica.SIunits;
    parameter SI.Density density=7850;
    parameter SI.Length length=0.07;
    parameter SI.Length width=0.1;
    parameter SI.Length height=0.05;
      inner Modelica.Mechanics.MultiBody.World world(
        enableAnimation=true,
        animateGravity=true,
        animateWorld=false)
        annotation (Placement(transformation(extent={{-76,-10},{-56,10}})));
      Modelica.Mechanics.MultiBody.Joints.FreeMotion freeMotion(animation=false,
        angles_fixed=false,
        w_rel_a_fixed=false,
        r_rel_a(start={0,0.075,0}, each fixed=true),
        angles_start={0,0.5235987755983,0})
        annotation (Placement(transformation(extent={{-42,30},{-22,50}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation(animation=false,
        n={0,0,1},
        angle=15)
        annotation (Placement(transformation(extent={{-36,-10},{-16,10}})));
      IdealizedContact.ContactSurfaces.RectangularPlaneContactSurface
                                                         rectangle(length=length, width=
            width)
        annotation (Placement(transformation(extent={{10,30},{30,50}})));
      IdealizedContact.ContactSurfaces.RectangularPlaneContactSurface
                                                         rectangle1(
        color={0,0,255},
        length=0.2,
        width=0.25,
        lengthDirection={0,0,1},
        widthDirection={1,0,0})
        annotation (Placement(transformation(extent={{4,-10},{24,10}})));
      IdealizedContact.ContactBlock.Contact contact(
        mue_k=0.08,
        mue_s=0.12,
        redeclare
        IdealizedContact.ContactBlock.PlanarContact.RectangleToRectangle
          contactDefinition "RectangleToRectangle",
        n2=1,
        n1=1.1,
        v_e2=1.e-002,
        springCoefficient=10000000.,
        v_e1=1.e-004,
        p_max=0.005,
        f=10000,
        exact=true,
        radiusContactPoint=0.005,
        dampingCoefficient=500000.)
        annotation (Placement(transformation(extent={{30,10},{48,28}})));
      Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape1(
        r_CM={0,0,0},
        angles_fixed=false,
        animation=true,
        shapeType="box",
        animateSphere=false,
        r_0(fixed=false),
        m=density*length*height*width,
        I_11=density*length*height*width*(height^2 + width^2)/12,
        length=length,
        width=width,
        height=height,
        r={0,-height/2,0},
        r_shape=-length/2*{1,0,0},
        lengthDirection={1,0,0},
        widthDirection={0,0,1},
        color={255,0,0},
        I_22=density*length*height*width*(length^2 + width^2)/12,
        I_33=density*length*height*width*(length^2 + height^2)/12)
        annotation (Placement(transformation(extent={{-18,30},{2,50}})));
      Modelica.Mechanics.MultiBody.Sensors.RelativeSensor relativePosition(
        resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a,
        get_r_rel=true,
        get_v_rel=true,
        get_w_rel=true,
        get_angles=false,
        animation=false) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={72,24})));

    equation
      connect(freeMotion.frame_a,world. frame_b) annotation (Line(
          points={{-42,40},{-46,40},{-46,0},{-56,0}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedRotation.frame_a,world. frame_b) annotation (Line(
          points={{-36,0},{-56,0}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedRotation.frame_b, rectangle1.frame_a) annotation (Line(
          points={{-16,0},{4.4,0}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(freeMotion.frame_b, bodyShape1.frame_a) annotation (Line(
          points={{-22,40},{-18,40}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(bodyShape1.frame_b, rectangle.frame_a) annotation (Line(
          points={{2,40},{10.4,40}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(relativePosition.frame_a, world.frame_b) annotation (Line(
          points={{72,14},{72,-24},{-46,-24},{-46,0},{-56,0}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(relativePosition.frame_b, bodyShape1.frame_a) annotation (Line(
          points={{72,34},{72,64},{-20,64},{-20,40},{-18,40}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(rectangle1.contact_a,contact. Port2) annotation (Line(
          points={{23.3,0},{39.55,0},{39.55,9.01},{39,9.01}},
          color={255,128,0},
          smooth=Smooth.None));
      connect(rectangle.contact_a,contact. Port1) annotation (Line(
          points={{29.3,40},{29.3,40.05},{39,40.05},{39,28.81}},
          color={255,128,0},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),
                          graphics),experiment(StartTime=0, StopTime=1));
    end Example7;

    model Example8 "Circle to rectangle"
    extends Modelica.Icons.Example;
      inner Modelica.Mechanics.MultiBody.World world(
        enableAnimation=true,
        animateGravity=true,
        animateWorld=false)
        annotation (Placement(transformation(extent={{-84,20},{-64,40}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation(animation=false,
        angle=5,
        n={1,0,1})
        annotation (Placement(transformation(extent={{-44,-20},{-24,0}})));
      IdealizedContact.ContactSurfaces.RectangularPlaneContactSurface
                                                         rectangle(
        length=0.05,
        width=0.05,
        color={0,0,255})
        annotation (Placement(transformation(extent={{10,-20},{30,0}})));
      IdealizedContact.ContactSurfaces.CircularPlaneContactSurface
                                                    circle(
        diameter=0.03,
        color={255,0,0})
        annotation (Placement(transformation(extent={{10,20},{30,40}})));
      Modelica.Mechanics.MultiBody.Joints.FreeMotion freeMotion(
        animation=false,
        w_rel_a_fixed=false,
        angles_fixed=true,
        r_rel_a(start={0,0.025,0}, each fixed=true),
        angles_start={0,0.17453292519943,0})
        annotation (Placement(transformation(extent={{-44,20},{-24,40}})));
       IdealizedContact.ContactBlock.Contact contact(
        exact=true,
        redeclare IdealizedContact.ContactBlock.PlanarContact.CircleToRectangle
          contactDefinition "CircleToRectangle",
        p_max=0.01,
        n1=1,
        springCoefficient=3000,
        dampingCoefficient=1000,
        n2=0,
        k_v=0)
        annotation (Placement(transformation(extent={{36,0},{56,20}})));
      Modelica.Mechanics.MultiBody.Parts.BodyShape body2(
        r_CM={0,0,0},
        animation=false,
        animateSphere=false,
        m=5,
        r={0,0,0})
             annotation (Placement(transformation(extent={{-16,-18},{0,-2}})));
      Modelica.Mechanics.MultiBody.Parts.BodyShape body1(
        r_CM={0,0,0},
        animation=false,
        animateSphere=false,
        m=1,
        r={0,0,0},
        I_11=2/5*1*0.1,
        I_22=2/5*1*0.1,
        I_33=2/5*1*0.1)
             annotation (Placement(transformation(extent={{-14,22},{2,38}})));
    equation
      connect(fixedRotation.frame_a,world. frame_b) annotation (Line(
          points={{-44,-10},{-54,-10},{-54,30},{-64,30}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(freeMotion.frame_a, world.frame_b)  annotation (Line(
          points={{-44,30},{-64,30}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedRotation.frame_b,body2. frame_a) annotation (Line(
          points={{-24,-10},{-16,-10}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(freeMotion.frame_b, body1.frame_a) annotation (Line(
          points={{-24,30},{-14,30}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(rectangle.contact_a,contact. Port2) annotation (Line(
          points={{29.3,-10},{45.55,-10},{45.55,-1.1},{46,-1.1}},
          color={255,128,0},
          smooth=Smooth.None));
      connect(circle.contact_a,contact. Port1) annotation (Line(
          points={{29.3,30},{46.85,30},{46.85,20.9},{46,20.9}},
          color={255,128,0},
          smooth=Smooth.None));
      connect(body1.frame_b, circle.frame_a) annotation (Line(
          points={{2,30},{10.4,30}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(body2.frame_b, rectangle.frame_a) annotation (Line(
          points={{0,-10},{10.4,-10}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      annotation (Diagram(graphics),experiment(StartTime=0, StopTime=1));
    end Example8;

    model Example9 "Sphere to two rectangular surfaces"
    extends Modelica.Icons.Example;
      inner Modelica.Mechanics.MultiBody.World world(
        enableAnimation=true,
        animateWorld=true,
        animateGravity=true)
        annotation (Placement(transformation(extent={{-92,0},{-72,20}})));
      Modelica.Mechanics.MultiBody.Joints.FreeMotion freeMotion(animation=false,
        angles_fixed=false,
        w_rel_a_fixed=false,
        enforceStates=false,
        r_rel_a(start={0,0.1,0}, each fixed=true))
        annotation (Placement(transformation(extent={{-48,50},{-28,70}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation(animation=false,
        n={0,0,1},
        angle=-15)
        annotation (Placement(transformation(extent={{-52,-50},{-32,-30}})));
      ElementaryContactBodies.SphericalContactBody
                                                 ball(color={255,0,0})
        annotation (Placement(transformation(extent={{-10,46},{20,74}})));
      IdealizedContact.ContactSurfaces.RectangularPlaneContactSurface
                                                         rectangle(
        length=0.08,
        width=0.08)
        annotation (Placement(transformation(extent={{2,-26},{42,14}})));
       IdealizedContact.ContactBlock.Contact contact2(
        springCoefficient=10000,
        p_max=0.003,
        redeclare
        IdealizedContact.ContactBlock.PunctiformContact.SphereToRectangle
          contactDefinition "SphereToRectangle",
        dampingCoefficient=100,
        n1=1,
        n2=0)
        annotation (Placement(transformation(extent={{54,26},{78,50}})));

      IdealizedContact.ContactSurfaces.RectangularPlaneContactSurface
                                                         rectangle1(
        length=0.08,
        width=0.08)
        annotation (Placement(transformation(extent={{30,-92},{70,-52}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation1(
                                                                     animation=false,
        n={0,0,1},
        angle=90,
        r={0.04 - 0.0005,0,0})
        annotation (Placement(transformation(extent={{-4,-82},{16,-62}})));
       IdealizedContact.ContactBlock.Contact contact1(
        springCoefficient=10000,
        p_max=0.003,
        dampingCoefficient=500,
        redeclare
        IdealizedContact.ContactBlock.PunctiformContact.SphereToRectangle
          contactDefinition "SphereToRectangle",
        n1=1,
        n2=0)
        annotation (Placement(transformation(extent={{72,-38},{96,-14}})));

    equation
      connect(freeMotion.frame_a,world. frame_b) annotation (Line(
          points={{-48,60},{-60,60},{-60,10},{-72,10}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedRotation.frame_a,world. frame_b) annotation (Line(
          points={{-52,-40},{-60,-40},{-60,10},{-72,10}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(freeMotion.frame_b, ball.frame_a) annotation (Line(
          points={{-28,60},{-20.8889,60},{-20.8889,60.28},{-7.6,60.28}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(rectangle.contact_a, contact2.Port2)
                                                  annotation (Line(
          points={{40.6,-6},{40.6,-6},{66,-6},{66,24.68}},
          color={255,128,0},
          smooth=Smooth.None));
      connect(rectangle1.contact_a,contact1. Port2) annotation (Line(
          points={{68.6,-72},{68.6,-72.9},{84,-72.9},{84,-39.32}},
          color={255,128,0},
          smooth=Smooth.None));
      connect(fixedRotation1.frame_b, rectangle1.frame_a) annotation (Line(
          points={{16,-72},{30.8,-72}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedRotation1.frame_a, world.frame_b) annotation (Line(
          points={{-4,-72},{-60,-72},{-60,10},{-72,10}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedRotation.frame_b, rectangle.frame_a) annotation (Line(
          points={{-32,-40},{-16,-40},{-16,-6},{2.8,-6}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(ball.contact_a, contact2.Port1)
                                             annotation (Line(
          points={{18.8,60},{67.1111,60},{67.1111,51.08},{66,51.08}},
          color={255,128,0},
          smooth=Smooth.None));
      connect(ball.contact_a,contact1. Port1) annotation (Line(
          points={{18.8,60},{18.8,62.825},{84,62.825},{84,-12.92}},
          color={255,128,0},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}),
                          graphics),experiment(StartTime=0, StopTime=1));
    end Example9;

    model Example10 "Cylinder to Cylinder Point"
    extends Modelica.Icons.Example;

      inner Modelica.Mechanics.MultiBody.World world(animateGravity=false,
        enableAnimation=true,
        animateWorld=false)
        annotation (Placement(transformation(extent={{-80,-20},{-60,0}})));
      Modelica.Mechanics.MultiBody.Joints.FreeMotion freeMotion(animation=false,
        w_rel_a_fixed=false,
        enforceStates=false,
        angles_fixed=true,
        r_rel_a(start={0,0.03,0.005}, each fixed=true),
        angles_start={0.17453292519943,0.5235987755983,0})
        annotation (Placement(transformation(extent={{-40,20},{-20,40}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation(animation=false,
        n={1,0,0} "x axis",
        angle=0)
        annotation (Placement(transformation(extent={{-20,-20},{0,0}})));
      Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape(
        animation=false,
        animateSphere=false,
        r={0,0,0},
        r_CM={0,0,0},
        m=2) annotation (Placement(transformation(extent={{-12,22},{4,38}})));
      IdealizedContact.ContactBlock.Contact contact(
        redeclare
        IdealizedContact.ContactBlock.LinearContact.CylinderToCylinderPoint
          contactDefinition "CylinderToCylinderPoint",
        dampingCoefficient=3000,
        n1=1,
        n2=0) annotation (Placement(transformation(extent={{40,0},{60,20}})));
      ContactSurfaces.CylindricalContactSurface cylindricalContactSurface(
        diameter=0.02,
        length=0.04,
        color={255,0,0})
        annotation (Placement(transformation(extent={{12,20},{32,40}})));
      ContactSurfaces.CylindricalContactSurface cylindricalContactSurface1(
          diameter=0.02, color={0,0,255})
        annotation (Placement(transformation(extent={{12,-20},{32,0}})));
    equation
      connect(freeMotion.frame_a,world. frame_b) annotation (Line(
          points={{-40,30},{-48,30},{-48,-10},{-60,-10}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedRotation.frame_a,world. frame_b) annotation (Line(
          points={{-20,-10},{-60,-10}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(freeMotion.frame_b,bodyShape. frame_a) annotation (Line(
          points={{-20,30},{-12,30}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(cylindricalContactSurface.frame_a, bodyShape.frame_b) annotation (
         Line(
          points={{12.4,30},{4,30}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(cylindricalContactSurface1.frame_a, fixedRotation.frame_b)
        annotation (Line(
          points={{12.4,-10},{0,-10}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(cylindricalContactSurface.contact_a, contact.Port1) annotation (
          Line(
          points={{31.3,30},{50,30},{50,20.9}},
          color={255,128,0},
          smooth=Smooth.None));
      connect(cylindricalContactSurface1.contact_a, contact.Port2) annotation (
          Line(
          points={{31.3,-10},{50,-10},{50,-1.1}},
          color={255,128,0},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=true,  extent={{-100,
                -100},{100,100}}),
                          graphics),experiment(StartTime=0, StopTime=1));
    end Example10;

    model Example11 "Cylinder to cylinder"
    extends Modelica.Icons.Example;

      IdealizedContact.ContactSurfaces.CylindricalContactSurface
                                                   cylinder(
        color={255,0,0},
        length=0.04,
        diameter=0.02)
        annotation (Placement(transformation(extent={{-10,20},{10,40}})));
      IdealizedContact.ContactSurfaces.CylindricalContactSurface
                                                   cylinder1(color={0,0,255},
          diameter=0.02)
        annotation (Placement(transformation(extent={{-10,-20},{10,0}})));
      inner Modelica.Mechanics.MultiBody.World world(animateGravity=false,
        enableAnimation=true,
        animateWorld=false)
        annotation (Placement(transformation(extent={{-90,-20},{-70,0}})));
      Modelica.Mechanics.MultiBody.Joints.FreeMotion freeMotion(animation=false,
        w_rel_a_fixed=false,
        enforceStates=false,
        angles_fixed=true,
        angles_start={0,0,0},
        r_rel_a(start={0,0.1,-0.01}, each fixed=true))
        annotation (Placement(transformation(extent={{-56,20},{-36,40}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation(animation=false,
        n={0,0,1},
        angle=0)
        annotation (Placement(transformation(extent={{-50,-20},{-30,0}})));
      IdealizedContact.ContactBlock.Contact contact(
        n1=1,
        n2=0,
        redeclare
        IdealizedContact.ContactBlock.LinearContact.CylinderToCylinderLine
          contactDefinition "CylinderToCylinderLine",
        exact=false,
        mue_k=0.1,
        mue_s=0.1,
        p_max=0.01,
        springCoefficient=100000,
        dampingCoefficient=500,
        mue_r=0.1)
        annotation (Placement(transformation(extent={{28,0},{48,20}})));

      Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape(
        animation=false,
        animateSphere=false,
        r={0,0,0},
        r_CM={0,0,0},
        m=2) annotation (Placement(transformation(extent={{-30,22},{-14,38}})));
    equation
      connect(freeMotion.frame_a,world. frame_b) annotation (Line(
          points={{-56,30},{-60,30},{-60,-10},{-70,-10}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedRotation.frame_a,world. frame_b) annotation (Line(
          points={{-50,-10},{-70,-10}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(freeMotion.frame_b, bodyShape.frame_a) annotation (Line(
          points={{-36,30},{-30,30}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(bodyShape.frame_b, cylinder.frame_a) annotation (Line(
          points={{-14,30},{-9.6,30}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedRotation.frame_b, cylinder1.frame_a) annotation (Line(
          points={{-30,-10},{-9.6,-10}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(cylinder.contact_a,contact. Port1) annotation (Line(
          points={{9.3,30},{38,30},{38,20.9}},
          color={255,128,0},
          smooth=Smooth.None));
      connect(cylinder1.contact_a,contact. Port2) annotation (Line(
          points={{9.3,-10},{38,-10},{38,-1.1}},
          color={255,128,0},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),
                          graphics),experiment(StartTime=0, StopTime=1));
    end Example11;

    model Example12 "Cylinder to Cylinder Point"
    extends Modelica.Icons.Example;

      inner Modelica.Mechanics.MultiBody.World world(animateGravity=false,
        enableAnimation=true,
        animateWorld=false)
        annotation (Placement(transformation(extent={{-80,-20},{-60,0}})));
      Modelica.Mechanics.MultiBody.Joints.FreeMotion freeMotion(animation=false,
        enforceStates=false,
        angles_fixed=true,
        r_rel_a(start={0,0.03,0.005}, each fixed=true),
        w_rel_a_fixed=false,
        angles_start=0*{10,30,0})
        annotation (Placement(transformation(extent={{-40,20},{-20,40}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation(animation=false,
        n={0,1,0},
        angle=0)
        annotation (Placement(transformation(extent={{-20,-20},{0,0}})));
      Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape(
        animation=false,
        animateSphere=false,
        r={0,0,0},
        r_CM={0,0,0},
        m=2) annotation (Placement(transformation(extent={{-12,22},{4,38}})));
      IdealizedContact.ContactBlock.Contact contact(
        dampingCoefficient=3000,
        n1=1,
        n2=0,
        redeclare
        IdealizedContact.ContactBlock.LinearContact.CylinderToCylinderCombined
          contactDefinition "CylinderToCylinderCombined")
              annotation (Placement(transformation(extent={{40,0},{60,20}})));
      ContactSurfaces.CylindricalContactSurface cylindricalContactSurface(
        diameter=0.02,
        length=0.04,
        color={255,0,0})
        annotation (Placement(transformation(extent={{12,20},{32,40}})));
      ContactSurfaces.CylindricalContactSurface cylindricalContactSurface1(
          diameter=0.02, color={0,0,255})
        annotation (Placement(transformation(extent={{12,-20},{32,0}})));
    equation
      connect(freeMotion.frame_a,world. frame_b) annotation (Line(
          points={{-40,30},{-48,30},{-48,-10},{-60,-10}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedRotation.frame_a,world. frame_b) annotation (Line(
          points={{-20,-10},{-60,-10}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(freeMotion.frame_b,bodyShape. frame_a) annotation (Line(
          points={{-20,30},{-12,30}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(cylindricalContactSurface.frame_a, bodyShape.frame_b) annotation (
         Line(
          points={{12.4,30},{4,30}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(cylindricalContactSurface1.frame_a, fixedRotation.frame_b)
        annotation (Line(
          points={{12.4,-10},{0,-10}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(cylindricalContactSurface.contact_a, contact.Port1) annotation (
          Line(
          points={{31.3,30},{50,30},{50,20.9}},
          color={255,128,0},
          smooth=Smooth.None));
      connect(cylindricalContactSurface1.contact_a, contact.Port2) annotation (
          Line(
          points={{31.3,-10},{50,-10},{50,-1.1}},
          color={255,128,0},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=true,  extent={{-100,
                -100},{100,100}}),
                          graphics),experiment(StartTime=0, StopTime=1));
    end Example12;

    model Example13 "Ellipsoid spinning on a plane"
    extends Modelica.Icons.Example;

      inner Modelica.Mechanics.MultiBody.World world(
        enableAnimation=true,
        animateWorld=true,
        animateGravity=true)
        annotation (Placement(transformation(extent={{-86,-6},{-74,6}})));
      IdealizedContact.ContactBlock.Contact contact(
        n2=1,
        exact=true,
        p_max=0.001,
        n1=1,
        springCoefficient=1000000000000,
      dampingCoefficient=1000,
      redeclare IdealizedContact.ContactBlock.PunctiformContact.ConvexToPlane
        contactDefinition "ConvexToPlane")
        annotation (Placement(transformation(extent={{68,-10},{88,10}})));
      ContactSurfaces.RectangularPlaneContactSurface rectangularContactSurface(
        length=10,
        width=10,
        animation_BCS=false)
        annotation (Placement(transformation(extent={{20,-50},{40,-30}})));
      IdealizedContact.ElementaryContactBodies.EllipsoidContactBody Ellipsoid(
      a=0.1,
      b=0.2,
      c=0.3) annotation (Placement(transformation(extent={{40,30},{60,50}})));
      Modelica.Mechanics.MultiBody.Joints.FreeMotion freeMotion(animation=false,
      w_rel_a_fixed=false,
      w_rel_a_start=0*{8,0,50})
        annotation (Placement(transformation(extent={{0,30},{20,50}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation(
        animation=false, r={2.45,0.3,-2.45})
        annotation (Placement(transformation(extent={{-40,30},{-20,50}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation1(n={0,0,1},
          angle=-1)
        annotation (Placement(transformation(extent={{-40,-50},{-20,-30}})));
    equation

      connect(rectangularContactSurface.contact_a, contact.Port2) annotation (Line(
          points={{39.3,-40},{78,-40},{78,-11.1}},
          color={255,128,0},
          smooth=Smooth.None));
    connect(Ellipsoid.contact_a, contact.Port1) annotation (Line(
        points={{60,40},{78,40},{78,10.9}},
        color={255,128,0},
        smooth=Smooth.None));
    connect(freeMotion.frame_b, Ellipsoid.frame_a) annotation (Line(
        points={{20,40},{40,40}},
        color={95,95,95},
        thickness=0.5,
        smooth=Smooth.None));
      connect(fixedRotation.frame_a, world.frame_b) annotation (Line(
          points={{-40,40},{-40,40},{-58,40},{-58,40},{-60,40},{-60,0},{-74,0}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedRotation.frame_b, freeMotion.frame_a) annotation (Line(
          points={{-20,40},{0,40}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(world.frame_b, fixedRotation1.frame_a) annotation (Line(
          points={{-74,0},{-60,0},{-60,-40},{-40,-40}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedRotation1.frame_b, rectangularContactSurface.frame_a)
        annotation (Line(
          points={{-20,-40},{20.4,-40}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=true,  extent={{-100,
                -100},{100,100}}),
                          graphics),
        experiment(StartTime=0,StopTime=10, Tolerance=1e-006),
        __Dymola_experimentSetupOutput);
    end Example13;

    model Example14 "Ball with gyroscopic movement on a plane"
    extends Modelica.Icons.Example;

      inner Modelica.Mechanics.MultiBody.World world(
        enableAnimation=true,
        animateWorld=true,
        animateGravity=true)
        annotation (Placement(transformation(extent={{-92,-6},{-80,6}})));
      IdealizedContact.ContactBlock.Contact contact(
        n2=1,
        exact=true,
        p_max=0.001,
        n1=1,
        springCoefficient=1000000000000,
        dampingCoefficient=100000000,
      redeclare IdealizedContact.ContactBlock.PunctiformContact.ConvexToPlane contactDefinition
        "ConvexToPlane")
        annotation (Placement(transformation(extent={{70,-10},{90,10}})));
      ContactSurfaces.RectangularPlaneContactSurface rectangularContactSurface(
      animation_BCS=false,
      length=0.1*15,
      width=0.2*15)        annotation (Placement(transformation(extent={{16,-50},{36,-30}})));
      ElementaryContactBodies.ConvexContactBody                     Ellipsoid(
      color={255,0,255},
      convexContactShape="spherical",
      r_CM={0,0,0},
      h={0.1,0.5,0.2},
      m=0.2)             annotation (Placement(transformation(extent={{50,30},{
              70,50}})));
      Modelica.Mechanics.MultiBody.Joints.FreeMotion freeMotion(animation=false,
        w_rel_a_fixed=true,
        w_rel_a_start={0,10,0})
        annotation (Placement(transformation(extent={{16,30},{36,50}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation(
        animation=false,
        r={0,0.2,0},
        n={0,0,1},
        angle=5)
        annotation (Placement(transformation(extent={{-66,30},{-46,50}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation1
        annotation (Placement(transformation(extent={{-40,-50},{-20,-30}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation2(
        animation=false)
        annotation (Placement(transformation(extent={{-40,30},{-20,50}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation3(
        animation=false)
        annotation (Placement(transformation(extent={{-14,30},{6,50}})));
    equation

    connect(rectangularContactSurface.contact_a, contact.Port2)
      annotation (Line(
        points={{35.3,-40},{80,-40},{80,-11.1}},
        color={255,128,0},
        smooth=Smooth.None));
    connect(Ellipsoid.contact_a, contact.Port1) annotation (Line(
        points={{70,40},{80,40},{80,10.9}},
        color={255,128,0},
        smooth=Smooth.None));
    connect(freeMotion.frame_b, Ellipsoid.frame_a) annotation (Line(
        points={{36,40},{50,40}},
        color={95,95,95},
        thickness=0.5,
        smooth=Smooth.None));
      connect(fixedRotation.frame_a, world.frame_b) annotation (Line(
          points={{-66,40},{-70,40},{-70,0},{-80,0}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(world.frame_b, fixedRotation1.frame_a) annotation (Line(
          points={{-80,0},{-70,0},{-70,-40},{-40,-40}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
    connect(fixedRotation1.frame_b, rectangularContactSurface.frame_a)
      annotation (Line(
        points={{-20,-40},{16.4,-40}},
        color={95,95,95},
        thickness=0.5,
        smooth=Smooth.None));
      connect(fixedRotation2.frame_a, fixedRotation.frame_b) annotation (Line(
          points={{-40,40},{-46,40}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedRotation3.frame_a, fixedRotation2.frame_b) annotation (Line(
          points={{-14,40},{-20,40}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedRotation3.frame_b, freeMotion.frame_a) annotation (Line(
          points={{6,40},{16,40}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}),
                          graphics),
        experiment(StartTime=0,StopTime=5, Tolerance=1e-006),
        __Dymola_experimentSetupOutput);
    end Example14;

    model Example15 "Contact Ellipsoid-Ellipsoid"
    extends Modelica.Icons.Example;

      inner Modelica.Mechanics.MultiBody.World world(
        enableAnimation=true,
        animateWorld=true,
        animateGravity=true)
        annotation (Placement(transformation(extent={{-86,-6},{-74,6}})));
      IdealizedContact.ContactBlock.Contact contact(
        exact=true,
        n1=1,
        springCoefficient=1e9,
        dampingCoefficient=10000,
        n2=0,
        p_max=0.005,
        radiusContactPoint=0.025,
      redeclare IdealizedContact.ContactBlock.PunctiformContact.ConvexToConvex contactDefinition
        "ConvexToConvex")
        annotation (Placement(transformation(extent={{70,-10},{90,10}})));
      Modelica.Mechanics.MultiBody.Joints.FreeMotion freeMotion(animation=false,
        w_rel_a_start={1,2,3},
      r_rel_a(fixed=true),
      w_rel_a_fixed=false)
        annotation (Placement(transformation(extent={{0,30},{20,50}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation(
        animation=false, r={0,1,0})
        annotation (Placement(transformation(extent={{-40,30},{-20,50}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation1
        annotation (Placement(transformation(extent={{-40,-50},{-20,-30}})));
      IdealizedContact.ElementaryContactBodies.EllipsoidContactBody Ellipsoid1(
        a=0.4,
        b=0.3,
        c=0.4)
        annotation (Placement(transformation(extent={{40,-50},{60,-30}})));
      IdealizedContact.ElementaryContactBodies.EllipsoidContactBody Ellipsoid2(
        b=0.3,
        c=0.4,
        a=0.1) annotation (Placement(transformation(extent={{40,30},{60,50}})));
    equation

      connect(fixedRotation.frame_a, world.frame_b) annotation (Line(
          points={{-40,40},{-60,40},{-60,0},{-74,0}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(world.frame_b, fixedRotation1.frame_a) annotation (Line(
          points={{-74,0},{-60,0},{-60,-40},{-40,-40}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(Ellipsoid1.frame_a, fixedRotation1.frame_b)
                                                        annotation (Line(
          points={{40,-40},{-20,-40}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(Ellipsoid1.contact_a, contact.Port2)
                                                 annotation (Line(
          points={{60,-40},{80,-40},{80,-11.1}},
          color={255,128,0},
          smooth=Smooth.None));
      connect(fixedRotation.frame_b, freeMotion.frame_a) annotation (Line(
          points={{-20,40},{0,40}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(Ellipsoid2.contact_a, contact.Port1) annotation (Line(
          points={{60,40},{80,40},{80,10.9}},
          color={255,128,0},
          smooth=Smooth.None));
      connect(freeMotion.frame_b, Ellipsoid2.frame_a) annotation (Line(
          points={{20,40},{40,40}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
                          graphics),
        experiment(StartTime=0,StopTime=1.5, Tolerance=1e-006),
        __Dymola_experimentSetupOutput);
    end Example15;

    model Example16 "Contact Ellipsoid-Ellipsoid"
    extends Modelica.Icons.Example;

      inner Modelica.Mechanics.MultiBody.World world(
        enableAnimation=true,
        animateWorld=true,
        animateGravity=true)
        annotation (Placement(transformation(extent={{-86,-6},{-74,6}})));
      IdealizedContact.ElementaryContactBodies.ConvexContactBody Convex1(
      r_CM={0,0,0},
        h={0.1,0.3,0.4},
        convexContactShape="ellipsoid",
      m=0.2)                                                                                    annotation (Placement(transformation(extent={{22,29},
              {42,49}})));
      Modelica.Mechanics.MultiBody.Joints.FreeMotion freeMotion(animation=false,
      w_rel_a_fixed=true,
      angles_fixed=false,
      angles_start={0.17453292519943,0,0},
      w_rel_a_start={1,0,0})
        annotation (Placement(transformation(extent={{-16,30},{4,50}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation(
        animation=false, r={0.01,2,0})
        annotation (Placement(transformation(extent={{-54,30},{-34,50}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation1(angle=10, r={0,0,0})
        annotation (Placement(transformation(extent={{-40,-50},{-20,-30}})));
      IdealizedContact.ElementaryContactBodies.ConvexContactBody Convex2(                r_CM={0,
          0,0},
        h={0.4,0.3,0.4},
      convexContactShape="cylindrical",
      m=1)                                                                               annotation (Placement(transformation(extent={{8,-50},{28,-30}})));
      IdealizedContact.ContactBlock.Contact contact(
        exact=true,
        n1=1,
        springCoefficient=1e9,
        dampingCoefficient=10000,
        n2=0,
        p_max=0.005,
      redeclare IdealizedContact.ContactBlock.PunctiformContact.ConvexToConvex contactDefinition
        "ConvexToConvex")
        annotation (Placement(transformation(extent={{70,-8},{90,12}})));
    equation

      connect(freeMotion.frame_b,Convex1. frame_a)              annotation (
          Line(
          points={{4,40},{22,40},{22,39}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedRotation.frame_a, world.frame_b) annotation (Line(
          points={{-54,40},{-60,40},{-60,0},{-74,0}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(world.frame_b, fixedRotation1.frame_a) annotation (Line(
          points={{-74,0},{-60,0},{-60,-40},{-40,-40}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(Convex2.frame_a, fixedRotation1.frame_b)  annotation (Line(
          points={{8,-40},{-20,-40}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedRotation.frame_b, freeMotion.frame_a) annotation (Line(
          points={{-34,40},{-16,40}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(contact.Port1, Convex1.contact_a) annotation (Line(
          points={{80,12.9},{80,39},{42,39}},
          color={255,128,0},
          smooth=Smooth.None));
      connect(contact.Port2, Convex2.contact_a) annotation (Line(
          points={{80,-9.1},{80,-40},{28,-40}},
          color={255,128,0},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}),
                          graphics),
        experiment(StartTime=0,StopTime=1.5, Tolerance=1e-006),
        __Dymola_experimentSetupOutput);
    end Example16;

    model Example17 "Ellipsoid with gyroscopic movement on a plane"
    extends Modelica.Icons.Example;

      inner Modelica.Mechanics.MultiBody.World world(
        enableAnimation=true,
        animateWorld=true,
        animateGravity=true)
        annotation (Placement(transformation(extent={{-86,-6},{-74,6}})));
      IdealizedContact.ContactBlock.Contact contact(
        n2=1,
        exact=true,
        p_max=0.001,
        n1=1,
        springCoefficient=1000000000000,
        dampingCoefficient=100000000,
      redeclare IdealizedContact.ContactBlock.PunctiformContact.ConvexToPlane                               contactDefinition
        "ConvexToPlane")
        annotation (Placement(transformation(extent={{70,-10},{90,10}})));
      IdealizedContact.ElementaryContactBodies.EllipsoidContactBody Ellipsoid(
      a=0.6,
      color={255,0,255},
      b=0.1,
      c=0.6)             annotation (Placement(transformation(extent={{48,30},{
              68,50}})));
      Modelica.Mechanics.MultiBody.Joints.FreeMotion freeMotion(animation=false,
        w_rel_a_fixed=true,
        w_rel_a_start={0,10,0})
        annotation (Placement(transformation(extent={{10,30},{30,50}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation(
        animation=false,
        r={0,0.2,0},
        n={0,0,1},
        angle=5)
        annotation (Placement(transformation(extent={{-60,30},{-40,50}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation1
        annotation (Placement(transformation(extent={{-40,-50},{-20,-30}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation2(
        animation=false)
        annotation (Placement(transformation(extent={{-40,30},{-20,50}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation3(
        animation=false)
        annotation (Placement(transformation(extent={{-20,30},{0,50}})));
    ContactSurfaces.CircularPlaneContactSurface circularPlaneContactSurface(diameter=1)
      annotation (Placement(transformation(extent={{6,-50},{26,-30}})));
    equation

    connect(Ellipsoid.contact_a, contact.Port1) annotation (Line(
        points={{68,40},{80,40},{80,10.9}},
        color={255,128,0},
        smooth=Smooth.None));
    connect(freeMotion.frame_b, Ellipsoid.frame_a) annotation (Line(
        points={{30,40},{48,40}},
        color={95,95,95},
        thickness=0.5,
        smooth=Smooth.None));
      connect(fixedRotation.frame_a, world.frame_b) annotation (Line(
          points={{-60,40},{-60,0},{-74,0}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(world.frame_b, fixedRotation1.frame_a) annotation (Line(
          points={{-74,0},{-60,0},{-60,-40},{-40,-40}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedRotation2.frame_a, fixedRotation.frame_b) annotation (Line(
          points={{-40,40},{-40,40}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedRotation3.frame_a, fixedRotation2.frame_b) annotation (Line(
          points={{-20,40},{-20,40}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedRotation3.frame_b, freeMotion.frame_a) annotation (Line(
          points={{0,40},{10,40}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
    connect(fixedRotation1.frame_b, circularPlaneContactSurface.frame_a)
      annotation (Line(
        points={{-20,-40},{6.4,-40}},
        color={95,95,95},
        thickness=0.5,
        smooth=Smooth.None));
    connect(circularPlaneContactSurface.contact_a, contact.Port2)
      annotation (Line(
        points={{25.3,-40},{80,-40},{80,-11.1}},
        color={255,128,0},
        smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
                          graphics),
        experiment(StartTime=0,StopTime=5, Tolerance=1e-006),
        __Dymola_experimentSetupOutput);
    end Example17;

    model Example18 "Egg spinning on a plane"
    extends Modelica.Icons.Example;

      inner Modelica.Mechanics.MultiBody.World world
        annotation (Placement(transformation(extent={{-90,18},{-70,38}})));
       IdealizedContact.ElementaryContactBodies.ConvexContactBody                              egg(
      convexContactShape="egg",
      animation_BCS=false,
      r_CM={0.15,0,0},
      h={0.15,0.2,0.1},
      color={207,174,117},
      m=0.1)               annotation (Placement(transformation(extent={{38,40},{64,64}})));
       IdealizedContact.ContactBlock.Contact contact(
        n2=1,
        exact=true,
        p_max=0.001,
        n1=1,
        springCoefficient=1000000000000,
      redeclare IdealizedContact.ContactBlock.PunctiformContact.ConvexToPlane                               contactDefinition
        "ConvexToPlane",
        dampingCoefficient=1000000000000)
        annotation (Placement(transformation(extent={{80,0},{100,20}})));
       IdealizedContact.ContactSurfaces.RectangularPlaneContactSurface
                                                     rectangularContactSurface(
      animation_BCS=false,
        length=15,
        width=15,
      color={155,155,155}) annotation (Placement(transformation(extent={{26,-40},{46,
                -20}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation1
        annotation (Placement(transformation(extent={{-30,-40},{-10,-20}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation(
        animation=false,
        n={0,0,1},
        angle=0*15,
        r={0,0.25,0})
        annotation (Placement(transformation(extent={{-26,42},{-6,62}})));
      Modelica.Mechanics.MultiBody.Joints.FreeMotion freeMotion(animation=false,
        w_rel_a_fixed=true,
        w_rel_a_start={0,5,0})
        annotation (Placement(transformation(extent={{6,42},{26,62}})));
    equation
    connect(rectangularContactSurface.contact_a,contact. Port2)
      annotation (Line(
        points={{45.3,-30},{90,-30},{90,-1.1}},
        color={255,128,0},
        smooth=Smooth.None));
    connect(fixedRotation1.frame_b,rectangularContactSurface. frame_a)
      annotation (Line(
        points={{-10,-30},{26.4,-30}},
        color={95,95,95},
        thickness=0.5,
        smooth=Smooth.None));
      connect(world.frame_b,fixedRotation1. frame_a) annotation (Line(
          points={{-70,28},{-50,28},{-50,-30},{-30,-30}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedRotation.frame_a, world.frame_b) annotation (Line(
          points={{-26,52},{-26,52},{-28,52},{-28,52},{-50,52},{-50,28},{-70,28}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
    connect(freeMotion.frame_b, egg.frame_a)
      annotation (Line(
        points={{26,52},{38,52}},
        color={95,95,95},
        thickness=0.5,
        smooth=Smooth.None));
    connect(egg.contact_a, contact.Port1) annotation (Line(
        points={{64,52},{90,52},{90,20.9}},
        color={255,128,0},
        smooth=Smooth.None));
      connect(fixedRotation.frame_b, freeMotion.frame_a) annotation (Line(
          points={{-6,52},{6,52}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      annotation (
          Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                100}}), graphics),
      experiment(StartTime=0, StopTime=1.5),
      __Dymola_experimentSetupOutput);
    end Example18;

   annotation(preferredView="info", Documentation(info="<html>
<p>This package includes examples for the use of the IdealizedContact library.</p>
</html>"));
  end Examples;


  package ContactSurfaces "Contact surface definitions"
  extends Modelica.Icons.Package;

    model SphericalContactSurface "Model to define a spherical contact surface"
      extends IdealizedContact.Components.PartialContactSurface(final contactShape="spherical",
        fixedFrame(length=3*radius));
      import SI = Modelica.SIunits;
      parameter SI.Radius radius=0.015
      "radius of the spherical contact surface";

      constant Real pi=Modelica.Constants.pi;

      Modelica.Mechanics.MultiBody.Visualizers.FixedShape shape(
        lengthDirection={1,0,0},
        widthDirection={0,1,0},
        shapeType="sphere",
        r_shape={-radius,0,0},
        length=2*radius,
        width=2*radius,
        height=2*radius,
        color=color,
        animation=animation)
     annotation (Placement(transformation(extent={{-12,-12},{12,12}},
            rotation=90,
            origin={-10,34})));

    equation
      multiplex.u1={1,0,0};
      multiplex.u2={0,1,0};
      multiplex.u3={0,0,1};
      multiplex.u4=radius*{1,1,1};

      connect(shape.frame_a, frame_a)      annotation (Line(
          points={{-10,22},{-10,8},{-100,8}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(shape.frame_a, contact_a.frame)     annotation (Line(
          points={{-10,22},{-10,8},{100,8}},
          color={95,95,95},
          pattern=LinePattern.None,
          thickness=0.5,
          smooth=Smooth.None));
      annotation (Documentation(info="<!DOCTYPE html><html>
<p>The surface definition represents a thin and massless layer, which can be connected to any kind of rigid body by a frame connector. The dimensions can be parameterized. In order to be able to use them in the contact block we introduce a new interface to connect the surface definition with the contact block of this library. This adds a scalar vector to the MultiBody frame of the Modelica Standard Library. It comprises maximum three terms to describe the surface geometry and the three direction vectors to resolve them in the connected frame. The latter constitutes the body coordinate system of the contact surface. This model defines a spherical contact surface.</p>
</html>"),     Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
                       graphics),
                  Diagram(graphics),
        Icon(graphics={
            Text(
              extent={{-100,-74},{106,-96}},
              lineColor={255,128,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%name"),
            Ellipse(
              extent={{-60,60},{60,-60}},
              lineColor={0,0,0},
              lineThickness=0.5),
            Ellipse(
              extent={{-60,16},{60,-16}},
              lineColor={0,0,0},
              lineThickness=0.5,
              pattern=LinePattern.Dot),
            Ellipse(
              extent={{-5,5},{6,-6}},
              pattern=LinePattern.None,
              lineThickness=1,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-5,-55},{6,-66}},
              pattern=LinePattern.None,
              lineThickness=1,
              fillColor={0,176,0},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,0})}));
    end SphericalContactSurface;

    model CylindricalContactSurface
    "Model to define a cylindrical contact surface"
        extends IdealizedContact.Components.PartialContactSurface(final contactShape="cylindrical",
        fixedFrame(length=2*diameter));
      import SI = Modelica.SIunits;
    parameter SI.Diameter diameter=0.015 "diameter of cylindrical surface";
    parameter SI.Length length=0.05 "length of cylindrical surface";
    parameter Modelica.Mechanics.MultiBody.Types.Axis diameterDirection={0,0,1}
      "unit vector in diameter direction";
    parameter Modelica.Mechanics.MultiBody.Types.Axis lengthDirection={1,0,0}
      "unit vector in length direction";
    final parameter Modelica.Mechanics.MultiBody.Types.Axis heightDirection=abs(cross(diameterDirection,lengthDirection));

    constant Real pi=Modelica.Constants.pi;

      ParametricSurfaceDefinition.Visualizers.ConvexVisualizer                                  convexVisualizer(
      animation=animation,
      shape="cylindrical",
      h={length,diameter/2,0},
      color=color) annotation (Placement(transformation(extent={{-10,-10},{10,
              10}},
          rotation=90,
          origin={-10,40})));
    equation
      multiplex.u1=lengthDirection;
      multiplex.u2=diameterDirection;
      multiplex.u3=heightDirection;
      multiplex.u4={diameter/2,length/2,0};

    connect(frame_a, convexVisualizer.frame_a) annotation (Line(
        points={{-100,8},{-10,8},{-10,30}},
        color={95,95,95},
        thickness=0.5,
        smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}),
                          graphics), Icon(graphics={
            Ellipse(
              extent={{-86,60},{-42,-60}},
              lineColor={0,0,0},
              lineThickness=0.5,
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(
              points={{-62,-60},{-56,-56},{-52,-50},{-48,-42},{-46,-34},{-44,-24},
                  {-42,-10},{-42,0},{-42,16},{-46,34},{-48,42},{-54,54},{-62,60}},
              thickness=1,
              smooth=Smooth.Bezier,
              color={255,255,255},
              pattern=LinePattern.Dot),
            Ellipse(
              extent={{36,60},{80,-60}},
              lineColor={0,0,0},
              lineThickness=0.5,
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(
              points={{-64,60},{58,60}},
              color={0,0,0},
              thickness=0.5,
              smooth=Smooth.Bezier),
            Line(
              points={{-64,-60},{58,-60}},
              color={0,0,0},
              thickness=0.5,
              smooth=Smooth.Bezier),
            Ellipse(
              extent={{-69,-57},{-63,-63}},
              pattern=LinePattern.None,
              lineThickness=1,
              fillColor={0,176,0},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,0}),
            Ellipse(
              extent={{55,-57},{61,-63}},
              pattern=LinePattern.None,
              lineThickness=1,
              fillColor={0,176,0},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,0}),
            Ellipse(
              extent={{-11,5},{0,-6}},
              pattern=LinePattern.None,
              lineThickness=1,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{53,-55},{64,-66}},
              pattern=LinePattern.None,
              lineThickness=1,
              fillColor={0,176,0},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,0}),
            Ellipse(
              extent={{-73,-53},{-62,-64}},
              pattern=LinePattern.None,
              lineThickness=1,
              fillColor={0,176,0},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,0})}),
        Documentation(info="<!DOCTYPE html><html>
<p>The surface definition represents a thin and massless layer, which can be connected to any kind of rigid body by a frame connector. The dimensions can be parameterized. In order to be able to use them in the contact block we introduce a new interface to connect the surface definition with the contact block of this library. This adds a scalar vector to the MultiBody frame of the Modelica Standard Library. It comprises maximum three terms to describe the surface geometry and the three direction vectors to resolve them in the connected frame. The latter constitutes the body coordinate system of the contact surface. This model defines a cylindrical skin surface.</p>
</html>"));
    end CylindricalContactSurface;

    model RectangularPlaneContactSurface
    "Model to define a rectangular and plane contact surface"
      extends IdealizedContact.Components.PartialContactSurface(final contactShape="rectangular",
        fixedFrame(length=2*length));
      import SI = Modelica.SIunits;

    parameter SI.Length length=0.04;
    parameter SI.Length width=0.02;
    final parameter SI.Length height=0.001;
    parameter Modelica.Mechanics.MultiBody.Types.Axis lengthDirection={1,0,0};
    parameter Modelica.Mechanics.MultiBody.Types.Axis widthDirection={0,0,1};
    final parameter Modelica.Mechanics.MultiBody.Types.Axis heightDirection=abs(cross(lengthDirection,widthDirection));

      Modelica.Mechanics.MultiBody.Visualizers.FixedShape shape(
        animation=animation,
        shapeType="box",
        lengthDirection=lengthDirection,
        widthDirection=widthDirection,
        length=length,
        width=width,
        height=height,
        color=color,
        r_shape=-length/2*lengthDirection)
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-10,40})));

    equation
      multiplex.u1=lengthDirection;
      multiplex.u2=widthDirection;
      multiplex.u3=heightDirection;
      multiplex.u4=length*{1,0,0}+width*{0,1,0}+height*{0,0,1};

      connect(shape.frame_a, frame_a)      annotation (Line(
          points={{-10,30},{-10,8},{-100,8}},
          color={95,95,95},
          thickness=0.5));
      connect(shape.frame_a,contact_a. frame) annotation (Line(
          points={{-10,30},{-10,8},{100,8}},
          color={95,95,95},
          thickness=0.5));
      annotation (Diagram(graphics), Icon(graphics={
            Line(
              points={{-60,60},{-100,-60},{60,-60},{100,60},{-44,60},{-60,60}},
              thickness=0.5),
            Ellipse(
              extent={{55,-55},{66,-66}},
              pattern=LinePattern.None,
              lineThickness=1,
              fillColor={0,176,0},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,0}),
            Ellipse(
              extent={{-105,-55},{-94,-66}},
              pattern=LinePattern.None,
              lineThickness=1,
              fillColor={0,176,0},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,0}),
            Ellipse(
              extent={{-65,65},{-54,54}},
              pattern=LinePattern.None,
              lineThickness=1,
              fillColor={0,176,0},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,0}),
            Ellipse(
              extent={{95,65},{106,54}},
              pattern=LinePattern.None,
              lineThickness=1,
              fillColor={0,176,0},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,0}),
            Ellipse(
              extent={{-5,5},{6,-6}},
              pattern=LinePattern.None,
              lineThickness=1,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,0})}),
        Documentation(revisions="<html>
</html>", info="<!DOCTYPE html><html>
<p>The surface definition represents a thin and massless layer, which can be connected to any kind of rigid body by a frame connector. The dimensions can be parameterized. In order to be able to use them in the contact block we introduce a new interface to connect the surface definition with the contact block of this library. This adds a scalar vector to the MultiBody frame of the Modelica Standard Library. It comprises maximum three terms to describe the surface geometry and the three direction vectors to resolve them in the connected frame. The latter constitutes the body coordinate system of the contact surface. This model defines a rectangular, plane contact surface.</p>
</html>"));
    end RectangularPlaneContactSurface;

    model CircularPlaneContactSurface
    "Model to define a circular and plane contact surface"
      extends IdealizedContact.Components.PartialContactSurface(final contactShape="circular",
        fixedFrame(length=1.3*diameter));
      import SI = Modelica.SIunits;
    parameter SI.Diameter diameter=0.015;
    parameter Modelica.Mechanics.MultiBody.Types.Axis lengthDirection={0,1,0}
      "Length Direction";
    parameter Modelica.Mechanics.MultiBody.Types.Axis diameterDirection={0,0,1};

    final parameter SI.Length length=0.0002;
    final parameter Modelica.Mechanics.MultiBody.Types.Axis diameterDirection2=abs(cross(lengthDirection,diameterDirection));
    final parameter Modelica.Mechanics.MultiBody.Types.Axis x_direction={1,0,0};
    final parameter Modelica.Mechanics.MultiBody.Types.Axis y_direction={0,1,0};
    final parameter Modelica.Mechanics.MultiBody.Types.Axis z_direction=cross(x_direction, y_direction);
    constant Real pi=Modelica.Constants.pi;

      Modelica.Mechanics.MultiBody.Visualizers.FixedShape cylinder(
        shapeType="cylinder",
        length=length,
        width=diameter,
        color=color,
        lengthDirection=lengthDirection,
        widthDirection=diameterDirection,
        r_shape=-length/2*lengthDirection,
        height=diameter,
        animation=animation)
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-10,42})));

    equation
      multiplex.u1=lengthDirection;
      multiplex.u2=diameterDirection;
      multiplex.u3=diameterDirection2;
      multiplex.u4={diameter/2,0,0};
      connect(cylinder.frame_a, frame_a)   annotation (Line(
          points={{-10,32},{-10,8},{-100,8}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(cylinder.frame_a, contact_a.frame)  annotation (Line(
          points={{-10,32},{-10,8},{100,8}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
    connect(frame_a, frame_a) annotation (Line(
        points={{-100,8},{-100,8}},
        color={95,95,95},
        thickness=0.5,
        smooth=Smooth.None));
      annotation (Icon(graphics={
            Ellipse(
              extent={{-94,48},{96,-52}},
              lineColor={0,0,0},
              lineThickness=0.5),
            Ellipse(
              extent={{-5,5},{6,-6}},
              pattern=LinePattern.None,
              lineThickness=1,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,0}),
            Ellipse(
              extent={{-100,5},{-89,-6}},
              pattern=LinePattern.None,
              lineThickness=1,
              fillColor={0,176,0},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,0}),
            Ellipse(
              extent={{-5,53},{6,42}},
              pattern=LinePattern.None,
              lineThickness=1,
              fillColor={0,176,0},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,0}),
            Ellipse(
              extent={{-5,-47},{6,-58}},
              pattern=LinePattern.None,
              lineThickness=1,
              fillColor={0,176,0},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,0}),
            Ellipse(
              extent={{91,5},{102,-6}},
              pattern=LinePattern.None,
              lineThickness=1,
              fillColor={0,176,0},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,0})}),
          Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}),
                  graphics),
        Documentation(info="<!DOCTYPE html><html>
<p>The surface definition represents a thin and massless layer, which can be connected to any kind of rigid body by a frame connector. The dimensions can be parameterized. In order to be able to use them in the contact block we introduce a new interface to connect the surface definition with the contact block of this library. This adds a scalar vector to the MultiBody frame of the Modelica Standard Library. It comprises maximum three terms to describe the surface geometry and the three direction vectors to resolve them in the connected frame. The latter constitutes the body coordinate system of the contact surface. This model defines a circular, plane contact surface.</p>
</html>"));
    end CircularPlaneContactSurface;

    model EllipsoidContactSurface "Model to define a ellipsoid contact surface"
      extends IdealizedContact.Components.PartialContactSurface(final contactShape="ellipsoid",
          fixedFrame(length=2*max({a,b,c})));

    parameter Modelica.SIunits.Length a "radius of the 1st semiaxis";
    parameter Modelica.SIunits.Length b "radius of the 2nd semiaxis";
    parameter Modelica.SIunits.Length c "radius of the 3rd semiaxis";

      ParametricSurfaceDefinition.Visualizers.ConvexVisualizer ellipsoid(
        h={a,b,c},
        animation=animation,
        color=color,
        shape=contactShape)
        annotation (Placement(transformation(extent={{8,30},{28,50}})));
    equation
      multiplex.u1={1,0,0};
      multiplex.u2={0,1,0};
      multiplex.u3={0,0,1};
      multiplex.u4={a,b,c};
      connect(frame_a, contact_a.frame) annotation (Line(
          points={{-100,8},{100,8}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(ellipsoid.frame_a, frame_a) annotation (Line(
          points={{8,40},{-10,40},{-10,8},{-100,8}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),
                          graphics), Icon(graphics={
            Ellipse(
              extent={{-86,48},{86,-54}},
              lineColor={0,0,0},
              lineThickness=0.5),
            Ellipse(
              extent={{-86,16},{86,-18}},
              lineColor={0,0,0},
              lineThickness=0.5,
              pattern=LinePattern.Dot),
            Ellipse(
              extent={{-3,5},{8,-6}},
              pattern=LinePattern.None,
              lineThickness=1,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-3,-49},{8,-60}},
              pattern=LinePattern.None,
              lineThickness=1,
              fillColor={0,176,0},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,0})}),
        Documentation(info="<!DOCTYPE html><html>
<p>The surface definition represents a thin and massless layer, which can be connected to any kind of rigid body by a frame connector. The dimensions can be parameterized. In order to be able to use them in the contact block we introduce a new interface to connect the surface definition with the contact block of this library. This adds a scalar vector to the MultiBody frame of the Modelica Standard Library. It comprises maximum three terms to describe the surface geometry and the three direction vectors to resolve them in the connected frame. The latter constitutes the body coordinate system of the contact surface. This model defines an ellipsoid contact surface.</p>
</html>"));
    end EllipsoidContactSurface;

    model ConvexContactSurface "Model to define any convex contact surface"
      extends IdealizedContact.Components.PartialContactSurface(final contactShape=convexContactShape,
          fixedFrame(length=2*max(h)));
      parameter IdealizedContact.ContactSurfaces.Types.ConvexContactShapeType convexContactShape = "ellipsoid"
      "shape of the contact surface";
      parameter Real h[3] "parameters of convex contact shape";

      IdealizedContact.ContactSurfaces.ParametricSurfaceDefinition.Visualizers.ConvexVisualizer
                                                                                                convexVisualizer(
      animation=animation,
      color=color,
        h=h,
        shape=convexContactShape)
                   annotation (Placement(transformation(extent={{2,30},{22,50}})));

    equation
     if  Modelica.Utilities.Strings.isEqual(convexContactShape,"spherical") then
      assert(h[1]==h[2] and h[2] == h[3], "Surface type is spherical but different values for parameter h[:] are given. Only h[1] will be taken as radius.",AssertionLevel.warning);
     end if;

      multiplex.u1={1,0,0};
      multiplex.u2={0,1,0};
      multiplex.u3={0,0,1};
      multiplex.u4=h;

    connect(frame_a, convexVisualizer.frame_a) annotation (Line(
        points={{-100,8},{-10,8},{-10,40},{2,40}},
        color={95,95,95},
        thickness=0.5,
        smooth=Smooth.None));
      connect(frame_a, contact_a.frame) annotation (Line(
          points={{-100,8},{100,8}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),
                          graphics), Icon(graphics={
            Polygon(
              points={{-60,-70},{94,-22},{96,16},{-26,94},{-112,10},{-60,-70}},
              lineColor={0,0,0},
              lineThickness=0.5,
              fillPattern=FillPattern.Sphere,
              smooth=Smooth.Bezier,
              fillColor={255,255,255}),
            Ellipse(
              extent={{-92,16},{92,-16}},
              lineColor={0,0,0},
              lineThickness=0.5,
              pattern=LinePattern.Dot),
            Ellipse(
              extent={{-3,5},{8,-6}},
              pattern=LinePattern.None,
              lineThickness=1,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-3,-43},{8,-54}},
              pattern=LinePattern.None,
              lineThickness=1,
              fillColor={0,176,0},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,0})}),
        Documentation(info="<!DOCTYPE html><html>
<p>The surface definition represents a thin and massless layer, which can be connected to any kind of rigid body by a frame connector. The dimensions can be parameterized. In order to be able to use them in the contact block we introduce a new interface to connect the surface definition with the contact block of this library. This adds a scalar vector to the MultiBody frame of the Modelica Standard Library. It comprises maximum three terms to describe the surface geometry and the three direction vectors to resolve them in the connected frame. The latter constitutes the body coordinate system of the contact surface. This model can be used for any convex contact surface defined.</p>
</html>"));
    end ConvexContactSurface;

    package ParametricSurfaceDefinition
    "Parametric surface definitions of convex contact surfaces"
      function cylindrical "Cylindrical surface"
      input Real h[3];
      input Real k;
      input Real l;
      output Real y[3,1];
      algorithm
          y[1,1]:=h[1]*l;
          y[2,1]:=h[2]*cos(k);
          y[3,1]:=h[2]*sin(k);
      annotation (Documentation(info="<!DOCTYPE html><html>
<p>This&nbsp;function&nbsp;calculates&nbsp;the&nbsp;coordinates&nbsp;of&nbsp;a&nbsp;point&nbsp;on&nbsp;the&nbsp;cylindrical&nbsp;surface&nbsp;in&nbsp;the&nbsp;respective coordinate&nbsp;system.&nbsp;This&nbsp;function&nbsp;can&nbsp;be&nbsp;used&nbsp;for&nbsp;any&nbsp;parametric cylinder,&nbsp;because&nbsp;the&nbsp;parameters have&nbsp;to&nbsp;be&nbsp;put&nbsp;in&nbsp;as&nbsp;well.</p>
</html>"));
      end cylindrical;
    extends Modelica.Icons.SourcesPackage;
      function ellipsoid "Ellipsoid surface"
      input Real h[3] "semi axes";
      input Real phi;
      input Real theta;
      output Real y[3,1];
      algorithm
      y[1,1]:=h[1]*cos(phi)*sin(theta);
      y[2,1]:=h[2]*sin(phi)*sin(theta);
      y[3,1]:=h[3]*cos(theta);

        annotation (Documentation(info="<!DOCTYPE html><html>
<p>This&nbsp;function&nbsp;calculates&nbsp;the&nbsp;coordinates&nbsp;of&nbsp;a&nbsp;point&nbsp;on&nbsp;the ellipsoid&nbsp;surface&nbsp;in&nbsp;the&nbsp;respective coordinate&nbsp;system.&nbsp;This&nbsp;function&nbsp;can&nbsp;be&nbsp;used&nbsp;for&nbsp;any&nbsp;parametric ellipsod,&nbsp;because&nbsp;the&nbsp;parameters have&nbsp;to&nbsp;be&nbsp;put&nbsp;in&nbsp;as&nbsp;well.</p>
</html>"));
      end ellipsoid;

      function spherical "Spherical surface"
      input Real h[3] "radius";
      input Real phi;
      input Real theta;
      output Real y[3,1];
    protected
      Real r;
      algorithm
         r:=h[1];
         y:=IdealizedContact.ContactSurfaces.ParametricSurfaceDefinition.ellipsoid(
          {r,r,r},
          phi,
          theta);

        annotation (Documentation(info="<!DOCTYPE html><html>
<p>This&nbsp;function&nbsp;calculates&nbsp;the&nbsp;coordinates&nbsp;of&nbsp;a&nbsp;point&nbsp;on&nbsp;the spherical surface&nbsp;in&nbsp;the&nbsp;respective coordinate&nbsp;system.</p>
</html>"));
      end spherical;

      function egg "Egg surface"
      input Real h[3] "egg dimensions";
      input Real phi;
      input Real theta;
      output Real y[3,1];

      algorithm
      y[1,1]:=h[1]*cos(phi)+(h[2]+h[3]*cos(phi))*cos(phi);
      y[2,1]:=(h[2]+h[3]*cos(phi))*sin(phi)*sin(theta);
      y[3,1]:=(h[2]+h[3]*cos(phi))*sin(phi)*cos(theta);//*r*cos(theta);

        annotation (Documentation(info="<!DOCTYPE html><html>
<p>This&nbsp;function&nbsp;calculates&nbsp;the&nbsp;coordinates&nbsp;of&nbsp;a&nbsp;point&nbsp;on the &nbsp;surface of an egg&nbsp;in&nbsp;the&nbsp;respective coordinate&nbsp;system.&nbsp;It&nbsp;describes the contact surface using the &quot;eggquation&quot;.</p>
<pre><a href=\"http://matheminutes.blogspot.de/2013/03/eggquations.html\">http://matheminutes.blogspot.de/2013/03/eggquations.html</a></pre>
</html>"));
      end egg;

      function parametricSurfaceWrapper "Wrapper for surface functions"
      input IdealizedContact.ContactSurfaces.Types.ContactShapeType contactSurfaceType
        "specify type of convex contact surface";
      input Real h[3] "semi axes parameters";
      input Real phi;
      input Real theta;
      output Real y[3,1];
    protected
        Boolean surfaceSpecified;
      algorithm
        if Modelica.Utilities.Strings.isEqual(contactSurfaceType,"ellipsoid") then
          y :=
            IdealizedContact.ContactSurfaces.ParametricSurfaceDefinition.ellipsoid(
            h,
            phi,
            theta);
            surfaceSpecified:=true;
        elseif Modelica.Utilities.Strings.isEqual(contactSurfaceType,"cylindrical") then
          y :=cylindrical(
            h,
            phi,
            theta);
            surfaceSpecified:=true;
        elseif Modelica.Utilities.Strings.isEqual(contactSurfaceType,"spherical") then
          y :=
            IdealizedContact.ContactSurfaces.ParametricSurfaceDefinition.spherical(
            h,
            phi,
            theta);
            surfaceSpecified:=true;
        elseif Modelica.Utilities.Strings.isEqual(contactSurfaceType,"egg") then
          y :=egg(
            h,
            phi,
            theta);
            surfaceSpecified:=true;
        else
          y:=zeros(3, 1);
          surfaceSpecified:=false;
        end if;
         assert(surfaceSpecified,"Parametric surface is not specified.",level=AssertionLevel.error);
        annotation (Documentation(info="<!DOCTYPE html><html>
<p>This&nbsp;wrapper function&nbsp;calculates&nbsp;the&nbsp;coordinates&nbsp;of&nbsp;a&nbsp;point&nbsp;on&nbsp;the&nbsp;convex&nbsp;surface in&nbsp;the&nbsp;respective body&nbsp;coordinate&nbsp;system.&nbsp;It&nbsp;can&nbsp;be&nbsp;used&nbsp;for&nbsp;the&nbsp;specified&nbsp;parametric&nbsp;convex&nbsp;surface.&nbsp;The surface type is defined by a parameter.</p>
</html>"));
      end parametricSurfaceWrapper;

      package FirstPartialDerivatives
      "First partial derivatives of the surface functions"
      extends Modelica.Icons.SourcesPackage;
        function ellipsoidFirstPartialDerivatives
        "First partial derivatives of parametric surface definition of ellipsoid"
        input Real d
          "switch for partial derivatives d=1 -> d/(dphi), d!=1 -> d/(dtheta)";
        input Real h[3] "semi axes";
        input Real phi "polar angle";
        input Real theta "azimuthal angle";
        output Real y[3,1];
        algorithm
        if d==1 then
            y[1,1]:=-h[1]*sin(phi)*sin(theta);
            y[2,1]:=h[2]*cos(phi)*sin(theta);
            y[3,1]:=0;
        else
            y[1,1]:=h[1]*cos(phi)*cos(theta);
            y[2,1]:=h[2]*sin(phi)*cos(theta);
            y[3,1]:=-h[3]*sin(theta);
        end if;
        annotation (Documentation(info="<!DOCTYPE html><html>
<p>This&nbsp;function&nbsp;calculates&nbsp;the&nbsp;first&nbsp;derivatives&nbsp;with&nbsp;respect&nbsp;to&nbsp;the&nbsp;polar&nbsp;and&nbsp;azimuthal&nbsp;angles.</p>
<p>The&nbsp;input&nbsp;d&nbsp;specifies&nbsp;which&nbsp;derivative&nbsp;is&nbsp;used.&nbsp;d=1&nbsp;-&#62;&nbsp;d/(dk),&nbsp;d!=1&nbsp;-&#62;&nbsp;d/(dl)</p>
<p>This&nbsp;function&nbsp;works&nbsp;for&nbsp;any&nbsp;ellipsoid,&nbsp;because&nbsp;the&nbsp;semi&nbsp;axis&nbsp;are&nbsp;inputs&nbsp;as&nbsp;well.</p>
</html>"));
        end ellipsoidFirstPartialDerivatives;

        function cylindricalFirstPartialDerivatives
        "First partial derivatives of parametric surface definition of cylinder"
        input Real d;
        input Real h[3];
        input Real k;
        input Real l;
        output Real y[3,1];
        algorithm
            if d==1 then
              y[1,1]:=0;
              y[2,1]:=-h[2]*sin(k);
              y[3,1]:=h[2]*cos(k);
            elseif d==2 then
              y[1,1]:=h[1];
              y[2,1]:=0;
              y[3,1]:=0;
            end if;

          annotation (Documentation(info="<!DOCTYPE html><html>
<p>This&nbsp;function&nbsp;calculates&nbsp;the&nbsp;first&nbsp;derivatives&nbsp;with&nbsp;respect&nbsp;to&nbsp;the&nbsp;polar&nbsp;and&nbsp;azimuthal&nbsp;angles.</p>
<p>The&nbsp;input&nbsp;d&nbsp;specifies&nbsp;which&nbsp;derivative&nbsp;is&nbsp;used.&nbsp;d=1&nbsp;-&#62;&nbsp;d/(dk),&nbsp;d!=1&nbsp;-&#62;&nbsp;d/(dl)</p>
<p>This&nbsp;function&nbsp;works&nbsp;for&nbsp;any cylinder,&nbsp;because&nbsp;the&nbsp;semi&nbsp;axis&nbsp;are&nbsp;inputs&nbsp;as&nbsp;well.</p>
</html>"));
        end cylindricalFirstPartialDerivatives;

        function eggFirstPartialDerivatives
        "First partial derivatives of parametric surface definition of egg"
        input Real d
          "switch for partial derivatives d=1 -> d/(dphi), d!=1 -> d/(dtheta)";
        input Real h[3] "semi axes";
        input Real phi "polar angle";
        input Real theta "azimuthal angle";
        output Real y[3,1];
        algorithm
        if d==1 then
          y[1,1]:=-h[1]*sin(phi)-h[2]*sin(phi)-2*h[3]*cos(phi)*sin(phi);
          y[2,1]:=sin(theta)*(h[2]*cos(phi) - h[3] + 2*h[3]*cos(phi)^2);//h[2]*sin(theta)*cos(phi)+h[3]*sin(theta)*cos(2*phi);
          y[3,1]:=cos(theta)*(h[2]*cos(phi) - h[3] + 2*h[3]*cos(phi)^2);//h[2]*cos(theta)*cos(phi)+h[3]*cos(theta)*cos(2*phi);
        else
            y[1,1]:=0;
            y[2,1]:=(h[2]+h[3]*cos(phi))*sin(phi)*cos(theta);
            y[3,1]:=-(h[2]+h[3]*cos(phi))*sin(phi)*sin(theta);
        end if;
        annotation (Documentation(info="<!DOCTYPE html><html>
<p>This&nbsp;function&nbsp;calculates&nbsp;the&nbsp;first&nbsp;derivatives&nbsp;with&nbsp;respect&nbsp;to&nbsp;the&nbsp;polar&nbsp;and&nbsp;azimuthal&nbsp;angles.</p>
<p>The&nbsp;input&nbsp;d&nbsp;specifies&nbsp;which&nbsp;derivative&nbsp;(polar&nbsp;or&nbsp;azimuthal)&nbsp;is&nbsp;used.&nbsp;d=1&nbsp;-&#62;&nbsp;d/(dphi),&nbsp;d!=1&nbsp;-&#62;&nbsp;d/(dtheta)</p>
</html>"));
        end eggFirstPartialDerivatives;

        function firstPartialDerivativesWrapper
          //This function calculates the first partial derivatives with respect to the polar and azimuthal angles in the body coordinate system.
        //The input d specifies which derivative (polar or azimuthal) is used. d=1 -> d/(dphi), d!=1 -> d/(dtheta)
        //This function works for any ellipsoid, because the semi axis are inputs as well.
        input IdealizedContact.ContactSurfaces.Types.ContactShapeType contactSurfaceType
          "specify type of convex contact surface";
        input Real d;
        input Real h[3] "semi axes";
        input Real phi "polar angle";
        input Real theta "azimuthal angle";
        output Real y[3,1];
      protected
          Boolean surfaceSpecified;
        algorithm
          if Modelica.Utilities.Strings.isEqual(contactSurfaceType,"ellipsoid") then
            y := IdealizedContact.ContactSurfaces.ParametricSurfaceDefinition.FirstPartialDerivatives.ellipsoidFirstPartialDerivatives(
              d,
              h,
              phi,
              theta);
            surfaceSpecified:=true;
          elseif Modelica.Utilities.Strings.isEqual(contactSurfaceType,"cylindrical") then
            y :=cylindricalFirstPartialDerivatives(
                    d,
                    h,
                    phi,
                    theta);
            surfaceSpecified:=true;
          elseif Modelica.Utilities.Strings.isEqual(contactSurfaceType,"spherical") then
            y := IdealizedContact.ContactSurfaces.ParametricSurfaceDefinition.FirstPartialDerivatives.ellipsoidFirstPartialDerivatives(
              d,
              {h[1],h[1],h[1]},
              phi,
              theta);
            surfaceSpecified:=true;
          elseif Modelica.Utilities.Strings.isEqual(contactSurfaceType,"egg") then
            y := IdealizedContact.ContactSurfaces.ParametricSurfaceDefinition.FirstPartialDerivatives.eggFirstPartialDerivatives(
              d,
              h,
              phi,
              theta);
            surfaceSpecified:=true;
          else
            y:=zeros(3, 1);
            surfaceSpecified:=false;
          end if;
           assert(surfaceSpecified,"First partial derivative of parametric surface is not specified.");
        annotation (Documentation(info="<!DOCTYPE html><html>
<p>This&nbsp;wrapper function&nbsp;calculates&nbsp;the&nbsp;first&nbsp;partial&nbsp;derivatives&nbsp;with&nbsp;respect&nbsp;to&nbsp;the&nbsp;polar&nbsp;and&nbsp;azimuthal&nbsp;angles in the body coordinate system. The&nbsp;input&nbsp;d&nbsp;specifies&nbsp;which&nbsp;derivative&nbsp;(polar&nbsp;or&nbsp;azimuthal)&nbsp;is&nbsp;used.&nbsp;d=1&nbsp;-&#62;&nbsp;d/(dphi),&nbsp;d!=1&nbsp;-&#62;&nbsp;d/(dtheta)</p>
</html>"));
        end firstPartialDerivativesWrapper;
        annotation (Documentation(info="<!DOCTYPE html><html>
<p>Package of the first partial derivatives of the surface functions.</p>
</html>"));
      end FirstPartialDerivatives;

      package SecondPartialDerivatives
      "Second partial derivatives of the surface functions"
      extends Modelica.Icons.SourcesPackage;
        function ellipsoidSecondPartialDerivatives
        "Second partial derivatives of parametric surface definition of ellipsoid"
        input Real d;
        input Real e;
        input Real h[3] "semi axes";
        input Real phi "polar angle";
        input Real theta "azimuthal angle";
        output Real y[3,1];
        algorithm
        if d==1 and e==1 then
            y[1,1]:=-h[1]*cos(phi)*sin(theta);
            y[2,1]:=-h[2]*sin(phi)*sin(theta);
            y[3,1]:=0;
        elseif d==2 and e==2 then
            y[1,1]:=-h[1]*cos(phi)*sin(theta);
            y[2,1]:=-h[2]*sin(phi)*sin(theta);
            y[3,1]:=-h[3]*cos(theta);
        else
            y[1,1]:=-h[1]*sin(phi)*cos(theta);
            y[2,1]:=h[2]*cos(phi)*cos(theta);
            y[3,1]:=0;
        end if;

          annotation (Documentation(info="<!DOCTYPE html><html>
<p>This&nbsp;function&nbsp;calculates&nbsp;the&nbsp;second&nbsp;partial&nbsp;derivatives&nbsp;of&nbsp;an&nbsp;ellipsoid&nbsp;surface&nbsp;function. The&nbsp;combination&nbsp;of&nbsp;the&nbsp;inputs&nbsp;d&nbsp;and&nbsp;e&nbsp;specifies&nbsp;which&nbsp;second&nbsp;derivative&nbsp;is&nbsp;used.</p>
<p><br>d=e=1&nbsp;provides&nbsp;the&nbsp;second&nbsp;derivative&nbsp;with&nbsp;respect&nbsp;to&nbsp;the&nbsp;polar&nbsp;angle&nbsp;(phi)&nbsp;twice.</p>
<p>d=e=2&nbsp;provides&nbsp;the&nbsp;second&nbsp;derivative&nbsp;with&nbsp;respect&nbsp;to&nbsp;the&nbsp;azimuthal&nbsp;angle&nbsp;(theta)&nbsp;twice.</p>
<p>any&nbsp;other&nbsp;combination&nbsp;(ex:(d=1,e=2))&nbsp;provides&nbsp;the&nbsp;second&nbsp;derivative&nbsp;with&nbsp;respect&nbsp;to&nbsp;the&nbsp;polar and&nbsp;azimuthal&nbsp;angle.&nbsp;</p>
<p><br>Because&nbsp;the&nbsp;surface&nbsp;of&nbsp;an&nbsp;ellipsoid&nbsp;is&nbsp;a&nbsp;continuosly&nbsp;differentiable&nbsp;function Schwartz&apos;s&nbsp;theorem&nbsp;says&nbsp;that&nbsp;the&nbsp;order&nbsp;of&nbsp;the&nbsp;second&nbsp;derivatives&nbsp;doesn&apos;t&nbsp;matter.</p>
</html>"));
        end ellipsoidSecondPartialDerivatives;

        function cylindricalSecondPartialDerivatives
        "Second partial derivatives of parametric surface definition of cylinder"
        input Real d;
        input Real e;
        input Real h[3];
        input Real k;
        input Real l;
        output Real y[3,1];
        algorithm
        if d==1 and e==1 then
              y[1,1]:=0;
              y[2,1]:=-h[2]*cos(k);
              y[3,1]:=-h[2]*sin(k);
        elseif d==2 and e==2 then
            y[1,1]:=0;
            y[2,1]:=0;
            y[3,1]:=0;
        else
            y[1,1]:=0;
            y[2,1]:=0;
            y[3,1]:=0;
        end if;

          annotation (Documentation(info="<!DOCTYPE html><html>
<p>This&nbsp;function&nbsp;calculates&nbsp;the&nbsp;second&nbsp;partial&nbsp;derivatives&nbsp;of&nbsp;an&nbsp;ellipsoid&nbsp;surface&nbsp;function. The&nbsp;combination&nbsp;of&nbsp;the&nbsp;inputs&nbsp;d&nbsp;and&nbsp;e&nbsp;specifies&nbsp;which&nbsp;second&nbsp;derivative&nbsp;is&nbsp;used.</p>
<p><br>d=e=1&nbsp;provides&nbsp;the&nbsp;second&nbsp;derivative&nbsp;with&nbsp;respect&nbsp;to&nbsp;the&nbsp;polar&nbsp;angle&nbsp;(phi)&nbsp;twice.</p>
<p>d=e=2&nbsp;provides&nbsp;the&nbsp;second&nbsp;derivative&nbsp;with&nbsp;respect&nbsp;to&nbsp;the&nbsp;azimuthal&nbsp;angle&nbsp;(theta)&nbsp;twice.</p>
<p>any&nbsp;other&nbsp;combination&nbsp;(ex:(d=1,e=2))&nbsp;provides&nbsp;the&nbsp;second&nbsp;derivative&nbsp;with&nbsp;respect&nbsp;to&nbsp;the&nbsp;polar and&nbsp;azimuthal&nbsp;angle.&nbsp;</p>
<p><br>Because&nbsp;the&nbsp;surface&nbsp;of&nbsp;an&nbsp;ellipsoid&nbsp;is&nbsp;a&nbsp;continuosly&nbsp;differentiable&nbsp;function Schwartz&apos;s&nbsp;theorem&nbsp;says&nbsp;that&nbsp;the&nbsp;order&nbsp;of&nbsp;the&nbsp;second&nbsp;derivatives&nbsp;doesn&apos;t&nbsp;matter.</p>
</html>"));
        end cylindricalSecondPartialDerivatives;

        function eggSecondPartialDerivatives
        "Second partial derivatives of parametric surface definition of egg"
        input Real d;
        input Real e;
        input Real h[3] "semi axes";
        input Real phi "polar angle";
        input Real theta "azimuthal angle";
        output Real y[3,1];
        algorithm
        if d==1 and e==1 then
          y[1,1]:=2*h[3] - h[1]*cos(phi) - h[2]*cos(phi) - 4*h[3]*cos(phi)^2;//-h[1]*cos(phi)-h[2]*cos(phi)-2*h[3]*cos(2*phi);
          y[2,1]:=-sin(phi)*sin(theta)*(h[2] + 4*h[3]*cos(phi));//-h[2]*sin(theta)*sin(phi)-2*h[3]*sin(theta)*sin(2*phi);
          y[3,1]:=-cos(theta)*(2*h[3]*sin(2*phi) + h[2]*sin(phi));//-h[2]*cos(theta)*sin(phi)-2*h[3]*cos(theta)*sin(2*phi);
        elseif d==2 and e==2 then
            y[1,1]:=0;
            y[2,1]:=-(h[2]+h[3]*cos(phi))*sin(phi)*sin(theta);
            y[3,1]:=-(h[2]+h[3]*cos(phi))*sin(phi)*cos(theta);
        else
            y[1,1]:=0;
            y[2,1]:=cos(theta)*(h[2]*cos(phi) - h[3] + 2*h[3]*cos(phi)^2);//(h[2]*cos(phi)+h[3]*cos(2*phi))*cos(theta);
            y[3,1]:=-sin(theta)*(h[2]*cos(phi) - h[3] + 2*h[3]*cos(phi)^2);//-(h[2]*cos(phi)+h[3]*cos(2*phi))*sin(theta);
        end if;

          annotation (Documentation(info="<!DOCTYPE html><html>
<p>This&nbsp;function&nbsp;calculates&nbsp;the&nbsp;second&nbsp;partial&nbsp;derivatives&nbsp;of&nbsp;an&nbsp;ellipsoid&nbsp;surface&nbsp;function. The&nbsp;combination&nbsp;of&nbsp;the&nbsp;inputs&nbsp;d&nbsp;and&nbsp;e&nbsp;specifies&nbsp;which&nbsp;second&nbsp;derivative&nbsp;is&nbsp;used.</p>
<p><br>d=e=1&nbsp;provides&nbsp;the&nbsp;second&nbsp;derivative&nbsp;with&nbsp;respect&nbsp;to&nbsp;the&nbsp;polar&nbsp;angle&nbsp;(phi)&nbsp;twice.</p>
<p>d=e=2&nbsp;provides&nbsp;the&nbsp;second&nbsp;derivative&nbsp;with&nbsp;respect&nbsp;to&nbsp;the&nbsp;azimuthal&nbsp;angle&nbsp;(theta)&nbsp;twice.</p>
<p>any&nbsp;other&nbsp;combination&nbsp;(ex:(d=1,e=2))&nbsp;provides&nbsp;the&nbsp;second&nbsp;derivative&nbsp;with&nbsp;respect&nbsp;to&nbsp;the&nbsp;polar and&nbsp;azimuthal&nbsp;angle.&nbsp;</p>
<p><br>Because&nbsp;the&nbsp;surface&nbsp;of&nbsp;an&nbsp;ellipsoid&nbsp;is&nbsp;a&nbsp;continuosly&nbsp;differentiable&nbsp;function Schwartz&apos;s&nbsp;theorem&nbsp;says&nbsp;that&nbsp;the&nbsp;order&nbsp;of&nbsp;the&nbsp;second&nbsp;derivatives&nbsp;doesn&apos;t&nbsp;matter.</p>
</html>"));
        end eggSecondPartialDerivatives;

        function secondPartialDerivativesWrapper
        input IdealizedContact.ContactSurfaces.Types.ContactShapeType contactSurfaceType
          "specify type of convex contact surface";
        input Real d;
        input Real e;
        input Real h[3] "semi axes";
        input Real phi "polar angle";
        input Real theta "azimuthal angle";
        output Real y[3,1];
      protected
          Boolean surfaceSpecified;
        algorithm
          if Modelica.Utilities.Strings.isEqual(contactSurfaceType,"ellipsoid") then
            y := IdealizedContact.ContactSurfaces.ParametricSurfaceDefinition.SecondPartialDerivatives.ellipsoidSecondPartialDerivatives(
              d,
              e,
              h,
              phi,
              theta);
             surfaceSpecified:=true;
          elseif Modelica.Utilities.Strings.isEqual(contactSurfaceType,"cylindrical") then
            y :=cylindricalSecondPartialDerivatives(
                    d,
                    e,
                    h,
                    phi,
                    theta);
            surfaceSpecified:=true;
          elseif Modelica.Utilities.Strings.isEqual(contactSurfaceType,"spherical") then
            y := IdealizedContact.ContactSurfaces.ParametricSurfaceDefinition.SecondPartialDerivatives.ellipsoidSecondPartialDerivatives(
              d,
              e,
              {h[1],h[1],h[1]},
              phi,
              theta);
            surfaceSpecified:=true;
          elseif Modelica.Utilities.Strings.isEqual(contactSurfaceType,"egg") then
            y := IdealizedContact.ContactSurfaces.ParametricSurfaceDefinition.SecondPartialDerivatives.eggSecondPartialDerivatives(
              d,
              e,
              h,
              phi,
              theta);
            surfaceSpecified:=true;
          else
            y:=zeros(3, 1);
            surfaceSpecified:=false;
          end if;
           assert(surfaceSpecified,"Second partial derivative of parametric surface is not specified.");

          annotation (Documentation(info="<!DOCTYPE html><html>
<p>This&nbsp;function&nbsp;is a wrapper function, which calculates&nbsp;the&nbsp;second&nbsp;partial&nbsp;derivatives&nbsp;for the specified&nbsp;surface&nbsp;functions (in the body coordinate system). The&nbsp;combination&nbsp;of&nbsp;the&nbsp;inputs&nbsp;d&nbsp;and&nbsp;e&nbsp;specifies&nbsp;which&nbsp;second&nbsp;derivative&nbsp;is&nbsp;used. </p>
<p><br>d=e=1&nbsp;provides&nbsp;the&nbsp;second&nbsp;derivative&nbsp;with&nbsp;respect&nbsp;to&nbsp;the&nbsp;polar&nbsp;angle&nbsp;(phi)&nbsp;twice.</p>
<p>d=e=2&nbsp;provides&nbsp;the&nbsp;second&nbsp;derivative&nbsp;with&nbsp;respect&nbsp;to&nbsp;the&nbsp;azimuthal&nbsp;angle&nbsp;(theta)&nbsp;twice.</p>
<p>any&nbsp;other&nbsp;combination&nbsp;(ex:(d=1,e=2))&nbsp;provides&nbsp;the&nbsp;second&nbsp;derivative&nbsp;with&nbsp;respect&nbsp;to&nbsp;the&nbsp;polar and&nbsp;azimuthal&nbsp;angle.&nbsp;</p>
<p><br>Because&nbsp;the&nbsp;surface&nbsp;of&nbsp;an&nbsp;ellipsoid&nbsp;is&nbsp;a&nbsp;continuosly&nbsp;differentiable&nbsp;function Schwartz&apos;s&nbsp;theorem&nbsp;says&nbsp;that&nbsp;the&nbsp;order&nbsp;of&nbsp;the&nbsp;second&nbsp;derivatives&nbsp;doesn&apos;t&nbsp;matter.</p>
</html>"));
        end secondPartialDerivativesWrapper;
        annotation (Documentation(info="<!DOCTYPE html><html>
<p>Package of the second partial derivatives of the surface functions.</p>
</html>"));
      end SecondPartialDerivatives;

      package Visualizers "Special visualizer for convex surfaces"
      extends Modelica.Icons.SourcesPackage;

        model ConvexVisualizer "Visualizing a convex body"
          extends Modelica.Mechanics.MultiBody.Interfaces.PartialVisualizer;

          parameter
          IdealizedContact.ContactSurfaces.Types.ConvexContactShapeType           shape=""
          "type of contact surface";
          parameter Real h[3] "parameters of convex surface";

          parameter Boolean animation=true
          "= true, if animation shall be enabled";
          parameter Modelica.SIunits.Angle opening=0
          "Opening angle of ellipsoid"                                            annotation(Dialog(enable=animation));
          parameter Modelica.SIunits.Angle alphaStartAngle=-Modelica.Constants.pi
          "Start angle of ellipsoid slice"   annotation(Dialog(enable=animation));
          parameter Modelica.SIunits.Angle alphaStopAngle=Modelica.Constants.pi
          "End angle of ellipsoid slice"   annotation(Dialog(enable=animation));
        //   parameter Modelica.SIunits.Angle betaStartAngle=-Modelica.Constants.pi
        //     "Start angle of ellipsoid slice" annotation(Dialog(enable=animation));
        //   parameter Modelica.SIunits.Angle betaStopAngle=Modelica.Constants.pi
        //     "End angle of ellipsoid slice" annotation(Dialog(enable=animation));
          parameter Boolean wireframe=false
          "= true: 3D model will be displayed without faces"
            annotation (Dialog(enable=animation, group="Material properties"),choices(checkBox=true));
          input Modelica.Mechanics.MultiBody.Types.RealColor color={255,0,255}
          "Color of surface"    annotation(Dialog(enable=animation,__Dymola_colorSelector=true,group="Material properties", enable=not multiColoredSurface));
          input Modelica.Mechanics.MultiBody.Types.SpecularCoefficient specularCoefficient=0.7
          "Reflection of ambient light (= 0: light is completely absorbed)"   annotation(Dialog(enable=animation,group="Material properties"));
          input Real transparency=0
          "Transparency of shape: 0 (= opaque) ... 1 (= fully transparent)"
                                       annotation(Dialog(enable=animation,group="Material properties"));
          parameter Integer n_ri=100 "Number of points along ri" annotation(Dialog(enable=animation,tab="Discretization"));
          parameter Integer n_ro=100 "Number of points along ro" annotation(Dialog(enable=animation,tab="Discretization"));

      protected
        Modelica.Mechanics.MultiBody.Visualizers.Advanced.Surface surface(
          redeclare function surfaceCharacteristic =
             IdealizedContact.ContactSurfaces.ParametricSurfaceDefinition.Visualizers.SurfaceCharacteristics.convexSurfaceCharacteristic
              (  shape=shape, h=h, opening=opening, alphaStartAngle=alphaStartAngle, alphaStopAngle=alphaStopAngle),
          nu=n_ri,
          nv=n_ro,
          multiColoredSurface=false,
          wireframe=wireframe,
          color=color,
          specularCoefficient=specularCoefficient,
          transparency=transparency,
          R=frame_a.R,
          r_0=frame_a.r_0) if   world.enableAnimation and animation
          annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
        //         betaStartAngle=betaStartAngle,
        //         betaStopAngle=betaStopAngle,

        equation
          // No forces and torques
          frame_a.f = zeros(3);
          frame_a.t = zeros(3);
          annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
                           graphics={
                  Text(
                  extent={{-150,100},{150,140}},
                  lineColor={0,0,255},
                  textString="%name"), Polygon(
                points={{-60,-70},{94,-22},{96,16},{-26,94},{-112,10},{-60,-70}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillPattern=FillPattern.Sphere,
                smooth=Smooth.Bezier,
                fillColor={0,0,255})}),  Documentation(info="<html>
<p>Model <b>ConvexVisualizer</b> visualizes a convex surface using parametric surface definitons. The center of the visualization is located at connector frame_a. It utilizes the same method that is used by Martin Otter and Dirk Zimmer resp. in <b><a href=\"modelica://Modelica.Mechanics.MultiBody.Visualizers.Torus\">Torus</a></b> model.</p>
</html>"),  Diagram(graphics));
        end ConvexVisualizer;

        package SurfaceCharacteristics
        extends Modelica.Icons.SourcesPackage;

          function convexSurfaceCharacteristic
          "Function defining the surface characteristic of a ellipsoid"
            extends
            Modelica.Mechanics.MultiBody.Interfaces.partialSurfaceCharacteristic(
                      final multiColoredSurface=false);
            input IdealizedContact.ContactSurfaces.Types.ContactShapeType shape;
            input Real h[3] "parameters of convex surface";

            input Modelica.SIunits.Angle opening=0 "Opening angle of ellipsoid"
                                                                                annotation(Dialog);
            input Modelica.SIunits.Angle alphaStartAngle= -Modelica.Constants.pi
            "Start angle of ellipsoid slice"
                                           annotation(Dialog);
            input Modelica.SIunits.Angle alphaStopAngle= Modelica.Constants.pi
            "End angle of ellipsoid slice"
                                         annotation(Dialog);
          //   input Modelica.SIunits.Angle betaStartAngle= -Modelica.Constants.pi
          //     "Start angle of ellipsoid slice"
          //                                  annotation(Dialog);
          //   input Modelica.SIunits.Angle betaStopAngle= Modelica.Constants.pi
          //     "End angle of ellipsoid slice"
          //                                annotation(Dialog);
        protected
            Modelica.SIunits.Angle alpha;
            Modelica.SIunits.Angle beta;
            Modelica.SIunits.Angle phi_start;
            Modelica.SIunits.Angle phi_stop;
            Real temp[3,1];
          algorithm
            phi_start :=-Modelica.Constants.pi + opening;
            phi_stop  :=Modelica.Constants.pi - opening;
            for i in 1:nu loop
                alpha := alphaStartAngle + (alphaStopAngle-alphaStartAngle)*(i-1)/(nu-1);
                for j in 1:nv loop
                     beta := phi_start + (phi_stop)*(j-1)/(nv-1);
           //         beta := betaStartAngle + (betaStopAngle-betaStartAngle)*(j-1)/(nv-1);
                      if Modelica.Utilities.Strings.isEqual(shape,"cylindrical") then
                        temp:=IdealizedContact.ContactSurfaces.ParametricSurfaceDefinition.parametricSurfaceWrapper(shape,h, alpha, beta/Modelica.Constants.pi+0.5);
                      else
                        temp:=IdealizedContact.ContactSurfaces.ParametricSurfaceDefinition.parametricSurfaceWrapper(shape,h, alpha, beta);
                      end if;

                    //           X[i,j] := (a*sin(beta))*cos(alpha);
          //           Y[i,j] := (b*sin(beta))*sin(alpha);
          //           Z[i,j] := c*cos(beta);
                    X[i,j] := temp[1,1];
                    Y[i,j] := temp[2,1];
                    Z[i,j] := temp[3,1];
                end for;
            end for;
            annotation (Documentation(info="<!DOCTYPE html><html>
<p>
Function <b>torus</b> computes the X,Y,Z arrays to visualize a torus
with model <a href=\"modelica://Modelica.Mechanics.MultiBody.Visualizers.Torus\">Torus</a>.
The left image below shows a torus with ri=0.5 m and ro = 0.2 m.
The right images below shows the torus with the additional parameter
settings:
</p>
<pre>
  opening    =   45 degree
  startAngle = -135 degree
  stopAngle  =  135 degree
</pre>

<blockquote>
<img src=\"modelica://Modelica/Resources/Images/MultiBody/Visualizers/Torus.png\">
</blockquote>
</html>"));
          end convexSurfaceCharacteristic;
        end SurfaceCharacteristics;
      end Visualizers;

      annotation (Documentation(info="<!DOCTYPE html><html>
<p>Package of functions to describe a parametric surface.</p>
</html>"));
    end ParametricSurfaceDefinition;

    package Types "Surface types"
    extends Modelica.Icons.TypesPackage;
      type ContactShapeType = Modelica.Icons.TypeString "Type of contact shape"
         annotation ( choices(
          choice="spherical" "\"spherical\"",
          choice="cylindrical" "\"cylindrical\"",
          choice="rectangular" "\"rectangular\"",
          choice="circular" "\"circular\"",
          choice="ellipsoid" "\"ellipsoid\"",
          choice="egg" "\"egg\""),
        Documentation(info="<!DOCTYPE html><html>
<p>Type <b>ContactShapeType</b> is used to define the shape of the
contact surface object as parameter String.</p>
</html>"));
      type ConvexContactShapeType =
        IdealizedContact.ContactSurfaces.Types.ContactShapeType
      "Type of convex contact shape"
         annotation ( choices(
          choice="spherical" "\"spherical\"",
          choice="cylindrical" "\"cylindrical\"",
          choice="ellipsoid" "\"ellipsoid\"",
          choice="egg" "\"egg\""),
        Documentation(info="<!DOCTYPE html><html>
<p>Type <b>ConvexContactShapeType</b> is used to define the shape of the
convex contact surface object as parameter String.</p>
</html>"));
    end Types;
   annotation(preferredView="info", Documentation(info="<!DOCTYPE html><html>
<p>This package includes the defined contact surfaces.</p>
</html>"));
  end ContactSurfaces;


  package ElementaryContactBodies "Predefined elementary contact bodies"
    extends Modelica.Icons.Package;
    model SphericalContactBody "Predefined spherical body with contact surface"

      import SI = Modelica.SIunits;
    parameter SI.Density density=7850 "density of the material";
    parameter SI.Radius radius=0.015 "radius of the spherical contact surface";
    parameter Boolean animation=true "= true, if animation shall be enabled";
    parameter Boolean animation_BCS = true
      "= true, if animation of body coordinate system shall be enabled";
    parameter Modelica.Mechanics.MultiBody.Types.Color color={0,0,255};

    constant Real pi=Modelica.Constants.pi;

      Modelica.Mechanics.MultiBody.Parts.BodyShape sphericalBody(
        r_CM={0,0,0},
        r={0,0,0},
        angles_fixed=false,
        lengthDirection={1,0,0},
        widthDirection={0,1,0},
        v_0(fixed=false),
        shapeType="sphere",
        r_0(fixed=false),
        color=color,
        animateSphere=false,
        animation=false,
        m=(4*pi*density*radius^3)/3,
        I_11=0.4*4*pi*density*radius^3/3*radius^2,
        I_22=0.4*4*pi*density*radius^3/3*radius^2,
        r_shape={-radius,0,0},
        length=2*radius,
        width=2*radius,
        height=2*radius,
        sphereDiameter=2*radius,
        I_33=0.4*4*pi*density*radius^3/3*radius^2)
     annotation (Placement(transformation(extent={{-46,-20},{6,32}})));

      Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a "center of mass"
        annotation (Placement(transformation(extent={{-120,-16},{-76,28}}),
            iconTransformation(extent={{-100,-14},{-68,18}})));
      Interfaces.Contact_a                    contact_a
        annotation (Placement(transformation(extent={{88,-4},{108,16}}),
            iconTransformation(extent={{76,-16},{108,16}})));
      IdealizedContact.ContactSurfaces.SphericalContactSurface
                                sphericalContactSurface(
        animation=animation,
        radius=radius,
        color=color,
        animation_BCS=animation_BCS)
        annotation (Placement(transformation(extent={{20,-22},{74,34}})));
    equation

      connect(sphericalBody.frame_a, frame_a)
                                           annotation (Line(
          points={{-46,6},{-98,6}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(sphericalContactSurface.contact_a,contact_a)  annotation (Line(
          points={{72.11,6},{98,6}},
          color={255,128,0},
          smooth=Smooth.None));

      connect(sphericalBody.frame_b, sphericalContactSurface.frame_a)
        annotation (Line(
          points={{6,6},{21.08,6}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
              preserveAspectRatio=false),
                          graphics),
                  Diagram(graphics),
        Icon(coordinateSystem(extent={{-100,-100},{100,100}},    preserveAspectRatio=false),
             graphics={
            Text(
              extent={{-98,-64},{102,-104}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%name"),
            Ellipse(
              extent={{-68,72},{74,-68}},
              lineColor={0,0,0},
              fillPattern=FillPattern.Sphere,
              fillColor={0,127,255})}),
        Documentation(
          info="<!DOCTYPE html><html>
<p>This model defines a spherical body with a contact surface.</p>
</html>"));
    end SphericalContactBody;

    model CylindricalContactBody
    "Predefined cylindrical body with contact surfaces"
      import SI = Modelica.SIunits;
    parameter Boolean enableLateralSurface = true
      "= true, if lateral contact surface shall be enabled"   annotation (choices(checkBox=true));
    parameter Boolean enableFrontSurface1 = true
      "= true, if first front contact surface shall be enabled"   annotation (choices(checkBox=true));
    parameter Boolean enableFrontSurface2 = true
      "= true, if second front contact surface shall be enabled"   annotation (choices(checkBox=true));
    parameter SI.Density density=7850 "density of the material";
    parameter SI.Diameter diameter=0.015 "diameter of cylindrical surface";
    parameter SI.Length length=0.05 "length of cylindrical surface";
    parameter Modelica.Mechanics.MultiBody.Types.Axis diameterDirection={0,0,1}
      "unit vector in diameter direction";
    parameter Modelica.Mechanics.MultiBody.Types.Axis lengthDirection={1,0,0}
      "unit vector in length direction";
    final parameter Modelica.Mechanics.MultiBody.Types.Axis heightDirection=abs(cross(diameterDirection,lengthDirection));
    final parameter Modelica.Mechanics.MultiBody.Types.Axis x_direction={1,0,0};
    final parameter Modelica.Mechanics.MultiBody.Types.Axis y_direction={0,1,0};
    final parameter Modelica.Mechanics.MultiBody.Types.Axis z_direction={0,0,1};
    parameter Boolean animation=true
      "= true, if animation of the body shall be enabled";
    parameter Modelica.Mechanics.MultiBody.Types.Color color={0,0,255}
      "color of shape";
    parameter Boolean surfaceAnimation=true
      "= true, if animation of contact surfaces shall be enabled"                                       annotation (Dialog(group="contact surface animation"));
    parameter Boolean surfaceAnimation_BCS = true
      "= true, if animation of body coordinate system of contact surfaces shall be enabled"
                                                                                             annotation (Dialog(group="contact surface animation"));

    parameter Modelica.Mechanics.MultiBody.Types.Color surfaceColor={255,128,0}
      "color of the contact surface"   annotation (Dialog(group="contact surface animation"));
    constant Real pi=Modelica.Constants.pi;

      Modelica.Mechanics.MultiBody.Parts.BodyShape cylindricalBody(
        shapeType="cylinder",
        r={0,0,0},
        r_CM={0,0,0},
        angles_fixed=false,
        w_0_fixed=false,
        r_0(fixed=false),
        width=diameter,
        color=color,
        lengthDirection=lengthDirection,
        widthDirection=diameterDirection,
        I_11=0.5*pi*density*(diameter/2)^2*length*(diameter/2)^2*x_direction*
            lengthDirection + pi*density*(diameter/2)^2*length/12*(3*(diameter/2)^2
             + length^2)*x_direction*diameterDirection + pi*density*(diameter/2)^2*
            length/12*(3*(diameter/2)^2 + length^2)*x_direction*heightDirection,
        I_22=0.5*pi*density*(diameter/2)^2*length*(diameter/2)^2*y_direction*
            lengthDirection + pi*density*(diameter/2)^2*length/12*(3*(diameter/2)^2
             + length^2)*y_direction*diameterDirection + pi*density*(diameter/2)^2*
            length/12*(3*(diameter/2)^2 + length^2)*y_direction*heightDirection,
        I_33=0.5*pi*density*(diameter/2)^2*length*(diameter/2)^2*z_direction*
            lengthDirection + pi*density*(diameter/2)^2*length/12*(3*(diameter/2)^2
             + length^2)*z_direction*diameterDirection + pi*density*(diameter/2)^2*
            length/12*(3*(diameter/2)^2 + length^2)*z_direction*heightDirection,
        animateSphere=false,
        length=length,
        r_shape=-length/2*lengthDirection,
        m=pi*density*(diameter/2)^2*length,
        animation=animation)
        annotation (Placement(transformation(extent={{-2,-10},{18,10}})));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a "center of mass"
        annotation (Placement(transformation(extent={{-16,-16},{16,16}},
            rotation=90,
            origin={-8,-28}),
            iconTransformation(extent={{-16,-16},{16,16}},
            rotation=90,
            origin={-54,-60})));

      Interfaces.Contact_a contact_lateral if enableLateralSurface  annotation (Placement(transformation(extent={{-14,88},{6,108}}),
            iconTransformation(extent={{-10,58},{10,78}})));
      ContactSurfaces.CylindricalContactSurface cylindricalContactSurface(
        diameter=diameter,
        length=length,
        diameterDirection=diameterDirection,
        lengthDirection=lengthDirection,
        animation=surfaceAnimation,
        animation_BCS=surfaceAnimation_BCS,
        color=surfaceColor) if
          enableLateralSurface annotation (Placement(transformation(extent={{-36,32},{-14,56}})));
      ContactSurfaces.CircularPlaneContactSurface circularPlaneContactSurface1(
        diameter=diameter,
        lengthDirection=lengthDirection,
        diameterDirection=diameterDirection,
        animation=surfaceAnimation,
        animation_BCS=surfaceAnimation_BCS,
        color=surfaceColor) if enableFrontSurface1 annotation (Placement(transformation(extent={{60,-10},{80,10}})));
      Interfaces.Contact_a contact_front1 if enableFrontSurface1
        annotation (Placement(transformation(extent={{92,-10},{112,10}}),
            iconTransformation(extent={{86,-10},{106,10}})));
      Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation1(r=length/
            2*lengthDirection) if          enableFrontSurface1
        annotation (Placement(transformation(extent={{32,-10},{52,10}})));
      Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation2(r=length/
            2*lengthDirection) if          enableFrontSurface2
        annotation (Placement(transformation(extent={{-38,-10},{-18,10}})));
      Interfaces.Contact_a contact_front2 if enableFrontSurface2
        annotation (Placement(transformation(extent={{-110,-10},{-90,10}}),
            iconTransformation(extent={{-108,-8},{-90,10}})));
      ContactSurfaces.CircularPlaneContactSurface circularPlaneContactSurface2(
        diameter=diameter,
        lengthDirection=lengthDirection,
        diameterDirection=diameterDirection,
        animation=surfaceAnimation,
        animation_BCS=surfaceAnimation_BCS,
        color=surfaceColor) if enableFrontSurface2 annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-66,0})));
    equation

      connect(cylindricalBody.frame_a, frame_a)
                                           annotation (Line(
          points={{-2,0},{-8,0},{-8,-28}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(cylindricalBody.frame_b, cylindricalContactSurface.frame_a)
        annotation (Line(
          points={{18,0},{24,0},{24,22},{-42,22},{-42,44},{-35.56,44}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(cylindricalContactSurface.contact_a, contact_lateral)
                                                              annotation (Line(
          points={{-14.77,44},{-4,44},{-4,98}},
          color={255,128,0},
          smooth=Smooth.None));
      connect(circularPlaneContactSurface1.contact_a, contact_front1)
                                                                     annotation (
          Line(
          points={{79.3,0},{86,0},{86,0},{102,0}},
          color={255,128,0},
          smooth=Smooth.None));
      connect(cylindricalBody.frame_b, fixedTranslation1.frame_a)
                                                                 annotation (Line(
          points={{18,0},{32,0}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedTranslation1.frame_b, circularPlaneContactSurface1.frame_a)
        annotation (Line(
          points={{52,0},{60.4,0}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedTranslation2.frame_b, cylindricalBody.frame_a) annotation (Line(
          points={{-18,0},{-2,0}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(circularPlaneContactSurface2.frame_a,fixedTranslation2. frame_a)
        annotation (Line(
          points={{-56.4,-1.20015e-015},{-50,-1.20015e-015},{-50,0},{-38,0}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(circularPlaneContactSurface2.contact_a, contact_front2) annotation (
          Line(
          points={{-75.3,1.13798e-015},{-87.85,1.13798e-015},{-87.85,0},{-100,0}},
          color={255,128,0},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
              preserveAspectRatio=false),
                          graphics), Icon(coordinateSystem(extent={{-100,-100},
              {100,100}},  preserveAspectRatio=false),
                                          graphics={
            Ellipse(
              extent={{-90,66},{-62,-60}},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None,
              lineColor={0,127,255}),
            Text(
              extent={{-98,-70},{102,-100}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%name"),
            Rectangle(
              extent={{-76,66},{72,-60}},
              fillPattern=FillPattern.Solid,
              fillColor={0,0,255},
              pattern=LinePattern.None,
              lineColor={0,0,0}),
            Ellipse(
              extent={{58,66},{86,-60}},
              fillColor={0,0,143},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None)}),
        Documentation(info="<!DOCTYPE html><html>
<p>This model defines a cylindrical body that can collide with every surface. Contact surfaces can be enabled separately. The enumeration corresponds to the chosen directions and dimensions and is displayed in the Figure.</p>
<p><br/><br/><img src=\"modelica://IdealizedContact/Resources/Images/cylindricalContactBody.png\"/></p>
</html>"));
    end CylindricalContactBody;

    model CuboidContactBody "Predefined cuboid body with contact surfaces"
      import SI = Modelica.SIunits;

    parameter Boolean enableSurface1 = true
      "= true, if contact surface 1 shall be enabled"   annotation (choices(checkBox=true));
    parameter Boolean enableSurface2 = true
      "= true, if contact surface 2 shall be enabled"   annotation (choices(checkBox=true));
        parameter Boolean enableSurface3 = true
      "= true, if contact surface 3 shall be enabled"   annotation (choices(checkBox=true));
    parameter Boolean enableSurface4 = true
      "= true, if contact surface 4 shall be enabled"   annotation (choices(checkBox=true));
    parameter Boolean enableSurface5 = true
      "= true, if contact surface 5 shall be enabled"   annotation (choices(checkBox=true));
    parameter Boolean enableSurface6 = true
      "= true, if contact surface 6 shall be enabled"   annotation (choices(checkBox=true));

    parameter SI.Density density=7850 "density of the material";
    parameter SI.Length length=0.04 "length of the cuboid";
    parameter SI.Length width=0.02 "width of the cuboid";
    parameter SI.Length height=0.001 "height of the cuboid";
    parameter Modelica.Mechanics.MultiBody.Types.Axis lengthDirection={1,0,0}
      "definition of the length direction";
    parameter Modelica.Mechanics.MultiBody.Types.Axis widthDirection={0,0,1}
      "definition of the width direction";
    final parameter Modelica.Mechanics.MultiBody.Types.Axis heightDirection=abs(cross(lengthDirection,widthDirection));
    parameter Boolean animation=true
      "= true, if animation of the body shall be enabled";
    parameter Modelica.Mechanics.MultiBody.Types.Color color={0,0,255}
      "color of shape";
    parameter Boolean surfaceAnimation=true
      "= true, if animation of contact surfaces shall be enabled"                                       annotation (Dialog(group="contact surface animation"));
    parameter Boolean surfaceAnimation_BCS = true
      "= true, if animation of body coordinate system of contact surfaces shall be enabled"
                                                                                             annotation (Dialog(group="contact surface animation"));
    parameter Modelica.Mechanics.MultiBody.Types.Color surfaceColor={255,128,0}
      "color of the contact surface"   annotation (Dialog(group="contact surface animation"));

    constant Real pi=Modelica.Constants.pi;

      Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape(
        r_CM={0,0,0},
        angles_fixed=false,
        animation=true,
        shapeType="box",
        animateSphere=false,
        r_0(fixed=false),
        lengthDirection=lengthDirection,
        widthDirection=widthDirection,
        m=density*length*height*width,
        I_11=density*length*height*width*(height^2 + width^2)/12,
        I_22=density*length*height*width*(length^2 + height^2)/12,
        I_33=density*length*height*width*(length^2 + width^2)/12,
        length=length,
        width=width,
        height=height,
        color=color,
        r={0,0,0},
        r_shape=-length/2*lengthDirection)
        annotation (Placement(transformation(extent={{-28,-10},{-8,10}})));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a "center of mass"
        annotation (Placement(transformation(extent={{-16,-16},{16,16}},
            rotation=180,
            origin={-90,82}),
            iconTransformation(extent={{-98,56},{-66,88}})));

      Interfaces.Contact_a contact_a1 if enableSurface1
        annotation (Placement(transformation(extent={{-10,88},{10,108}}),
            iconTransformation(extent={{-10,74},{10,96}})));
      ContactSurfaces.RectangularPlaneContactSurface rectangularPlaneContactSurface1(
        lengthDirection=lengthDirection,
        widthDirection=widthDirection,
        color=surfaceColor,
        animation_BCS=surfaceAnimation_BCS,
        animation=surfaceAnimation,
        length=length,
        width=width) if enableSurface1
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},
            rotation=90,
            origin={0,58})));
      Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation(r=(height)
            /2*heightDirection, animation=false)
                                             annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={0,24})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation    fixedTranslation1(r=-(
            height)/2*heightDirection,
        n=lengthDirection,
        angle=180,
        animation=false)                     annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={0,-16})));
      ContactSurfaces.RectangularPlaneContactSurface rectangularPlaneContactSurface2(
        lengthDirection=lengthDirection,
        widthDirection=widthDirection,
        color=surfaceColor,
        animation_BCS=surfaceAnimation_BCS,
        animation=surfaceAnimation,
        length=length,
        width=width) if enableSurface2
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-22,-42})));
      Interfaces.Contact_a contact_a2 if enableSurface2 annotation (Placement(transformation(extent={{-32,-76},
                {-12,-56}}),          iconTransformation(extent={{-32,-76},{-12,-56}})));
      ContactSurfaces.RectangularPlaneContactSurface rectangularPlaneContactSurface3(
        color=surfaceColor,
        animation_BCS=surfaceAnimation_BCS,
        animation=surfaceAnimation,
        length=height,
        lengthDirection=heightDirection,
        width=width,
        widthDirection=widthDirection) if enableSurface3
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},
            rotation=0,
            origin={58,0})));
      Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation2(r=(length)
            /2*lengthDirection, animation=false)
                                             annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={24,0})));
      Interfaces.Contact_a contact_a3 if enableSurface3 annotation (Placement(transformation(extent={{72,-10},
                {92,10}}),       iconTransformation(extent={{72,-10},{92,10}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation    fixedTranslation3(r=-(
            length)/2*lengthDirection,
        n=heightDirection,
        angle=180,
        animation=false)                     annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-52,0})));
      ContactSurfaces.RectangularPlaneContactSurface rectangularPlaneContactSurface4(
        color=surfaceColor,
        animation_BCS=surfaceAnimation_BCS,
        animation=surfaceAnimation,
        length=height,
        lengthDirection=heightDirection,
        width=width,
        widthDirection=widthDirection) if enableSurface4
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-80,0})));
      Interfaces.Contact_a contact_a4 if enableSurface4 annotation (Placement(transformation(extent={{-112,
                -10},{-92,10}}),    iconTransformation(extent={{-112,-10},{-92,10}})));
      ContactSurfaces.RectangularPlaneContactSurface rectangularPlaneContactSurface5(
        lengthDirection=lengthDirection,
        color=surfaceColor,
        animation_BCS=surfaceAnimation_BCS,
        animation=surfaceAnimation,
        length=length,
        width=height,
        widthDirection=heightDirection) if enableSurface5
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},
            rotation=90,
            origin={62,68})));
      Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation5(r=(width)
            /2*widthDirection, animation=false)
                                             annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={38,38})));
      Interfaces.Contact_a contact_a5 if enableSurface5 annotation (Placement(transformation(extent={{52,82},
                {72,102}}),       iconTransformation(extent={{52,82},{72,102}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation    fixedTranslation4(r=-(width)
            /2*widthDirection,
        n=heightDirection,
        angle=180,
        animation=false)                     annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-46,-22})));
      ContactSurfaces.RectangularPlaneContactSurface rectangularPlaneContactSurface6(
        lengthDirection=lengthDirection,
        color=surfaceColor,
        animation_BCS=surfaceAnimation_BCS,
        animation=surfaceAnimation,
        length=length,
        width=height,
        widthDirection=heightDirection) if enableSurface6
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-66,-52})));
      Interfaces.Contact_a contact_a6 if enableSurface6 annotation (Placement(transformation(extent={{-92,-78},
                {-72,-58}}),          iconTransformation(extent={{-92,-78},{-72,-58}})));
    equation

      connect(bodyShape.frame_a, frame_a)  annotation (Line(
          points={{-28,0},{-36,0},{-36,34},{-78,34},{-78,82},{-90,82}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(rectangularPlaneContactSurface1.contact_a, contact_a1)
                                                                   annotation (Line(
          points={{5.68989e-016,67.3},{-0.45,67.3},{-0.45,98},{0,98}},
          color={255,128,0},
          pattern=LinePattern.None,
          smooth=Smooth.None));
      connect(bodyShape.frame_b, fixedTranslation.frame_a) annotation (Line(
          points={{-8,0},{-6.12323e-016,0},{-6.12323e-016,14}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedTranslation.frame_b, rectangularPlaneContactSurface1.frame_a)
        annotation (Line(
          points={{6.12323e-016,34},{6.12323e-016,38},{0,38},{0,42},{-6.00077e-016,42},{-6.00077e-016,48.4}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(rectangularPlaneContactSurface2.contact_a,contact_a2)  annotation (
          Line(
          points={{-22,-51.3},{-22,-54},{-22,-54},{-22,-66}},
          color={255,128,0},
          smooth=Smooth.None));
      connect(fixedTranslation2.frame_a, bodyShape.frame_b) annotation (Line(
          points={{14,0},{-8,0}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(rectangularPlaneContactSurface3.contact_a,contact_a3)  annotation (
          Line(
          points={{67.3,0},{67.3,0},{82,0}},
          color={255,128,0},
          smooth=Smooth.None));
      connect(rectangularPlaneContactSurface3.frame_a, fixedTranslation2.frame_b)
        annotation (Line(
          points={{48.4,0},{34,0}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedTranslation3.frame_a, bodyShape.frame_a) annotation (Line(
          points={{-42,-1.22465e-015},{-36,-1.22465e-015},{-36,0},{-28,0}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(rectangularPlaneContactSurface4.frame_a, fixedTranslation3.frame_b)
        annotation (Line(
          points={{-70.4,-1.20015e-015},{-67.1,-1.20015e-015},{-67.1,1.22465e-015},{-62,1.22465e-015}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(rectangularPlaneContactSurface4.contact_a,contact_a4)  annotation (
          Line(
          points={{-89.3,1.13798e-015},{-96,0},{-102,0}},
          color={255,128,0},
          smooth=Smooth.None));
      connect(fixedTranslation5.frame_b,rectangularPlaneContactSurface5. frame_a)
        annotation (Line(
          points={{48,38},{62,38},{62,58.4}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedTranslation5.frame_a, bodyShape.frame_b) annotation (Line(
          points={{28,38},{20,38},{20,16},{8,16},{8,0},{-8,0}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(rectangularPlaneContactSurface5.contact_a,contact_a5)  annotation (
          Line(
          points={{62,77.3},{62.95,77.3},{62.95,92},{62,92}},
          color={255,128,0},
          smooth=Smooth.None));
      connect(rectangularPlaneContactSurface6.frame_a, fixedTranslation4.frame_b)
        annotation (Line(
          points={{-66,-42.4},{-66,-38},{-46,-38},{-46,-32}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedTranslation4.frame_a, bodyShape.frame_a) annotation (Line(
          points={{-46,-12},{-46,-10},{-36,-10},{-36,0},{-28,0}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(rectangularPlaneContactSurface6.contact_a,contact_a6)  annotation (
          Line(
          points={{-66,-61.3},{-83.95,-61.3},{-83.95,-68},{-82,-68}},
          color={255,128,0},
          smooth=Smooth.None));
      connect(bodyShape.frame_b, fixedTranslation1.frame_a) annotation (Line(
          points={{-8,0},{1.83697e-015,0},{1.83697e-015,-6}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(fixedTranslation1.frame_b,rectangularPlaneContactSurface2. frame_a)
        annotation (Line(
          points={{-1.83697e-015,-26},{-22,-26},{-22,-32.4}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(contact_a5,contact_a5)  annotation (Line(
          points={{62,92},{62,92}},
          color={255,128,0},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}),
                          graphics), Icon(coordinateSystem(preserveAspectRatio=
                false, extent={{-100,-100},{100,100}}),
                                          graphics={
            Text(
              extent={{-116,-80},{84,-106}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%name"),
            Rectangle(
              extent={{-80,42},{40,-46}},
              lineColor={0,0,255},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{40,42},{60,82},{60,-6},{40,-46},{40,42}},
              lineColor={0,0,255},
              smooth=Smooth.None,
              fillColor={0,0,136},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-80,42},{-60,82},{60,82},{40,42},{-80,42}},
              lineColor={0,0,255},
              smooth=Smooth.None,
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid)}),
        Documentation(
          info="<!DOCTYPE html><html>
<p>This model defines a cuboid body that can collide with every surface. Contact surfaces can be enabled separately. The enumeration corresponds to the chosen directions and dimensions and is displayed in the Figure.</p>
<p><br/><br/><img src=\"modelica://IdealizedContact/Resources/Images/cuboidContactBody.png\"/></p>
</html>"));
    end CuboidContactBody;

    model EllipsoidContactBody
    "Predefined ellipsoid body with contact surfaces"

      parameter Modelica.SIunits.Length a=1 "radius of the 1st semiaxis";
      parameter Modelica.SIunits.Length b=1 "radius of the 2nd semiaxis";
      parameter Modelica.SIunits.Length c=1 "radius of the 3rd semiaxis";
      parameter Modelica.SIunits.Density rho=7850 "density";
      final parameter Real pi=Modelica.Constants.pi;
      final parameter Modelica.SIunits.Mass m=(4/3)*pi*a*b*c*rho
      "mass of ellipsoid";
      parameter Boolean animation=true
      "= true, if animation of the body shall be enabled"                                  annotation(Dialog(group="animation"));
      parameter Boolean animation_BCS = true
      "= true,  if animation of body coordinate system of contact surfaces shall be enabled"
                                                                                                    annotation(Dialog(group="animation"));
      parameter Modelica.Mechanics.MultiBody.Types.Color color={255,128,0}
      "color of shape"                                                                    annotation(Dialog(group="animation"));

      Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a
        annotation (Placement(transformation(extent={{-116,-16},{-84,16}}),
            iconTransformation(extent={{-116,-16},{-84,16}})));
      Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape(
        I_11=0.2*m*(b^2 + c^2),
        I_22=0.2*m*(a^2 + c^2),
        I_33=0.2*m*(a^2 + b^2),
        I_21=0,
        I_31=0,
        I_32=0,
        animation=false,
        animateSphere=false,
        m=m,
        r={0,0,0},
        r_CM={0,0,0})
        annotation (Placement(transformation(extent={{-42,-10},{-22,10}})));
      IdealizedContact.ContactSurfaces.EllipsoidContactSurface ellipsoidContactSurface(
        a=a,
        b=b,
        c=c,
        animation=animation,
        animation_BCS=animation_BCS,
        color=color)        annotation (Placement(transformation(extent={{-2,-22},{36,22}})));
       IdealizedContact.Interfaces.Contact_a contact_a
        annotation (Placement(transformation(extent={{90,-10},{110,10}}),
            iconTransformation(extent={{90,-10},{110,10}})));
    equation
      connect(frame_a, bodyShape.frame_a) annotation (Line(
          points={{-100,0},{-42,0}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(bodyShape.frame_b, ellipsoidContactSurface.frame_a)
        annotation (Line(
          points={{-22,0},{-1.24,0}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(ellipsoidContactSurface.contact_a, contact_a)
        annotation (Line(
          points={{34.67,0},{100,0}},
          color={255,128,0},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),
                          graphics), Icon(graphics={
            Ellipse(
              extent={{-96,44},{96,-44}},
              lineColor={0,0,0},
              fillPattern=FillPattern.Sphere,
              fillColor={0,127,255}),
            Text(
              extent={{-100,-52},{100,-92}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%name")}));
    end EllipsoidContactBody;

    model ConvexContactBody "Predefined convex body with contact surfaces"

    import SI = Modelica.SIunits;
    parameter IdealizedContact.ContactSurfaces.Types.ConvexContactShapeType convexContactShape = "ellipsoid"
      "shape of the contact surface";
    parameter Real h[3] "parameters of convex surface";
     parameter SI.Position r_CM[3](start={0,0,0})
      "Vector from frame_a to center of mass, resolved in frame_a";
    parameter SI.Mass m "mass of the contact body";
                       //=(4/3)*Modelica.Constants.pi*h[1]*h[2]*h[3]*7850
    parameter SI.Inertia I_11(min=0) = 0.2*m*(h[2]^2 + h[3]^2)
      " (1,1) element of inertia tensor"
        annotation (Dialog(group=
              "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
    parameter SI.Inertia I_22(min=0) = 0.2*m*(h[1]^2 + h[2]^2)
      " (2,2) element of inertia tensor"
        annotation (Dialog(group=
              "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
    parameter SI.Inertia I_33(min=0) = 0.2*m*(h[1]^2 + h[2]^2)
      " (3,3) element of inertia tensor"
        annotation (Dialog(group=
              "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
    parameter SI.Inertia I_21(min=-Modelica.Constants.inf) = 0
      " (2,1) element of inertia tensor"
        annotation (Dialog(group=
              "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
    parameter SI.Inertia I_31(min=-Modelica.Constants.inf) = 0
      " (3,1) element of inertia tensor"
        annotation (Dialog(group=
              "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
    parameter SI.Inertia I_32(min=-Modelica.Constants.inf) = 0
      " (3,2) element of inertia tensor"
        annotation (Dialog(group=
              "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
    parameter Boolean animation=true
      "= true, if animation of the body shall be enabled"                                annotation (Dialog(group="animation"));
    parameter Modelica.Mechanics.MultiBody.Types.Color color={255,128,0}
      "color of shape"                                                                  annotation (Dialog(group="animation"));
    parameter Boolean animation_BCS = true
      "= true, if animation of body coordinate system of contact surfaces shall be enabled"
                                                                                             annotation (Dialog(group="animation"));

      Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a
        annotation (Placement(transformation(extent={{-116,-16},{-84,16}}),
            iconTransformation(extent={{-116,-16},{-84,16}})));
      Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape(
        I_11=I_11,
        I_22=I_22,
        I_33=I_33,
        I_21=0,
        I_31=0,
        I_32=0,
        animation=false,
        animateSphere=false,
        m=m,
        r={0,0,0},
      r_CM=r_CM)
        annotation (Placement(transformation(extent={{-52,-10},{-32,10}})));
      IdealizedContact.ContactSurfaces.ConvexContactSurface convexContactSurface(
      color=color,
      convexContactShape=convexContactShape,
      animation=animation,
      animation_BCS=animation_BCS,
        h=h)                       annotation (Placement(transformation(extent={{-6,-22},{32,22}})));

      IdealizedContact.Interfaces.Contact_a contact_a
        annotation (Placement(transformation(extent={{90,-10},{110,10}}),
            iconTransformation(extent={{90,-10},{110,10}})));
    equation
      connect(frame_a, bodyShape.frame_a) annotation (Line(
          points={{-100,0},{-52,0}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
    connect(bodyShape.frame_b, convexContactSurface.frame_a)
      annotation (Line(
        points={{-32,0},{-5.24,0}},
        color={95,95,95},
        thickness=0.5,
        smooth=Smooth.None));
    connect(convexContactSurface.contact_a, contact_a) annotation (Line(
        points={{30.67,0},{100,0}},
        color={255,128,0},
        smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
                          graphics), Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
                                          graphics={Polygon(
            points={{-60,-72},{94,-24},{96,14},{-26,92},{-112,8},{-60,-72}},
            lineColor={0,0,0},
            lineThickness=0.5,
            fillPattern=FillPattern.Sphere,
            smooth=Smooth.Bezier,
            fillColor={0,0,255}),
            Text(
              extent={{-90,-52},{110,-92}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%name")}));
    end ConvexContactBody;
   annotation(preferredView="info", Documentation(info="<!DOCTYPE html><html>
<p>This package includes predefined elementary bodies with contact surfaces.</p>
</html>"));
  end ElementaryContactBodies;


  package ContactBlock "Contact block and its parts"
  extends Modelica.Icons.Package;
    model Contact "Contact block"
      import SI = Modelica.SIunits;
      inner parameter SI.TranslationalSpringConstant springCoefficient=1000000
      "spring coefficient to calculate normal force"   annotation(Dialog(group="Normal force"));
      inner parameter SI.TranslationalDampingConstant dampingCoefficient=100000
      "damper coefficient to calculate normal force"   annotation(Dialog(group="Normal force"));
      inner parameter Real n1 = 1.5 "stiffness exponent" annotation(Dialog(group="Normal force"));
      inner parameter Real n2 = n1 "indentation exponent" annotation(Dialog(group="Normal force"));
      inner parameter SI.Distance p_max=0.001 "maximum penetration depth" annotation(Dialog(group="Normal force"));

      parameter SI.CoefficientOfFriction mue_k=0.03
      "coefficient of kinetic friction"   annotation(Dialog(group="Stribeck curve"));
      parameter SI.CoefficientOfFriction mue_s=0.04
      "coefficient of static friction"   annotation(Dialog(group="Stribeck curve"));

      inner parameter SI.CoefficientOfFriction mue_r=0
      "coefficient of rolling friction"   annotation(Dialog(group="Stribeck curve"));

      parameter Real k_v( unit="s2/m")=0 "gradient of viscous friction" annotation(Dialog(group="Stribeck curve"));
      parameter SI.Velocity v_e1=0.01 "limit velocity of static friction" annotation(Dialog(group="Stribeck curve"));
      parameter SI.Velocity v_e2=0.1 "limit velocity of kinetic friction" annotation(Dialog(group="Stribeck curve"));

      inner parameter Real gamma1=(mue_s-tanh(2*v_e1/v_e2)*gamma4-k_v*2*v_e1)/(tanh(2*v_e2/v_e1)-tanh(2*v_e1/v_e2))-gamma4
      "friction parameter 1"                                                                        annotation(Dialog(tab="Friction model"));
      inner parameter Real gamma2=2/v_e1 "friction parameter 2" annotation(Dialog(tab="Friction model"));
      inner parameter Real gamma3=3/v_e2 "friction parameter 3" annotation(Dialog(tab="Friction model"));
      inner parameter Real gamma4=mue_k-k_v*v_e2 "friction parameter 4" annotation(Dialog(tab="Friction model"));
      inner parameter Real gamma5=gamma2 "friction parameter 5" annotation(Dialog(tab="Friction model"));
      inner parameter Real gamma6=k_v "friction parameter 6" annotation(Dialog(tab="Friction model"));

      inner parameter Boolean exact=false
      "=true for exact contact point movement; =false for filtered movement";
      inner parameter SI.Frequency f=10000
      "filter frequency to filter contact point movement"                                       annotation(Dialog(enable=not exact));

      inner parameter Boolean animation=true "= true to animate contact points"
                                                                                annotation(Dialog(tab="Animation"));
      inner parameter Modelica.SIunits.Radius radiusContactPoint=0.0025
      "radius of contact point animation"   annotation(Dialog(tab="Animation"));
      inner parameter Modelica.Mechanics.MultiBody.Types.Color
        colorContactPoints1 = {0,180,0} "color of contact points of body 1" annotation(Dialog(tab="Animation"));
      inner parameter Modelica.Mechanics.MultiBody.Types.Color
        colorContactPoints2 = {255,0,255} "color of contact points of body 2" annotation(Dialog(tab="Animation"));

       parameter Boolean enableContactOutput = false
      "enable boolean output of contact detection"                                                 annotation(choices(checkBox=true));

      replaceable
      IdealizedContact.ContactBlock.PunctiformContact.SphereToSphere              contactDefinition
        constrainedby IdealizedContact.Components.PartialContactBlock
      "select contact surface combination (first surface mentioned must be connected to port 1)"
        annotation (Placement(transformation(extent={{-14,-24},{44,34}})),  choices(
              choice(redeclare
            IdealizedContact.ContactBlock.PunctiformContact.SphereToRectangle                       contactDefinition
            "SphereToRectangle"),
              choice(redeclare
            IdealizedContact.ContactBlock.PunctiformContact.SphereToCircle
              contactDefinition "SphereToCircle"),
              choice(redeclare
            IdealizedContact.ContactBlock.PunctiformContact.SphereToCylinder                        contactDefinition
            "SphereToCylinder"),
              choice(redeclare
            IdealizedContact.ContactBlock.PunctiformContact.SphereToSphere
              contactDefinition "SphereToSphere"),
              choice(redeclare
            IdealizedContact.ContactBlock.LinearContact.CylinderToRectangle
              contactDefinition "CylinderToRectangle"),
              choice(redeclare
            IdealizedContact.ContactBlock.LinearContact.CylinderToCircle                            contactDefinition
            "CylinderToCircle"),
              choice(redeclare
            IdealizedContact.ContactBlock.LinearContact.CylinderToCylinderLine
              contactDefinition "CylinderToCylinderLine"),
              choice(redeclare
            IdealizedContact.ContactBlock.LinearContact.CylinderToCylinderPoint
              contactDefinition "CylinderToCylinderPoint"),
              choice(redeclare
            IdealizedContact.ContactBlock.LinearContact.CylinderToCylinderCombined
                                                                                                    contactDefinition
            "CylinderToCylinderCombined"),
              choice(redeclare
            IdealizedContact.ContactBlock.PlanarContact.RectangleToRectangle
              contactDefinition "RectangleToRectangle"),
              choice(redeclare
            IdealizedContact.ContactBlock.PlanarContact.CircleToRectangle                           contactDefinition
            "CircleToRectangle"),
              choice(redeclare
            IdealizedContact.ContactBlock.PunctiformContact.ConvexToPlane                           contactDefinition
            "ConvexToPlane"),
              choice(redeclare
            IdealizedContact.ContactBlock.PunctiformContact.ConvexToConvex                          contactDefinition
            "ConvexToConvex")),
                Dialog(group="Contact specification"));
      IdealizedContact.Interfaces.Contact_b Port1
        annotation (Placement(transformation(extent={{2,60},{22,80}}),
            iconTransformation(extent={{-20,90},{20,128}})));
      IdealizedContact.Interfaces.Contact_b Port2
        annotation (Placement(transformation(extent={{8,-86},{28,-66}}),
            iconTransformation(extent={{-20,-130},{20,-92}})));

      Modelica.Blocks.Interfaces.BooleanOutput contact if enableContactOutput
        annotation (Placement(transformation(extent={{94,-6},{114,14}})));
    equation
      assert(v_e1<v_e2,"Limit velocity of static friction (v_e1) must be smaller than the limit velocity of kinetic friction (v_e2)");
      connect(contactDefinition.frame_a, Port1.frame)
                                                 annotation (Line(
          points={{-14.58,29.94},{-44,29.94},{-44,54},{12,54},{12,70}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(contactDefinition.frame_b, Port2.frame)
                                                annotation (Line(
          points={{-14.58,-16.46},{-38,-16.46},{-38,-60},{18,-60},{18,-76}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(Port1.u, contactDefinition.vector_1)
                                             annotation (Line(
          points={{12,70},{12,54},{-52,54},{-52,15.73},{-16.03,15.73}},
          color={255,128,0},
          smooth=Smooth.None));
      connect(contactDefinition.vector_2, Port2.u)
                                             annotation (Line(
          points={{-15.74,-3.7},{-52,-3.7},{-52,-60},{18,-60},{18,-76}},
          color={255,128,0},
          smooth=Smooth.None));
    connect(Port1.contactShape, contactDefinition.surfaceType1) annotation (Line(
        points={{12,70},{12,54},{-52,54},{-52,10},{-34,10},{-34,9.93},{-16.03,9.93}},
        color={255,128,0},
        smooth=Smooth.None));
    connect(Port2.contactShape, contactDefinition.surfaceType2)
      annotation (Line(
        points={{18,-76},{18,-60},{-52,-60},{-52,-8.92},{-15.74,-8.92}},
        color={255,128,0},
        smooth=Smooth.None));
     if enableContactOutput then
      connect(contactDefinition.contact, contact) annotation (Line(
          points={{45.74,4.42},{66.87,4.42},{66.87,4},{104,4}},
          color={255,0,255},
          smooth=Smooth.None));
      end if;
        annotation (Placement(transformation(extent={{-20,0},{0,20}})),
                  Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),
                          graphics), Icon(graphics={Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={255,128,0},
              fillColor={255,128,0},
              fillPattern=FillPattern.Solid), Text(
              extent={{-94,28},{94,-18}},
              lineColor={255,255,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%name"),
            Text(
              extent={{28,-106},{44,-134}},
              lineColor={255,128,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="2"),
            Text(
              extent={{26,132},{42,104}},
              lineColor={255,128,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="1")}),
        Documentation(info="<!DOCTYPE html><html>
<p>Depending on the shape, we use 1 (sphere), 2 (cylinder) or 4 (plane) points to describe the surfaces of the contact partners. These constitute potential contact points. For each of them the collision detection is performed. For this purpose, analytic solutions for simple geometries are provided in the library. As the contact region may alter with the moving bodies, the contact points will also move on the defined surface.</p>
<p>Then, the contact block calculates the appropriate force depending on the combination of surfaces. So, using it the respective combination of contact surface has to be chosen at first by setting the parameter contactDefinition. This will use the Modelica replaceable statement to define the appropriate components of the contact block. Then connect the contact interfaces of the two contact surfaces to the respective port of the contact block (first&nbsp;surface&nbsp;mentioned&nbsp;must&nbsp;be&nbsp;connected&nbsp;to&nbsp;port&nbsp;1).</p>
<p>In the case of a collision of the two connected surface (the contact condition holds for at least one contact point) a three-dimensional contact force is applied. It consists of both the normal force and the tangential friction. The respective directions can be obtained by means of the local coordinate systems in the contact points. As compared to more complex models, the continuous surface layer is replaced by a nonlinear spring/damper element. Consequently, the normal force Fn&nbsp;is determined by means of the penetration p&nbsp;and the penetration velocity. A continuous contact force model with hysteresis damping according to [1] is implemented. Nevertheless, choosing n1=1 and n=0&nbsp;one can get the linear Kelvin-Voigt model, where the coefficients are the spring and damping constant. Choosing n1=n2&nbsp;one will get the formulation according to [2].</p>
<p><img src=\"modelica://IdealizedContact/Resources/Images/equations/Fn.jpg\"/></p>
<p><br/>In order to calculate the friction forces without further discontinuous events, which would decrease the simulation speed and impede controller design, we use the continuously differentiable friction model of Makkar et al. [3]. They introduced the following function of the relative velocity&nbsp;to approximate the friction coefficient&nbsp;of the characteristic Stribeck curve.</p>
<p><img src=\"modelica://IdealizedContact/Resources/Images/equations/mue.jpg\"/></p>
<p>In doing so, no ideal static friction can be obtained because the actual force to be applied in the static state is independent from the relative velocity&nbsp;of the two bodies. Static friction is rather represented by sliding with very small relative velocities. To set the unknown constants gamma_i we use five parameters, which can be seen in the figure. The parameters mue_s&nbsp;and mue_k&nbsp;denote the coefficients of static and kinetic friction. The limit velocity v_e1&nbsp;and v_e2&nbsp;define the beginning of mixed and viscous friction. The latter is described by the proportionality factor k_v. The actual approximation can be monitored by calling the function <a href=\"IdealizedContact.ContactBlock.plotFrictionCurve\">plotFrictionCurve</a>.</p>
<p><br/><br/><img src=\"modelica://IdealizedContact/Resources/Images/mue.jpg\"/></p>
<p><br/>The complete vector of the contact force is then computed as follows.</p>
<p><img src=\"modelica://IdealizedContact/Resources/Images/equations/Fcontact.jpg\"/></p>
<p><b>Note:</b> The collision of two cylinders can lead to linear or punctiform contact regions. The calculation for these two cases is currently separated in two blocks. Integration of the two blocks is in progress.</p>
<h4>References:</h4>
<p>[1]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; H. M. Lankarani, P. E. Nikravesh: Continuous Contact Force Models for Impact Analysis in Multibody Systems, Nonlinear Dynamics, 5, 1994</p>
<p>[2]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; K. H. Hunt, F. R. E. Crossley: Coefficient of restitution interpreted as damping in vibroimpact, ASME J. Appl. Mech, 1975</p>
<p>[3]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; C. Makkar, W. E. Dixon, W. G. Sawyer, G. Hu: A New Continuously Differentiable Friction Model for Control Systems Design, Proceedings of the 2005 IEEE/ASME International Conference on Advanced Intelligent Mechatronics, Monterey CA, July, 2005</p>
</html>"));
    end Contact;

    function plotFrictionCurve
    "Visualize approximation of Stribeck friction curve"
      import SI = Modelica.SIunits;
    input SI.CoefficientOfFriction mue_k=0.03 "coefficient of kinetic friction"
                                          annotation(Dialog(group="Stribeck curve"));
    input SI.CoefficientOfFriction mue_s=0.04 "coefficient of static friction"
                                         annotation(Dialog(group="Stribeck curve"));
    input Real k_v( unit="s2/m")=0 "gradient of viscous friction" annotation(Dialog(group="Stribeck curve"));
    input SI.Velocity v_e1=0.01 "limit velocity of static friction" annotation(Dialog(group="Stribeck curve"));
    input SI.Velocity v_e2=0.1 "limit velocity of kinetic friction" annotation(Dialog(group="Stribeck curve"));

    input Real gamma1=(mue_s-tanh(2*v_e1/v_e2)*gamma4-k_v*2*v_e1)/(tanh(2*v_e2/v_e1)-tanh(2*v_e1/v_e2))-gamma4
      "friction parameter 1"                                                                        annotation(Dialog(tab="Friction model"));
    input Real gamma2=2/v_e1 "friction parameter 2" annotation(Dialog(tab="Friction model"));
    input Real gamma3=3/v_e2 "friction parameter 3" annotation(Dialog(tab="Friction model"));
    input Real gamma4=mue_k-k_v*v_e2 "friction parameter 4" annotation(Dialog(tab="Friction model"));
    input Real gamma5=gamma2 "friction parameter 5" annotation(Dialog(tab="Friction model"));
    input Real gamma6=k_v "friction parameter 6" annotation(Dialog(tab="Friction model"));

  protected
    function frictionCoefficient
    input Real gamma1;
        input Real gamma2;
        input Real gamma3;
        input Real gamma4;
        input Real gamma5;
        input Real gamma6;
        input Real v_rel;
    output Real mue;
    algorithm
      mue:=gamma1*(tanh(gamma2*v_rel) - tanh(gamma3*v_rel)) + gamma4*tanh(gamma5*
          v_rel) + gamma6*v_rel;
    end frictionCoefficient;

    algorithm
    createPlot(id=  0,
     position=  {15, 10, 610, 454},
     y=  fill("", 0),
     range=  {0.0, 0.3, -0.005, 0.04},
     autoscale=  true,
     autoerase=  true,
     autoreplot=  true,
     description=  false,
     grid=  true,
     color=  true,
     online=  false,
     leftTitle=  "mue",
     bottomTitle=  "v_rel");
    plotArray(x=0:v_e1/100:3*v_e2,y=IdealizedContact.ContactBlock.plotFrictionCurve.frictionCoefficient(gamma1, gamma2, gamma3, gamma4, gamma5, gamma6, 0:v_e1/100:3*v_e2),legend="Stribeck curve approximation",id=   0);
    Modelica.Utilities.Streams.print("gamma1="+String(gamma1)+"\n"+"gamma2="+String(gamma2)+"\n"+"gamma3="+String(gamma3)+"\n"+"gamma4="+String(gamma4)+"\n"+"gamma5="+String(gamma5)+"\n"+"gamma6="+String(gamma6));

      annotation (preferedView="info",interactive=true,Documentation(info="<!DOCTYPE html><html>
<p>This function plots the Stribeck curve approximation which is implemented in the contact block.</p>
<p>In order to calculate the friction forces without further discontinuous events, which would decrease the simulation speed and impede controller design, we use the continuously differentiable friction model of Makkar et al. [3]. They introduced the following function of the relative velocity&nbsp;to approximate the friction coefficient&nbsp;of the characteristic Stribeck curve.</p>
<p><img src=\"modelica://IdealizedContact/Resources/Images/equations/mue.jpg\"/></p>
<p>To set the unknown constants gamma_i we use five parameters, which can be seen in the figure. The parameters mue_s&nbsp;and mue_k&nbsp;denote the coefficients of static and kinetic friction. The limit velocity v_e1&nbsp;and v_e2&nbsp;define the beginning of mixed and viscous friction. The latter is described by the proportionality factor k_v. To display the current curve attune the inputs of the function.</p>
<p><br/><br/><img src=\"modelica://IdealizedContact/Resources/Images/mue.jpg\"/></p>
</html>"));
    end plotFrictionCurve;

    package PunctiformContact "Source package for punctiform contact"
      model SphereToSphere
       extends IdealizedContact.Components.PartialContactBlock;

    public
        IdealizedContact.ContactBlock.PunctiformContact.Components.MovePointSphereToSphere
                                                                                           geometry(
        colorContactPoint_Ball1=colorContactPoints1,
        colorContactPoint_Ball2=colorContactPoints2,
        radiusContactPoint=radiusContactPoint,
        Animation=animation) annotation (Placement(transformation(extent={{-60,20},{-20,60}})));
        IdealizedContact.ContactBlock.PunctiformContact.Components.ForceSphereToSphere
                                                                                       force(
        c=springCoefficient,
        d=dampingCoefficient,
        n1=N1,
        n2=N2,
        t_max=p_max,
        gamma1=gamma1,
        gamma2=gamma2,
        gamma3=gamma3,
        gamma4=gamma4,
        gamma5=gamma5,
        gamma6=gamma6,
        mue_r=mue_r) annotation (Placement(transformation(extent={{0,-40},{40,0}})));

      equation
        assert((Modelica.Utilities.Strings.isEqual(surfaceType1,"spherical") and Modelica.Utilities.Strings.isEqual(surfaceType2,"spherical")),"Error in contact specification: Contact definition is SphereToSphere but other contact surfaces are connected to the contact block.",AssertionLevel.error);
      connect(force.frame_a2, geometry.frame_b2)
        annotation (Line(
          points={{12,0},{12,28},{-19.6,28}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(geometry.frame_b1, force.frame_a1)
        annotation (Line(
          points={{-19.6,52},{24,52},{24,0}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(geometry.frame_a1, frame_a)
        annotation (Line(
          points={{-60.4,52},{-80,52},{-80,86},{-102,86}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(geometry.frame_a2, frame_b)
        annotation (Line(
          points={{-60.4,28},{-68,28},{-68,-74},{-102,-74}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(geometry.vector_ball1, vector_1)
        annotation (Line(
          points={{-61.6,42},{-84,42},{-84,37},{-107,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(geometry.vector_ball2, vector_2)
        annotation (Line(
          points={{-61.6,34},{-78,34},{-78,-30},{-106,-30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(force.Vector_ball1, vector_1)
        annotation (Line(
          points={{-1.6,-28},{-84,-28},{-84,37},{-107,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(force.vector_ball2, vector_2)
        annotation (Line(
          points={{-1.6,-36},{-78,-36},{-78,-30},{-106,-30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(force.w_mov2, geometry.w2)
        annotation (Line(
          points={{-1.6,-1.6},{-25.8,-1.6},{-25.8,18},{-25.2,18}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(force.w_mov1, geometry.w1) annotation (Line(
          points={{-1.6,-9.2},{-36,-9.2},{-36,18}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(force.pos_rel_BCS1, geometry.pos_rel2)
        annotation (Line(
          points={{-1.6,-16},{-44,-16},{-44,18}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(force.pos_rel_BCS2, geometry.pos_rel1)
        annotation (Line(
          points={{-1.6,-22},{-50.8,-22},{-50.8,18}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(force.contact, contact) annotation (Line(
          points={{41.2,-20.4},{60,-20.4},{60,-2},{106,-2}},
          color={255,0,255},
          smooth=Smooth.None));
        annotation (Icon(graphics={                   Rectangle(extent={{-100,
                    100},{100,-100}},
                                 lineColor={255,128,0}), Text(
                extent={{-82,10},{82,-10}},
                lineColor={0,0,255},
              textString="%name")}),        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),                  graphics));
      end SphereToSphere;
    extends Modelica.Icons.SourcesPackage;
      model SphereToCylinder
        extends IdealizedContact.Components.PartialContactBlock;

    public
        IdealizedContact.ContactBlock.PunctiformContact.Components.MovePointSphereToCylinder
                                                                                             geometry(
        f=f,
        Animation=animation,
        radiusContactPoint=radiusContactPoint,
        colorContactPoints1=colorContactPoints1,
        Color_contact_point_cylinder=colorContactPoints2) annotation (Placement(transformation(extent={{-60,20},{-20,60}})));
        IdealizedContact.ContactBlock.PunctiformContact.Components.ForceSphereToCylinder
                                                                                         force(
        c=springCoefficient,
        d=dampingCoefficient,
        n1=N1,
        n2=N2,
        t_max=p_max,
        gamma1=gamma1,
        gamma2=gamma2,
        gamma3=gamma3,
        gamma4=gamma4,
        gamma5=gamma5,
        gamma6=gamma6,
        mue_r=mue_r) annotation (Placement(transformation(extent={{-10,-40},{30,0}})));
      equation
        assert(Modelica.Utilities.Strings.isEqual(surfaceType1,"spherical") and Modelica.Utilities.Strings.isEqual(surfaceType2,"cylindrical"),"Error in contact specification: Contact definition is SphereToCylinder but other contact surfaces are connected to the contact block.",level=AssertionLevel.error);
      connect(geometry.frame_b1, force.frame_a1)
        annotation (Line(
          points={{-19.6,28},{2,28},{2,0.4}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(geometry.frame_b2, force.frame_a2)
        annotation (Line(
          points={{-19.6,52},{18,52},{18,0.4}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(geometry.frame_a2, frame_a)
        annotation (Line(
          points={{-60.4,52},{-80.2,52},{-80.2,86},{-102,86}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(frame_b, geometry.frame_a1)
        annotation (Line(
          points={{-102,-74},{-68,-74},{-68,28},{-60.4,28}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(vector_1, geometry.Vector_ball)
        annotation (Line(
          points={{-107,37},{-86,37},{-86,44},{-61.6,44}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(vector_2, geometry.vector_cy)
        annotation (Line(
          points={{-106,-30},{-80,-30},{-80,36},{-61.6,36}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(force.Vector_ball, vector_1)
        annotation (Line(
          points={{-11.6,-32},{-86,-32},{-86,37},{-107,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(force.vector_cy, vector_2)
        annotation (Line(
          points={{-11.6,-40},{-80,-40},{-80,-30},{-106,-30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(force.pos_ctb_BCS1, geometry.pos_ctb_BCS1)
        annotation (Line(
          points={{-11.6,0},{-24,0},{-24,18}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(force.pos_ctb_BCS4, geometry.pos_ctb_BCS4)
        annotation (Line(
          points={{-11.6,-6},{-32,-6},{-32,18}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(force.pos_b_BCSA, geometry.pos_b_BCSA)
        annotation (Line(
          points={{-11.6,-12.8},{-40,-12.8},{-40,18}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(force.w_mov1, geometry.w_mov1) annotation (Line(
          points={{-11.6,-20},{-48,-20},{-48,18}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(force.w_mov2, geometry.w_mov2) annotation (Line(
          points={{-11.6,-26},{-56,-26},{-56,18}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(force.contact, contact) annotation (Line(
          points={{31.2,-20.4},{64.6,-20.4},{64.6,-2},{106,-2}},
          color={255,0,255},
          smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent=
                {{-100,-100},{100,100}}),
                            graphics), Icon(graphics={Rectangle(extent={{-100,100},{100,
                    -100}},      lineColor={255,128,0}), Text(
                extent={{-82,10},{82,-10}},
                lineColor={0,0,255},
              textString="%name")}));
      end SphereToCylinder;

      model SphereToRectangle
        extends IdealizedContact.Components.PartialContactBlock;

    public
        IdealizedContact.ContactBlock.PunctiformContact.Components.MovePointSphereToRectangle
                                                                                              geometry(
        f=f,
        Animation=animation,
        radiusContactPoint=radiusContactPoint,
        colorContactPoints1=colorContactPoints1,
        Color_contact_point_rectangle=colorContactPoints2) annotation (Placement(transformation(extent={{-60,20},{-20,60}})));
        IdealizedContact.ContactBlock.PunctiformContact.Components.ForceSphereToRectangle
                                                                                          force(
        c=springCoefficient,
        d=dampingCoefficient,
        n1=N1,
        n2=N2,
        t_max=p_max,
        gamma1=gamma1,
        gamma2=gamma2,
        gamma3=gamma3,
        gamma4=gamma4,
        gamma5=gamma5,
        gamma6=gamma6,
        mue_r=mue_r) annotation (Placement(transformation(extent={{-20,-40},{20,0}})));
      equation
        assert((Modelica.Utilities.Strings.isEqual(surfaceType1,"spherical") and Modelica.Utilities.Strings.isEqual(surfaceType2,"rectangular")),"Error in contact specification: Contact definition is SphereToRectangle but other contact surfaces are connected to the contact block.",level=AssertionLevel.error);
      connect(geometry.frame_b1, force.frame_a1)
        annotation (Line(
          points={{-19.6,28},{-12,28},{-12,0.4}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(geometry.frame_b2, force.frame_a2) annotation (Line(
          points={{-19.6,52},{3.55271e-016,52},{3.55271e-016,0.4}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(vector_2, force.vector_r)
        annotation (Line(
          points={{-106,-30},{-80,-30},{-80,-38.8},{-21.6,-38.8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(vector_2, geometry.vector_r)
        annotation (Line(
          points={{-106,-30},{-80,-30},{-80,34},{-61.6,34}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(vector_1, geometry.Vector_ball)
        annotation (Line(
          points={{-107,37},{-86,37},{-86,42},{-61.6,42}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(vector_1, force.vector_ball)
        annotation (Line(
          points={{-107,37},{-86,37},{-86,-30.8},{-21.6,-30.8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(geometry.pos_rel_mb_BCS2, force.r_rel1)
        annotation (Line(
          points={{-18.4,40},{9.6,40},{9.6,1.6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(force.w_mov, geometry.w) annotation (Line(
          points={{-21.6,-24},{-48,-24},{-48,18.4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(force.pos_ctb_BCS1, geometry.pos_ctb_BCS1)
        annotation (Line(
          points={{-21.6,-16},{-32,-16},{-32,18.4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(force.pos_rel, geometry.pos_rel)
        annotation (Line(
          points={{-21.6,-9.2},{-21.6,-3.6},{-24,-3.6},{-24,18.4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(frame_a, geometry.frame_a2)
        annotation (Line(
          points={{-102,86},{-82,86},{-82,52},{-60.4,52}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(frame_b, geometry.frame_a1)
        annotation (Line(
          points={{-102,-74},{-74,-74},{-74,28},{-60.4,28}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(force.contact, contact) annotation (Line(
          points={{21.2,-20.4},{60.6,-20.4},{60.6,-2},{106,-2}},
          color={255,0,255},
          smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),
                            graphics), Icon(graphics={Rectangle(extent={{-100,100},{100,
                    -100}},      lineColor={255,128,0}), Text(
                extent={{-82,10},{82,-10}},
                lineColor={0,0,255},
              textString="%name")}));
      end SphereToRectangle;

      model SphereToCircle
        extends IdealizedContact.Components.PartialContactBlock;

    public
        IdealizedContact.ContactBlock.PunctiformContact.Components.MovePointSphereToCircle
                                                                                           geometry(
        f=f,
        Animation=animation,
        radiusContactPoint=radiusContactPoint,
        colorContactPoints1=colorContactPoints1,
        Color_contact_point_circle=colorContactPoints2) annotation (Placement(transformation(extent={{-40,20},{0,60}})));
        IdealizedContact.ContactBlock.PunctiformContact.Components.ForceSphereToCircle
                                                                                       force(
        c=springCoefficient,
        d=dampingCoefficient,
        n1=N1,
        n2=N2,
        t_max=p_max,
        gamma1=gamma1,
        gamma2=gamma2,
        gamma3=gamma3,
        gamma4=gamma4,
        gamma5=gamma5,
        gamma6=gamma6,
        mue_r=mue_r) annotation (Placement(transformation(extent={{0,-40},{40,0}})));
      equation
        assert((Modelica.Utilities.Strings.isEqual(surfaceType1,"spherical") and Modelica.Utilities.Strings.isEqual(surfaceType2,"circular")),"Error in contact specification: Contact definition is SphereToCircle but other contact surfaces are connected to the contact block.",level=AssertionLevel.error);

      connect(geometry.frame_b1, force.frame_a1)
        annotation (Line(
          points={{0.4,28},{8,28},{8,0.4}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(geometry.frame_b2, force.frame_a2)
        annotation (Line(
          points={{0.4,52},{20,52},{20,0.4}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(vector_1, geometry.Vector_ball)
        annotation (Line(
          points={{-107,37},{-85,37},{-85,42},{-41.6,42}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(vector_1, force.vector_ball)
        annotation (Line(
          points={{-107,37},{-84,37},{-84,-30.8},{-1.6,-30.8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(vector_2, force.vector_c)
        annotation (Line(
          points={{-106,-30},{-56,-30},{-56,-38.8},{-1.6,-38.8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(vector_2, geometry.vector_circle)
        annotation (Line(
          points={{-106,-30},{-56,-30},{-56,34},{-41.6,34}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(geometry.pos_rel_mb_BCS2, force.r_rel)
        annotation (Line(
          points={{2,40},{28,40},{28,1.6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(force.pos_rel, geometry.pos_rel)
        annotation (Line(
          points={{-1.6,-9.2},{-2,-9.2},{-2,18.4},{-4,18.4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(force.pos_ctb_BCS1, geometry.pos_ctb_BCS1)
        annotation (Line(
          points={{-1.6,-16},{-12,-16},{-12,18.4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(force.w_mov, geometry.w) annotation (Line(
          points={{-1.6,-22.8},{-28,-22.8},{-28,18.4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(geometry.frame_a2, frame_a)
        annotation (Line(
          points={{-40.4,52},{-70.2,52},{-70.2,86},{-102,86}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(frame_b, geometry.frame_a1)
        annotation (Line(
          points={{-102,-74},{-74,-74},{-74,28},{-40.4,28}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(force.contact, contact) annotation (Line(
          points={{41.2,-20.4},{68.6,-20.4},{68.6,-2},{106,-2}},
          color={255,0,255},
          smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),
                            graphics), Icon(graphics={Rectangle(extent={{-100,100},{100,
                    -100}},      lineColor={255,128,0}), Text(
                extent={{-82,10},{82,-10}},
                lineColor={0,0,255},
              textString="%name")}));
      end SphereToCircle;

      model ConvexToConvex
        extends IdealizedContact.Components.PartialContactBlock;

    public
        IdealizedContact.ContactBlock.PunctiformContact.Components.MovePointConvexToConvex
          geometry(
          f=f,
          Animation=animation,
          radiusContactPoint=radiusContactPoint,
          colorContactPoint1=colorContactPoints1,
          colorContactPoint2=colorContactPoints2)
          annotation (Placement(transformation(extent={{-60,16},{-18,60}})));

        IdealizedContact.ContactBlock.PunctiformContact.Components.ForceConvexToConvex
          force(
          c=springCoefficient,
          d=dampingCoefficient,
          gamma1=gamma1,
          gamma2=gamma2,
          gamma3=gamma3,
          gamma4=gamma4,
          gamma5=gamma5,
          gamma6=gamma6,
          mue_r=mue_r,
          n1=n1,
          n2=n2,
          p_max=p_max)
          annotation (Placement(transformation(extent={{-18,-42},{22,-2}})));
      equation
        connect(geometry.frame_b1,force. frame_a1)
          annotation (Line(
            points={{-18,19.2},{-10,19.2},{-10,-1.6}},
            color={95,95,95},
            thickness=0.5,
            smooth=Smooth.None));
        connect(geometry.frame_b,force. frame_a2)
          annotation (Line(
            points={{-18,57.2},{0,57.2},{0,-1.6},{2,-1.6}},
            color={95,95,95},
            thickness=0.5,
            smooth=Smooth.None));
        connect(geometry.u1, vector_1)              annotation (Line(
            points={{-60.1313,47.2},{-82,47.2},{-82,37},{-107,37}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(geometry.u2, vector_2)              annotation (Line(
            points={{-60,33.2},{-60,36},{-70,36},{-70,-30},{-106,-30}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(geometry.distance,force. distance)
          annotation (Line(
            points={{-18,36.6},{-6,36.6},{-6,36},{11.6,36},{11.6,-0.4}},
            color={0,0,127},
            smooth=Smooth.None));
      connect(frame_a,geometry. frame_a) annotation (Line(
          points={{-102,86},{-82,86},{-82,57.2},{-60,57.2}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(frame_b,geometry. frame_a1) annotation (Line(
          points={{-102,-74},{-64,-74},{-64,19.2},{-60,19.2}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(surfaceType1,geometry. surfaceType1) annotation (Line(
          points={{-107,17},{-80,17},{-80,40},{-70,40},{-70,41.4},{-60,41.4}},
          color={255,128,0},
          smooth=Smooth.None));
      connect(surfaceType2,geometry. surfaceType2)
        annotation (Line(
          points={{-106,-48},{-74,-48},{-74,28},{-60,28}},
          color={255,128,0},
          smooth=Smooth.None));
      connect(geometry.normal_basis_trf, force.normalbasis)
        annotation (Line(
          points={{-37.6875,15},{-37.6875,-30},{-18,-30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(geometry.v_rel, force.v_rel)
        annotation (Line(
          points={{-49.6313,15},{-49.6313,-14},{-18,-14}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(force.contact, contact) annotation (Line(
          points={{23.2,-22.4},{59.6,-22.4},{59.6,-2},{106,-2}},
          color={255,0,255},
          smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),
                            graphics), Icon(graphics={Rectangle(extent={{-100,100},{100,
                    -100}},      lineColor={255,128,0}), Text(
                extent={{-82,10},{82,-10}},
                lineColor={0,0,255},
              textString="%name")}));
      end ConvexToConvex;

      model ConvexToPlane
        extends IdealizedContact.Components.PartialContactBlock;

    public
        Components.MovePointConvexToPlane                                                                                      geometry(
        animation=animation,
        radiusContactPoint=radiusContactPoint,
        colorContactPoint1=colorContactPoints1,
        colorContactPoint2=colorContactPoints2) annotation (Placement(transformation(extent={{-60,20},{-20,60}})));
        Components.ForceConvexToPlane                                                                                      force(
        c=springCoefficient,
        d=dampingCoefficient,
        n1=N1,
        n2=N2,
        t_max=p_max,
        gamma1=gamma1,
        gamma2=gamma2,
        gamma3=gamma3,
        gamma4=gamma4,
        gamma5=gamma5,
        gamma6=gamma6,
        mue_r=mue_r) annotation (Placement(transformation(extent={{-18,-42},{22,-2}})));
      equation
         assert(Modelica.Utilities.Strings.isEqual(surfaceType2,"rectangular") or Modelica.Utilities.Strings.isEqual(surfaceType2,"circular"),"Error in contact specification: Contact definition is EllipsoidToRectangle but other contact surfaces are connected to the contact block.",level=AssertionLevel.error);

      connect(geometry.frame_b1, force.frame_a1)
        annotation (Line(
          points={{-20,23.6364},{-10,23.6364},{-10,-2}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(geometry.frame_b, force.frame_a2)
        annotation (Line(
          points={{-20,56.3636},{0,56.3636},{0,-1.6},{2,-1.6}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(geometry.u1, vector_1)
        annotation (Line(
          points={{-60,45.4545},{-82,45.4545},{-82,37},{-107,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(geometry.u2, vector_2)
        annotation (Line(
          points={{-60,34.5455},{-60,34},{-70,34},{-70,-30},{-106,-30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(geometry.vrel, force.vrel)
        annotation (Line(
          points={{-51.2,18.1818},{-52,18.1818},{-52,-10},{-18,-10}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(geometry.prel, force.prel)
        annotation (Line(
          points={{-18.6667,41.8182},{-18.6667,42},{14,42},{14,-2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(frame_b, geometry.frame_a1) annotation (Line(
          points={{-102,-74},{-82,-74},{-82,23.6364},{-60,23.6364}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(frame_a, geometry.frame_a)
        annotation (Line(
          points={{-102,86},{-82,86},{-82,56.3636},{-60,56.3636}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
        connect(surfaceType1, geometry.surfaceType1)
          annotation (Line(
            points={{-107,17},{-92,17},{-92,49.4545},{-60.2667,49.4545}},
            color={255,128,0},
            smooth=Smooth.None));
        connect(surfaceType2, geometry.surfaceType2)
          annotation (Line(
            points={{-106,-48},{-84,-48},{-84,28.7273},{-60.2667,28.7273}},
            color={255,128,0},
            smooth=Smooth.None));
      connect(force.contact, contact) annotation (Line(
          points={{23.2,-22.4},{61.6,-22.4},{61.6,-2},{106,-2}},
          color={255,0,255},
          smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),
                            graphics), Icon(graphics={Rectangle(extent={{-100,100},{100,
                    -100}},      lineColor={255,128,0}), Text(
                extent={{-82,10},{82,-10}},
                lineColor={0,0,255},
              textString="%name")}));
      end ConvexToPlane;

      package Components
      extends Modelica.Icons.BasesPackage;
        model MovePointSphereToSphere
         // parameter Modelica.SIunits.Frequency f=100000;
          parameter Boolean Animation=true;
          parameter Modelica.SIunits.Radius radiusContactPoint=0.005;
          parameter Modelica.Mechanics.MultiBody.Types.Color
            colorContactPoint_Ball1 =                                                {0,180,0};
          parameter Modelica.Mechanics.MultiBody.Types.Color
            colorContactPoint_Ball2 =                                                {255,0,255};

          final parameter Modelica.Mechanics.MultiBody.Types.Axis y_direction={0,1,0}
          "cartesian coordinate system in y direction -- default gravity direction";
          final parameter Modelica.Mechanics.MultiBody.Types.Axis x_direction={1,0,0}
          "cartesian coordinate system in x direction";
          final parameter Modelica.Mechanics.MultiBody.Types.Axis z_direction=cross(x_direction, y_direction);
          //BCS1 - body coordinate system resolved in center of mass ball1
          //BCS2 - body coordinate system resolved in center of mass ball2

      public
          Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a1
          " center of ball1 mass(BCS1)"
            annotation (Placement(transformation(extent={{-118,44},{-86,76}})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a2
          "center of ball2 mass (BCS2)"
            annotation (Placement(transformation(extent={{-118,-76},{-86,-44}})));
          Modelica.Blocks.Interfaces.RealInput vector_ball1[12] "radius ball"
                                                               annotation (
              Placement(transformation(
                extent={{-8,-8},{8,8}},
                rotation=0,
                origin={-108,10})));
          Modelica.Blocks.Interfaces.RealInput vector_ball2[12] "radius ball"
                                                               annotation (
              Placement(transformation(
                extent={{-8,-8},{8,8}},
                rotation=0,
                origin={-108,-30})));
          Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP_ball1_ball2(
              resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "relative position center of ball1 resolved in BCS2"
            annotation (Placement(transformation(
                extent={{-6,-6},{6,6}},
                rotation=90,
                origin={-60,0})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b1
          "contact point ball1 (BCS3)"
            annotation (Placement(transformation(extent={{86,44},{118,76}})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b2
          "contact point ball2 (BCS4)"
            annotation (Placement(transformation(extent={{86,-76},{118,-44}})));
          Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP_ball2_ball1(
              resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "relative position center of ball2 resolved in BCS1"
            annotation (Placement(transformation(
                extent={{-6,-6},{6,6}},
                rotation=270,
                origin={-14,0})));
      protected
          Modelica.Mechanics.MultiBody.Parts.PointMass contact_point_ball1(
            m=0,
            animation=Animation,
            sphereColor=colorContactPoint_Ball1,
            sphereDiameter=2*radiusContactPoint)
            annotation (Placement(transformation(extent={{94,74},{110,90}})));
          Modelica.Mechanics.MultiBody.Parts.PointMass contact_point_ball2(
            m=0,
            animation=Animation,
            sphereColor=colorContactPoint_Ball2,
            sphereDiameter=2*radiusContactPoint)
            annotation (Placement(transformation(extent={{94,-46},{110,-30}})));
      public
          Modelica.Blocks.Interfaces.RealOutput pos_rel1[3]
          "Relative position center of ball1 resolved in BCS2"
                                                       annotation (Placement(
                transformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={-54,-110})));
          Modelica.Mechanics.MultiBody.Sensors.AbsoluteAngularVelocity aAV(
              resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameA.frame_resolve)
          "absolut angular velocity contact point ball1 resolved in BCS1"
            annotation (Placement(transformation(extent={{-6,-6},{6,6}},
                rotation=270,
                origin={20,0})));
          Modelica.Blocks.Interfaces.RealOutput w1[3]
          "absolut angular velocity contact point ball1 resolved in BCS1"
            annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={20,-110})));
      protected
         Real r1 "radius ball1";
         Real r2 "radius ball2";

      public
          IdealizedContact.Components.Utilities.variablePrism1 variablePrism1
          "from center of mass to contact point ball1"
            annotation (Placement(transformation(extent={{40,50},{60,70}})));
          IdealizedContact.Components.Utilities.variablePrism1 variablePrism2
          "from center of mass to contact point ball2"
            annotation (Placement(transformation(extent={{40,-70},{60,-50}})));
          Modelica.Blocks.Routing.DeMultiplex4 deMultiplex1(
            n1=3,
            n2=3,
            n3=3,
            n4=3) annotation (Placement(transformation(extent={{-92,4},{-80,16}})));
          Modelica.Blocks.Routing.DeMultiplex4 deMultiplex3(
            n1=3,
            n2=3,
            n3=3,
            n4=3) annotation (Placement(transformation(extent={{-92,-36},{-80,-24}})));
          Modelica.Mechanics.MultiBody.Sensors.AbsoluteAngularVelocity aAV1(
              resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameA.frame_resolve)
          "absolut angular velocity contact point ball2 resolved in BCS2"
            annotation (Placement(transformation(extent={{-6,-6},{6,6}},
                rotation=270,
                origin={74,-80})));
          Modelica.Blocks.Interfaces.RealOutput w2[3]
          "absolut angular velocity contact point ball2 resolved in BCS2"
            annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={74,-110})));
          Modelica.Blocks.Interfaces.RealOutput pos_rel2[3]
          "Relative position center of ball2 resolved in BCS1"   annotation (
              Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={-20,-110})));
        equation
          r1=deMultiplex1.y4[1];
          r2=deMultiplex3.y4[1];

        //----------ccontact point ball1--------------------------------
          variablePrism1.s_ref=r1;
          //t1=Modelica.Math.Vectors.normalize(rP_ball2_ball1.r_rel);
          //variablePrism1.n=t1;
          variablePrism1.n=rP_ball2_ball1.r_rel
          "vector relative position ball2 resolved in BCS1";
        //--------------------------------------------------------------

        //----------contact point ball2---------------------------------
          variablePrism2.s_ref=r2;
          //t2=Modelica.Math.Vectors.normalize(rP_ball1_ball2.r_rel);
          //variablePrism2.n=t2;
          variablePrism2.n=rP_ball1_ball2.r_rel
          "vector relative position ball1 resolved in BCS2";
        //--------------------------------------------------------------

          connect(rP_ball1_ball2.frame_b, frame_a1) annotation (Line(
              points={{-60,6},{-60,60},{-102,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_ball1_ball2.frame_a, frame_a2) annotation (Line(
              points={{-60,-6},{-60,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_ball2_ball1.frame_a, frame_a1) annotation (Line(
              points={{-14,6},{-14,60},{-102,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_ball2_ball1.frame_b, frame_a2) annotation (Line(
              points={{-14,-6},{-14,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(contact_point_ball1.frame_a, frame_b1)
                                                     annotation (Line(
              points={{102,82},{102,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(contact_point_ball2.frame_a, frame_b2)
                                                      annotation (Line(
              points={{102,-38},{102,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_ball1_ball2.r_rel, pos_rel1) annotation (Line(
              points={{-53.4,-4.04133e-016},{-54,-4.04133e-016},{-54,-110}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(aAV.w, w1)
                            annotation (Line(
              points={{20,-6.6},{20,-110}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(variablePrism1.frame_b, frame_b1) annotation (Line(
              points={{60,60},{102,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variablePrism1.frame_a, frame_a1) annotation (Line(
              points={{40,60},{-102,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variablePrism2.frame_b, frame_b2) annotation (Line(
              points={{60,-60},{102,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variablePrism2.frame_a, frame_a2) annotation (Line(
              points={{40,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(vector_ball1, deMultiplex1.u) annotation (Line(
              points={{-108,10},{-93.2,10}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(deMultiplex3.u, vector_ball2) annotation (Line(
              points={{-93.2,-30},{-108,-30}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(aAV1.frame_a, variablePrism2.frame_b) annotation (Line(
              points={{74,-74},{74,-60},{60,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(aAV1.frame_resolve, frame_a2) annotation (Line(
              points={{67.94,-80},{-80,-80},{-80,-60},{-102,-60}},
              color={95,95,95},
              pattern=LinePattern.Dot,
              smooth=Smooth.None));
          connect(aAV1.w, w2) annotation (Line(
              points={{74,-86.6},{74,-110}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(rP_ball2_ball1.r_rel, pos_rel2) annotation (Line(
              points={{-20.6,1.2124e-015},{-20.6,-53},{-20,-53},{-20,-110}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(aAV.frame_a, variablePrism1.frame_b) annotation (Line(
              points={{20,6},{60,6},{60,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(aAV.frame_resolve, frame_a1) annotation (Line(
              points={{13.94,1.1132e-015},{13.94,60},{-102,60}},
              color={95,95,95},
              pattern=LinePattern.Dot,
              smooth=Smooth.None));
          annotation (Diagram(graphics));
        end MovePointSphereToSphere;

        model ForceSphereToSphere

          import SI = Modelica.SIunits;

          parameter SI.TranslationalSpringConstant c=1000000;
          parameter SI.TranslationalDampingConstant d=1000;
          parameter Real n1 = 1.5;
          parameter Real n2 = n1;
          parameter SI.CoefficientOfFriction mue_r=0.0001
          "rolling friction coefficient";
          parameter Real gamma1=1;
          parameter Real gamma2=1;
          parameter Real gamma3=1;
          parameter Real gamma4=1;
          parameter Real gamma5=1;
          parameter Real gamma6=1;
          parameter SI.Distance t_max=0.0001 "maximum penetration";

          final parameter Modelica.Mechanics.MultiBody.Types.Axis y_direction={0,1,0}
          "cartesian coordinate system in y direction -- direction of gravity";
          final parameter Modelica.Mechanics.MultiBody.Types.Axis x_direction={1,0,0}
          "cartesian coordinate system in x direction";
          final parameter Modelica.Mechanics.MultiBody.Types.Axis z_direction=cross(x_direction, y_direction);
          //BCS1 - body coordinate system resolved in center of mass ball1
          //BCS2 - body coordinate system resolved in center of mass ball2
          //BCS3 - body coordinate system resolved in contact point ball1 with the same orientation as BCS1
          //BCS4 - body coordinate system resolved in contact point ball2 with the same orientation as BCS2

      public
          Modelica.Blocks.Interfaces.RealInput Vector_ball1[12] "radius ball"
                                                               annotation (
              Placement(transformation(
                extent={{-8,-8},{8,8}},
                rotation=0,
                origin={-108,-40})));
          Modelica.Blocks.Interfaces.RealInput vector_ball2[12] "radius ball"
                                                               annotation (
              Placement(transformation(
                extent={{-8,-8},{8,8}},
                rotation=0,
                origin={-108,-80})));
      public
          Modelica.Mechanics.MultiBody.Forces.Force force(resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a,
              animation=false) "Force resolved in BCS4 in contact point2"
            annotation (Placement(transformation(
                extent={{-6,-6},{6,6}},
                rotation=0,
                origin={-10,80})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a2
          "contact point2 on ball2 (BCS4 based on BCS2)"
            annotation (Placement(transformation(
                extent={{-14,-14},{14,14}},
                rotation=90,
                origin={-40,100})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a1
          "contact point1 on ball1 (BCS3 based on BCS1)"
            annotation (Placement(transformation(
                extent={{-14,-14},{14,14}},
                rotation=90,
                origin={20,100})));
          Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP_mp_1_2(
              resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "relative position contact point ball1 resolved in BCS contact point ball2"
            annotation (Placement(transformation(
                extent={{-6,-6},{6,6}},
                rotation=0,
                origin={-10,60})));
          Modelica.Blocks.Interfaces.RealInput pos_rel_BCS2[3]
          "relative position center of ball1 resolved in BCS2"
            annotation (Placement(transformation(extent={{-116,-18},{-100,-2}})));
          Modelica.Blocks.Interfaces.RealInput w_mov1[3]
          "absolut angular velocity contact point ball1 resolved in BCS1"
            annotation (Placement(transformation(extent={{-116,46},{-100,62}})));
          Real r1 "radius ball1";
          Real r2 "radius ball2";
          Real r12 "distance between center of two balls";

          Real x_rel
          "relative position contact point ball1 in x direction BCS4";
          Real y_rel
          "relative position contact point ball1 in y direction BCS4";
          Real z_rel
          "relative position contact point ball1 in z direction BCS4";

          Modelica.Blocks.Interfaces.BooleanOutput contact
            annotation (Placement(transformation(extent={{96,-12},{116,8}})));

          Real f_n_x "normal force in x direction BCS4";
          Real f_n_y "normal force in y direction BCS4";
          Real f_n_z "normal force in z direction BCS4";
          Real f_f_x "friction in x direction BCS4";
          Real f_f_y "friction in y direction BCS4";
          Real f_f_z "friction in z direction BCS4";

          Real f_normal[3] "normal force resolved in BCS4";
          Real f_tangential[3] "friction resolved in BCS4";

          Real r_ct1_BCS1[3] "position contact point1 resolved in BCS1";
          Real r_ct2_BCS2[3] "position contact point2 resolved in BCS2";
          Real v_cm1_BCS2[3]
          "velocity center of mass ball1 resolved in BCS2 (velocity center of mass ball2 resolved in BCS2 is zero)";
          Real v_ct1_BCS2[3] "velocity contact point1 resolved in BCS2";
          Real v_ct2_BCS2[3] "velocity contact point2 resolved in BCS2";
          Real T_BCS12[3,3]
          "Transmation matrix from orientation objekt to rotate BCS1 into BCS2";
          Real v_rel_ct_BCS2[3]
          "relative velocity contact points resolved in BCS2";

          Modelica.Blocks.Routing.DeMultiplex4 deMultiplex1(
            n1=3,
            n2=3,
            n3=3,
            n4=3) annotation (Placement(transformation(extent={{-92,-46},{-80,-34}})));
          Modelica.Blocks.Routing.DeMultiplex4 deMultiplex3(
            n1=3,
            n2=3,
            n3=3,
            n4=3) annotation (Placement(transformation(extent={{-92,-86},{-80,-74}})));
          Modelica.Blocks.Interfaces.RealInput w_mov2[3]
          "absolut anglular velocity contact point ball2 resolved in BCS2"
            annotation (Placement(transformation(extent={{-116,84},{-100,100}})));
          Modelica.Blocks.Interfaces.RealInput pos_rel_BCS1[3]
          "relative position center of ball2 resolved in BCS1"
            annotation (Placement(transformation(extent={{-116,12},{-100,28}})));
        equation
          r1=deMultiplex1.y4[1];
          r2=deMultiplex3.y4[1];
          r12=Modelica.Math.Vectors.norm(pos_rel_BCS2);

          r_ct1_BCS1 = r1*Modelica.Math.Vectors.normalize(pos_rel_BCS1);
          r_ct2_BCS2 = r2*Modelica.Math.Vectors.normalize(pos_rel_BCS2);
          v_cm1_BCS2 = der(pos_rel_BCS2);
          T_BCS12 = Modelica.Mechanics.MultiBody.Frames.to_T(Modelica.Mechanics.MultiBody.Frames.relativeRotation(frame_a1.R, frame_a2.R));

        //----------relative position contact point1 ball1 resolved in BCS2----------
          x_rel= rP_mp_1_2.r_rel[1];
          y_rel= rP_mp_1_2.r_rel[2];
          z_rel= rP_mp_1_2.r_rel[3];
        //--------------------------------------------------------------------------

        //----------contact specification-------------------------------------------
          contact= (r12<=r1+r2 and r12>r1+r2-t_max);
        //--------------------------------------------------------------------------

        //----------relative velocity resolved in BCS2(center of mass ball2)--------
              v_ct1_BCS2 = v_cm1_BCS2 + T_BCS12*cross(w_mov1,r_ct1_BCS1);
              v_ct2_BCS2 = cross(w_mov2,r_ct2_BCS2);
              v_rel_ct_BCS2 = v_ct2_BCS2 - v_ct1_BCS2;
        //--------------------------------------------------------------------------

        //----------force resolved in BCS2--------------------------------------------------------
          if (contact) then
             f_n_x = sign(x_rel)*(c*abs(x_rel)^(n1))+ d*abs(x_rel)^(n2)*der(x_rel);
             f_n_y = sign(y_rel)*(c*abs(y_rel)^(n1))+ d*abs(y_rel)^(n2)*der(y_rel);
             f_n_z = sign(z_rel)*(c*abs(z_rel)^(n1))+ d*abs(z_rel)^(n2)*der(z_rel);
             f_normal = -f_n_x*x_direction - f_n_y*y_direction - f_n_z*z_direction;

             //mue=gamma1*(tanh(gamma2*v_rel)-tanh(gamma3*v_rel))+gamma_4*tanh(gamma5*v_rel)+gamma6*v_rel
        //      f_f_x = (gamma1*(tanh(gamma2*v_rel[1])-tanh(gamma3*v_rel[1]))+gamma4*tanh(gamma5*v_rel[1])+gamma6*v_rel[1])*(f_n_y+f_n_z);
        //      f_f_y = (gamma1*(tanh(gamma2*v_rel[2])-tanh(gamma3*v_rel[2]))+gamma4*tanh(gamma5*v_rel[2])+gamma6*v_rel[2])*(f_n_x+f_n_z);
        //      f_f_z = (gamma1*(tanh(gamma2*v_rel[3])-tanh(gamma3*v_rel[3]))+gamma4*tanh(gamma5*v_rel[3])+gamma6*v_rel[3])*(f_n_y+f_n_x);
             f_f_x = (gamma1*(tanh(gamma2*v_rel_ct_BCS2[1])-tanh(gamma3*v_rel_ct_BCS2[1]))+gamma4*tanh(gamma5*v_rel_ct_BCS2[1])+gamma6*v_rel_ct_BCS2[1])*(abs(f_n_y)+abs(f_n_z));
             f_f_y = (gamma1*(tanh(gamma2*v_rel_ct_BCS2[2])-tanh(gamma3*v_rel_ct_BCS2[2]))+gamma4*tanh(gamma5*v_rel_ct_BCS2[2])+gamma6*v_rel_ct_BCS2[2])*(abs(f_n_x)+abs(f_n_z));
             f_f_z = (gamma1*(tanh(gamma2*v_rel_ct_BCS2[3])-tanh(gamma3*v_rel_ct_BCS2[3]))+gamma4*tanh(gamma5*v_rel_ct_BCS2[3])+gamma6*v_rel_ct_BCS2[3])*(abs(f_n_y)+abs(f_n_x));

             f_tangential = f_f_x*x_direction + f_f_y*y_direction + f_f_z*z_direction;
          else
             f_n_x = 0;
             f_n_y = 0;
             f_n_z = 0;
             f_normal=zeros(3);

             f_f_x = 0;
             f_f_y = 0;
             f_f_z = 0;
             f_tangential=zeros(3);
          end if;

           force.force=f_normal+f_tangential;
        //--------------------------------------------------------------------------------------
          connect(force.frame_a,frame_a2)  annotation (Line(
              points={{-16,80},{-40,80},{-40,100}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(frame_a1,force. frame_b) annotation (Line(
              points={{20,100},{20,80},{-4,80}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_mp_1_2.frame_a, frame_a2) annotation (Line(
              points={{-16,60},{-40,60},{-40,100}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_mp_1_2.frame_b, frame_a1) annotation (Line(
              points={{-4,60},{20,60},{20,100}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(deMultiplex1.u, Vector_ball1) annotation (Line(
              points={{-93.2,-40},{-108,-40}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(deMultiplex3.u, vector_ball2) annotation (Line(
              points={{-93.2,-80},{-108,-80}},
              color={0,0,127},
              smooth=Smooth.None));
          annotation (Diagram(graphics));
        end ForceSphereToSphere;

        model MovePointSphereToCylinder
          parameter Real f=100000;
          parameter Boolean Animation=true;
          parameter Modelica.SIunits.Radius radiusContactPoint=0.005;
          parameter Modelica.Mechanics.MultiBody.Types.Color
            colorContactPoints1 =                                                {0,180,0};
          parameter Modelica.Mechanics.MultiBody.Types.Color
            Color_contact_point_cylinder =                                                {255,0,255};

          final parameter Modelica.Mechanics.MultiBody.Types.Axis y_direction={0,1,0}
          "cartesian coordinate system in y direction -- default gravity direction";
          final parameter Modelica.Mechanics.MultiBody.Types.Axis x_direction={1,0,0}
          "cartesian coordinate system in x direction";
          final parameter Modelica.Mechanics.MultiBody.Types.Axis z_direction=cross(x_direction, y_direction);
          //BCS1 - body coordinate system resolved in center of ball mass
          //BCS2 - body coordinate system resolved in center of cylinder mass
          //BCS3 - body coordinate system resolved in contact point ball
          //BCS4 - body coordinate system resolved in contact point cylinder

          Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a1
          "center of cylinder mass BCS2"
            annotation (Placement(transformation(extent={{-118,-76},{-86,-44}})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a2
          "center of ball mass BCS1"
            annotation (Placement(transformation(extent={{-116,46},{-88,74}})));
          Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP_b_cy(resolveInFrame=
                Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "relative position center of ball resolved in BCS2"
            annotation (Placement(transformation(
                extent={{-6,-6},{6,6}},
                rotation=90,
                origin={-66,0})));
          Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP_b_cyA(resolveInFrame=
               Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "relative position center of ball resolved in BCSA"
            annotation (Placement(transformation(
                extent={{-6,-6},{6,6}},
                rotation=90,
                origin={0,0})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b1
          "contact point on cylinder surface BCS4 based on BCS2"
            annotation (Placement(transformation(extent={{86,-76},{118,-44}})));
          Modelica.Blocks.Interfaces.RealInput Vector_ball[12] "radius ball"
                                                               annotation (
              Placement(transformation(
                extent={{-8,-8},{8,8}},
                rotation=0,
                origin={-108,20})));
          Modelica.Blocks.Interfaces.RealInput vector_cy[12]
          "length/width direction and R L"                     annotation (
              Placement(transformation(
                extent={{-8,-8},{8,8}},
                rotation=0,
                origin={-108,-20})));
          Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP_cy_b(resolveInFrame=
                Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "relative position center of cylinder mass resolved in BCS1"
            annotation (Placement(transformation(
                extent={{-6,-6},{6,6}},
                rotation=270,
                origin={40,0})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b2
          "contact point on ball surface BCS3 based on BCS1"
            annotation (Placement(transformation(extent={{86,44},{118,76}})));
          Modelica.Blocks.Interfaces.RealOutput pos_b_BCSA[3]
          "relative position center of ball mass resolved in BCSA"
            annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={0,-110})));
          Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP_mpb_mpcy(
              resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "relative position contact point ball resolved in BCS4 contact point on cylinder Surface"
            annotation (Placement(transformation(
                extent={{-6,-6},{6,6}},
                rotation=90,
                origin={80,0})));
          Modelica.Blocks.Interfaces.RealOutput pos_ctb_BCS4[3]
          "relative position contact point ball resolved in BCS4 contact point on cylinder Surface"
            annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={40,-110})));
          Modelica.Mechanics.MultiBody.Sensors.AbsoluteAngularVelocity aAV1(
              resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameA.frame_resolve)
          "absolut anglular velocity contact point ball resolved in BCS1"
            annotation (Placement(transformation(extent={{-6,-6},{6,6}},
                rotation=270,
                origin={-24,0})));
          Modelica.Blocks.Interfaces.RealOutput w_mov1[3]
          "absolut anglular velocity contact point ball resolved in BCS1"
            annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={-40,-110})));

      protected
          Modelica.Mechanics.MultiBody.Parts.PointMass contact_point_ball(
            m=0,
            animation=Animation,
            sphereColor=colorContactPoints1,
            sphereDiameter=2*radiusContactPoint)
            annotation (Placement(transformation(extent={{94,18},{110,34}})));
      protected
          Modelica.Mechanics.MultiBody.Parts.PointMass contact_point_cylinder(
            m=0,
            animation=Animation,
            sphereColor=Color_contact_point_cylinder,
            sphereDiameter=2*radiusContactPoint)
            annotation (Placement(transformation(extent={{94,-40},{110,-24}})));
      protected
          Real R "radius ball";
          Real Length_Direction_cy[3]
          "length direction cylinder default (1,0,0)";
          Real Dw_Direction_cy[3] "width direction cylinder default (0,0,1)";
          Real Dh_Direction_cy[3] "height direction cylinder default (0,1,0)";
          Real R_l[3] "radius and half-length cylinder";
          Real L_offset;

      public
         IdealizedContact.Components.Utilities.variablePrism1 variablePrism_ball1
          "off set from center of mass ball to contact point on ball surface"
            annotation (Placement(transformation(extent={{46,50},{66,70}})));
          IdealizedContact.Components.Utilities.variablePrism1 variablePrism_cy1
          "offset1 from cylinder center point to point A (BCSA - projection of ball center in length direction cylinder resolved in BCS2)"
            annotation (Placement(transformation(extent={{-56,-70},{-36,-50}})));
          IdealizedContact.Components.Utilities.variablePrism1 variablePrism_cy2
          "offset2 from point A to cylinder contact point resolved in BCS pointA based on BCS2(along Dh- and Dw-Direction resolved in BCS pointA)"
            annotation (Placement(transformation(extent={{10,-70},{30,-50}})));
          Modelica.Blocks.Routing.DeMultiplex4 deMultiplex1(
            n1=3,
            n2=3,
            n3=3,
            n4=3) annotation (Placement(transformation(extent={{-96,14},{-84,26}})));
          Modelica.Blocks.Routing.DeMultiplex4 deMultiplex2(
            n1=3,
            n2=3,
            n3=3,
            n4=3) annotation (Placement(transformation(extent={{-96,-26},{-84,
                    -14}})));
          Modelica.Blocks.Interfaces.RealOutput w_mov2[3]
          "anglular velocitycontact point on cylinder surface resolved in BCSA"
            annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={-80,-110})));
          Modelica.Mechanics.MultiBody.Sensors.AbsoluteAngularVelocity aAV2(
              resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameA.frame_resolve)
          "anglular velocity contact point on cylinder surface resolved in BCSA"
            annotation (Placement(transformation(extent={{-6,-6},{6,6}},
                rotation=270,
                origin={40,-80})));
          Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP_ct_BCS1(
              resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "relative position contact point on ball surface resolved in BCS1"
            annotation (Placement(transformation(
                extent={{-6,-6},{6,6}},
                rotation=0,
                origin={-54,80})));
          Modelica.Blocks.Interfaces.RealOutput pos_ctb_BCS1[3]
          "relative position contact point on ball surface resolved in BCS1"
            annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={80,-110})));
        equation
          R=deMultiplex1.y4[1];
          R_l=deMultiplex2.y4;
          Length_Direction_cy=deMultiplex2.y1;
          Dw_Direction_cy=deMultiplex2.y2;
          Dh_Direction_cy=deMultiplex2.y3;
          L_offset=smooth(2, if abs(rP_b_cy.r_rel*Length_Direction_cy)>R_l[2] then R_l[2]*sign(rP_b_cy.r_rel*Length_Direction_cy) else rP_b_cy.r_rel*Length_Direction_cy);

        //----------offset1 from cylinder center point to point A (projection of ball center in length direction cylinder resolved in BCS2)-------------
          //variablePrism_cy1.s_ref=rP_b_cy.r_rel*Length_Direction_cy;
          variablePrism_cy1.s_ref=L_offset;
          variablePrism_cy1.n=Length_Direction_cy;
        //----------------------------------------------------------------------------------------------------------------------------------------------

        //----------offset2 from point A to cylinder contact point (along Dh- and Dw-Direction resolved in BCS point A)----------
          variablePrism_cy2.s_ref=R_l[1];
          variablePrism_cy2.n=rP_b_cyA.r_rel*abs(Dw_Direction_cy)*abs(Dw_Direction_cy) + rP_b_cyA.r_rel*abs(Dh_Direction_cy)*abs(Dh_Direction_cy);
        //-----------------------------------------------------------------------------------------------------------------------

        //----------offset from center of ball mass to ball contact point----------
          variablePrism_ball1.s_ref=R;
          variablePrism_ball1.n=rP_cy_b.r_rel;
        //-------------------------------------------------------------------------

        //----------other connection----------
          w_mov1 = aAV1.w
          "absolut anglular velocity center of ball mass resolved in BCSA";
          w_mov2 = aAV2.w
          "anglular velocitycontact point on cylinder surface resolved in BCSA";
          pos_b_BCSA = rP_b_cyA.r_rel
          "relative position center of ball resolved in BCSA";
          pos_ctb_BCS4 = rP_mpb_mpcy.r_rel
          "relative position contact point ball resolved in BCS4 contact point on cylinder Surface";
          pos_ctb_BCS1 = rP_ct_BCS1.r_rel
          "relative position contact point on ball surface resolved in BCS1";
        //------------------------------------
          connect(rP_b_cy.frame_b, frame_a2) annotation (Line(
              points={{-66,6},{-66,60},{-102,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(frame_a1, rP_b_cy.frame_a) annotation (Line(
              points={{-102,-60},{-66,-60},{-66,-6}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(frame_a2,rP_b_cyA. frame_b) annotation (Line(
              points={{-102,60},{3.67394e-016,60},{3.67394e-016,6}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(contact_point_ball.frame_a, frame_b2)
                                                     annotation (Line(
              points={{102,26},{102,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(contact_point_cylinder.frame_a, frame_b1)
                                                         annotation (Line(
              points={{102,-32},{102,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_cy_b.frame_a, frame_a2) annotation (Line(
              points={{40,6},{40,60},{-102,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variablePrism_ball1.frame_b, frame_b2) annotation (Line(
              points={{66,60},{102,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variablePrism_ball1.frame_a, frame_a2) annotation (Line(
              points={{46,60},{-102,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variablePrism_ball1.frame_b, rP_mpb_mpcy.frame_b) annotation (
              Line(
              points={{66,60},{80,60},{80,6}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variablePrism_cy1.frame_a, frame_a1) annotation (Line(
              points={{-56,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variablePrism_cy1.frame_b,rP_b_cyA. frame_a) annotation (Line(
              points={{-36,-60},{-3.67394e-016,-60},{-3.67394e-016,-6}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variablePrism_cy2.frame_b, frame_b1) annotation (Line(
              points={{30,-60},{102,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variablePrism_cy2.frame_a, variablePrism_cy1.frame_b)
            annotation (Line(
              points={{10,-60},{-36,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_mpb_mpcy.frame_a, variablePrism_cy2.frame_b) annotation (
              Line(
              points={{80,-6},{80,-60},{30,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(deMultiplex1.u, Vector_ball) annotation (Line(
              points={{-97.2,20},{-108,20}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(deMultiplex2.u, vector_cy) annotation (Line(
              points={{-97.2,-20},{-108,-20}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(rP_cy_b.frame_b, variablePrism_cy2.frame_b) annotation (Line(
              points={{40,-6},{40,-60},{30,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(aAV2.frame_a, variablePrism_cy2.frame_b) annotation (Line(
              points={{40,-74},{40,-60},{30,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_ct_BCS1.frame_a, frame_a2) annotation (Line(
              points={{-60,80},{-80,80},{-80,60},{-102,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_ct_BCS1.frame_b, variablePrism_ball1.frame_b) annotation (Line(
              points={{-48,80},{80,80},{80,60},{66,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(aAV2.frame_resolve, variablePrism_cy1.frame_b) annotation (Line(
              points={{33.94,-80},{-30,-80},{-30,-60},{-36,-60}},
              color={95,95,95},
              pattern=LinePattern.Dot,
              smooth=Smooth.None));
          connect(aAV1.frame_a, variablePrism_ball1.frame_b) annotation (Line(
              points={{-24,6},{-24,30},{66,30},{66,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(aAV1.frame_resolve, frame_a2) annotation (Line(
              points={{-30.06,1.1132e-015},{-38.03,1.1132e-015},{-38.03,60},{
                  -102,60}},
              color={95,95,95},
              pattern=LinePattern.Dot,
              smooth=Smooth.None));
          annotation (Diagram(graphics));
        end MovePointSphereToCylinder;

        model ForceSphereToCylinder
          import SI = Modelica.SIunits;
          parameter SI.TranslationalSpringConstant c=1000000;
          parameter SI.TranslationalDampingConstant d=1000;
          parameter Real n1 = 1.5;
          parameter Real n2 = n1;
          parameter SI.CoefficientOfFriction mue_r=0.0001 "rolling friction";
          parameter Real gamma1;
          parameter Real gamma2;
          parameter Real gamma3;
          parameter Real gamma4;
          parameter Real gamma5;
          parameter Real gamma6;
          parameter SI.Distance t_max=0.0001 "Maximale Eindringtiefe";

          //BCS1 - body coordinate system resolved in center of ball mass
          //BCS2 - body coordinate system resolved in center of cylinder mass
          //BCS3 - body coordinate system resolved in contact point ball with the same orientation as BCS1
          //BCS4 - body coordinate system resolved in contact point cylinder with the same orientation as BCS2
          //BCSA - projection of ball center in length direction cylinder resolved in BCS2 with the same orientation as BCS2

          Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a1
          "contact point on cylinder surface BCS4"
            annotation (Placement(transformation(extent={{-16,-16},{16,16}},
                rotation=90,
                origin={-40,102})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a2
          "contact point on ball surface BCS3"
            annotation (Placement(transformation(extent={{-16,-16},{16,16}},
                rotation=90,
                origin={40,102})));
      public
          Modelica.Mechanics.MultiBody.Forces.Force force(resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a,
              animation=false) "Force resolved in BCS4 based on BCS2"
            annotation (Placement(transformation(
                extent={{-6,-6},{6,6}},
                rotation=0,
                origin={0,80})));
          Modelica.Blocks.Interfaces.RealInput pos_ctb_BCS4[3]
          "relative position contact point ball resolved in BCS4 contact point on cylinder Surface"
                                                               annotation (
              Placement(transformation(
                extent={{-8,-8},{8,8}},
                rotation=0,
                origin={-108,70})));
          Modelica.Blocks.Interfaces.RealInput pos_b_BCSA[3]
          "relative position center of ball mass resolved in BCSA"
                                                               annotation (
              Placement(transformation(
                extent={{-8,-8},{8,8}},
                rotation=0,
                origin={-108,36})));
          Modelica.Blocks.Interfaces.RealInput Vector_ball[12] "radius ball"
                                                               annotation (
              Placement(transformation(
                extent={{-8,-8},{8,8}},
                rotation=0,
                origin={-108,-60})));
          Modelica.Blocks.Interfaces.RealInput vector_cy[12]
          "length/width direction and R L"                     annotation (
              Placement(transformation(
                extent={{-8,-8},{8,8}},
                rotation=0,
                origin={-108,-100})));
          Modelica.Blocks.Interfaces.RealInput w_mov1[3]
          "absolut anglular velocity contact point ball resolved in BCS1"
                                                               annotation (
              Placement(transformation(
                extent={{-8,-8},{8,8}},
                rotation=0,
                origin={-108,0})));
          Real R "radius ball";

          Real Length_Direction_cy[3]
          "length direction cylinder default (1,0,0)";
          Real Dw_Direction_cy[3] "width direction cylinder default (0,0,1)";
          Real Dh_Direction_cy[3] "height direction cylinder default (0,1,0)";
          Real R_l[3] "radius and half-length cylinder";

          Real w_b_rel
          "relative position center of ball mass in width direction BCS2";
          Real h_b_rel
          "relative position center of ball mass in height direction BCS2";
          Real pos_b_wh;

          Real l_mb_rel
          "relative position contact point ball in length direction BCS4";
          Real w_mb_rel
          "relative position contact point ball in width direction BCS4";
          Real h_mb_rel
          "relative position contact point ball in height direction BCS4";

          Real penetration "penetration";

            Modelica.Blocks.Interfaces.BooleanOutput contact
            annotation (Placement(transformation(extent={{96,-12},{116,8}})));

          Real f_fh "friction in h direction BCS2";
          Real f_fw "friction in w direction BCS2";
          Real f_fl "friction in l direction BCS2";
          Real f_nh "normal force in h direction BCS2";
          Real f_nw "normal force in w direction BCS2";
          Real f_n "normal force in h-w direction";

          Real f_normal[3] "normal force resolved in BCS2";
          Real f_tangential[3] "friction resolved in BCS2";

          Real r_ctb_BCS1[3] "position contact point ball resolved in BCS1";
          Real r_ctc_BCSA[3] "position contact point cylinder resolved in BCSA";
          Real v_cmb_BCSA[3]
          "velocity center of mass ball resolved in BCSA (velocity center of BCSA resolved in BCSA is zero)";
          Real v_ctb_BCSA[3] "velocity contact ball resolved in BCSA";
          Real v_ctc_BCSA[3] "velocity contact cylinder resolved in BCSA";
          Real T_BCS1A[3,3]
          "Transmation matrix from orientation objekt to rotate BCS1 into BCSA(BCS2)";
          Real v_rel_ct_BCSA[3]
          "relative velocity contact points resolved in BCSA";

          Modelica.Blocks.Routing.DeMultiplex4 deMultiplex1(
            n1=3,
            n2=3,
            n3=3,
            n4=3) annotation (Placement(transformation(extent={{-92,-66},{-80,-54}})));
          Modelica.Blocks.Routing.DeMultiplex4 deMultiplex2(
            n1=3,
            n2=3,
            n3=3,
            n4=3) annotation (Placement(transformation(extent={{-92,-106},{-80,-94}})));
          Modelica.Blocks.Interfaces.RealInput w_mov2[3]
          "anglular velocitycontact point on cylinder surface resolved in BCSA"
                                                               annotation (
              Placement(transformation(
                extent={{-8,-8},{8,8}},
                rotation=0,
                origin={-108,-30})));
          Modelica.Blocks.Interfaces.RealInput pos_ctb_BCS1[3]
          "relative position contact point on ball surface resolved in BCS1"
                                                               annotation (
              Placement(transformation(
                extent={{-8,-8},{8,8}},
                rotation=0,
                origin={-108,100})));
        equation
           R=deMultiplex1.y4[1];
           R_l=deMultiplex2.y4;
           Length_Direction_cy=deMultiplex2.y1;
           Dw_Direction_cy=deMultiplex2.y2;
           Dh_Direction_cy=deMultiplex2.y3;

           r_ctb_BCS1 = pos_ctb_BCS1;
           r_ctc_BCSA = R_l[1]*Modelica.Math.Vectors.normalize(pos_b_BCSA);
           v_cmb_BCSA = der(pos_b_BCSA);
           T_BCS1A = Modelica.Mechanics.MultiBody.Frames.to_T(Modelica.Mechanics.MultiBody.Frames.relativeRotation(frame_a1.R, frame_a2.R));

        //    l_b_rel =  pos_b*Length_Direction_cy;
            w_b_rel =  pos_b_BCSA*Dw_Direction_cy;
            h_b_rel =  pos_b_BCSA*Dh_Direction_cy;

           l_mb_rel =  pos_ctb_BCS4*Length_Direction_cy;
           w_mb_rel =  pos_ctb_BCS4*Dw_Direction_cy;
           h_mb_rel =  pos_ctb_BCS4*Dh_Direction_cy;
           pos_b_wh = sqrt(w_b_rel^2 + h_b_rel^2)-R;

        //----------contact specification----------------------------------------------------
           //contact = abs(l_b_rel)<=R_l[2] and (pos_b_wh<=R_l[1] and pos_b_wh>=R_l[1]-t_max);
           contact = abs(l_mb_rel)<t_max and (pos_b_wh<=R_l[1] and pos_b_wh>=R_l[1]-t_max);
        //-----------------------------------------------------------------------------------

        //----------relative velocity resolved in BCSA-----------------------------------

           v_ctb_BCSA = v_cmb_BCSA + T_BCS1A*cross(w_mov1,r_ctb_BCS1);
           v_ctc_BCSA = cross(w_mov2,r_ctc_BCSA);
           v_rel_ct_BCSA = v_ctc_BCSA - v_ctb_BCSA;

        //-------------------------------------------------------------------------------

        //---------force resolved in BCS4-------------------------------------------------------------
           if (contact) then
             //f_nh = c*h_mb_rel + d*der(h_mb_rel);
             //f_nw = c*w_mb_rel + d*der(w_mb_rel);
             f_nh = sign(h_mb_rel)*(c*abs(h_mb_rel)^n1) + d*abs(h_mb_rel)^n2*der(h_mb_rel);
             f_nw = sign(w_mb_rel)*(c*abs(w_mb_rel)^n1) + d*abs(w_mb_rel)^n2*der(w_mb_rel);

             penetration = sqrt(h_mb_rel^2+w_mb_rel^2);

             f_n = sqrt(f_nh^2 + f_nw^2);
             f_normal = -f_nw*Dw_Direction_cy -f_nh*Dh_Direction_cy;

             //mue=gamma1*(tanh(gamma2*v_rel)-tanh(gamma3*v_rel))+gamma4*tanh(gamma5*v_rel)+gamma6*v_rel
             f_fw = gamma1*(tanh(gamma2*v_rel_ct_BCSA*Dw_Direction_cy)-tanh(gamma3*v_rel_ct_BCSA*Dw_Direction_cy))+gamma4*tanh(gamma5*v_rel_ct_BCSA*Dw_Direction_cy)+gamma6*v_rel_ct_BCSA*Dw_Direction_cy*abs(f_nh) + mue_r*tanh(v_rel_ct_BCSA*Dw_Direction_cy*gamma2)*abs(f_nh);
             f_fh = gamma1*(tanh(gamma2*v_rel_ct_BCSA*Dh_Direction_cy)-tanh(gamma3*v_rel_ct_BCSA*Dh_Direction_cy))+gamma4*tanh(gamma5*v_rel_ct_BCSA*Dh_Direction_cy)+gamma6*v_rel_ct_BCSA*Dh_Direction_cy*abs(f_nw) + mue_r*tanh(v_rel_ct_BCSA*Dh_Direction_cy*gamma2)*abs(f_nw);
             f_fl = 0;

             f_tangential = -f_fw*Dw_Direction_cy -f_fh*Dh_Direction_cy -f_fl*Length_Direction_cy;
           else
             f_nh=0;
             f_nw=0;
             f_n=0;
             f_normal=zeros(3);
             penetration = 0;

             f_fw=0;
             f_fh=0;
             f_fl=0;
             f_tangential=zeros(3);
           end if;
           force.force=f_normal+f_tangential;
        //--------------------------------------------------------------------------------------------
          connect(force.frame_a, frame_a1) annotation (Line(
              points={{-6,80},{-40,80},{-40,102}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(force.frame_b, frame_a2) annotation (Line(
              points={{6,80},{40,80},{40,102}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(Vector_ball, deMultiplex1.u) annotation (Line(
              points={{-108,-60},{-93.2,-60}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(vector_cy, deMultiplex2.u) annotation (Line(
              points={{-108,-100},{-93.2,-100}},
              color={0,0,127},
              smooth=Smooth.None));
          annotation (Diagram(graphics));
        end ForceSphereToCylinder;

        model MovePointSphereToRectangle
          parameter Modelica.SIunits.Frequency f=100000;
          parameter Boolean Animation=true;
          parameter Modelica.SIunits.Radius radiusContactPoint=0.005;
          parameter Modelica.Mechanics.MultiBody.Types.Color
            colorContactPoints1 =                                                {0,180,0};
          parameter Modelica.Mechanics.MultiBody.Types.Color
            Color_contact_point_rectangle =                                                {255,0,255};

          final parameter Modelica.Mechanics.MultiBody.Types.Axis y_direction={0,1,0}
          "cartesian coordinate system in y direction -- default gravity direction";
          final parameter Modelica.Mechanics.MultiBody.Types.Axis x_direction={1,0,0}
          "cartesian coordinate system in x direction";
          final parameter Modelica.Mechanics.MultiBody.Types.Axis z_direction=cross(x_direction, y_direction);

          //BCS1 - body coordinate system resolved in center of ball mass
          //BCS2 - body coordinate system resolved in center of rectangle
          constant Real eps = 100*Modelica.Constants.eps;
          //final parameter Real m=1;
          //final parameter Real n=0;

          Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b1
          "contact point rectangle BCS4 based on BCS2"
            annotation (Placement(transformation(extent={{86,-76},{118,-44}})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a1
          "center of rectangle (BCS2)"
            annotation (Placement(transformation(extent={{-118,-76},{-86,-44}})));
          Modelica.Mechanics.MultiBody.Sensors.RelativePosition
            rP_mp_rectangle_mp_ball(
              resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "reative position move point rectangle resolved in BCS1"
            annotation (Placement(transformation(
                extent={{-6,-6},{6,6}},
                rotation=270,
                origin={20,20})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a2
          "center of ball mass (BCS1)"
            annotation (Placement(transformation(extent={{-118,44},{-86,76}})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b2
          "contact point ball BCS3 based on BCS1"
            annotation (Placement(transformation(extent={{86,44},{118,76}})));
          Modelica.Blocks.Interfaces.RealInput Vector_ball[12] "radius ball"
                                                               annotation (
              Placement(transformation(
                extent={{-8,-8},{8,8}},
                rotation=0,
                origin={-108,10})));
          Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP_ball_rectangle(
              resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "relative position center of ball mass resolved in BCS2"
            annotation (Placement(transformation(
                extent={{-6,-6},{6,6}},
                rotation=90,
                origin={-66,0})));
          Modelica.Blocks.Interfaces.RealOutput pos_rel[3]
          "relative position between ball contact point and center of rectangle resolved in BCS2"
            annotation (Placement(transformation(
                extent={{-8,-8},{8,8}},
                rotation=270,
                origin={80,-108})));
          Modelica.Mechanics.MultiBody.Sensors.AbsoluteAngularVelocity aAV(
              resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameA.frame_resolve)
          "angular velocity contact point ball resolved in BCS1"
            annotation (Placement(transformation(extent={{-6,-6},{6,6}},
                rotation=270,
                origin={-40,20})));
          Modelica.Blocks.Interfaces.RealOutput w[3]
          "angular velocity contact point ball resolved in BCS1"
            annotation (Placement(transformation(
                extent={{-8,-8},{8,8}},
                rotation=270,
                origin={-40,-108})));
          Modelica.Blocks.Interfaces.RealInput vector_r[12]
          "length/width direction and L_W_H"                   annotation (
              Placement(transformation(
                extent={{-8,-8},{8,8}},
                rotation=0,
                origin={-108,-30})));

          Modelica.Mechanics.MultiBody.Parts.PointMass move_point_rectangle(
            m=0,
            animation=Animation,
            sphereColor=Color_contact_point_rectangle,
            sphereDiameter=2*radiusContactPoint)
            annotation (Placement(transformation(extent={{98,-48},{112,-34}})));
          Modelica.Mechanics.MultiBody.Parts.PointMass move_point_ball(
            m=0,
            animation=Animation,
            sphereColor=colorContactPoints1,
            sphereDiameter=2*radiusContactPoint)
            annotation (Placement(transformation(extent={{102,24},{116,38}})));
          Modelica.Mechanics.MultiBody.Sensors.RelativePosition
            rP_mp_ball_rectangle(
              resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "relative position contact point  ball resolved in BCS2"
            annotation (Placement(transformation(
                extent={{-6,-6},{6,6}},
                rotation=90,
                origin={72,20})));

          Real L_W_H[3] "length, width, and height of rectangle";
          Real length_direction[3] "length direction rectangle";
          Real width_direction[3] "width direction rectangle";
          Real height_direction[3] "height direction rectangle";
          Real R "Radius ball";

          Real l_cp_r
          "position contact point rectangle in length direction in BCS2";
          Real w_cp_r
          "position contact point rectangle in width direction in BCS2";
          Real v_lw_cp_r[3]
          "vector position of contact point rectangle in length- and width-direction in BCS2";
          Real lw_cp_r "norm of vector v_lw_cp_r";
          Boolean temp;

      public
          IdealizedContact.Components.Utilities.variablePrism1 variablePrism_ball
          "offset from center of bal mass to contact point ball"
            annotation (Placement(transformation(extent={{48,52},{64,68}})));
      public
          IdealizedContact.Components.Utilities.variablePrism1 variablePrism_rLW
          "offset from center of rectangle to contact point rectangle"
            annotation (Placement(transformation(extent={{-62,-68},{-46,-52}})));
          Modelica.Blocks.Interfaces.RealOutput pos_rel_mb_BCS2[3]
          "Relative position center of mass ball resolved in BCS2"
            annotation (Placement(transformation(extent={{100,-8},{116,8}})));
          Modelica.Blocks.Routing.DeMultiplex4 deMultiplex1(
            n1=3,
            n2=3,
            n3=3,
            n4=3) annotation (Placement(transformation(extent={{-94,4},{-82,16}})));
          Modelica.Blocks.Routing.DeMultiplex4 deMultiplex3(
            n1=3,
            n2=3,
            n3=3,
            n4=3) annotation (Placement(transformation(extent={{-92,-36},{-80,-24}})));
          Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP_ctb_BCS1(
              resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "relative position contact point ball resolved in BCS1"
            annotation (Placement(transformation(extent={{34,74},{46,86}})));
          Modelica.Blocks.Interfaces.RealOutput pos_ctb_BCS1[3]
          "relative position contact point ball resolved in BCS1"   annotation (
              Placement(transformation(
                extent={{-8,-8},{8,8}},
                rotation=270,
                origin={40,-108})));
        equation
          length_direction=deMultiplex3.y1;
          width_direction=deMultiplex3.y2;
          height_direction=deMultiplex3.y3;
          L_W_H=deMultiplex3.y4;
          R=deMultiplex1.y4[1];
          temp=abs(rP_ball_rectangle.r_rel*length_direction)<L_W_H[1]/2;

        //----------from center of rectangle to move point rectangle-------------------------------------
          l_cp_r=smooth(1,if abs(rP_ball_rectangle.r_rel*length_direction)<L_W_H[1]/2 then
           rP_ball_rectangle.r_rel*length_direction else
          L_W_H[1]/2*sign(rP_ball_rectangle.r_rel*length_direction));

          w_cp_r=smooth(1,if abs(rP_ball_rectangle.r_rel*width_direction)<L_W_H[2]/2 then
           rP_ball_rectangle.r_rel*width_direction else
          L_W_H[2]/2*sign(rP_ball_rectangle.r_rel*width_direction));

          v_lw_cp_r=l_cp_r*length_direction + w_cp_r*width_direction;
          lw_cp_r=sqrt(l_cp_r^2+w_cp_r^2+Modelica.Constants.eps);
          //lw_cp_r=n*sqrt(l_cp_r^2+w_cp_r^2+Modelica.Constants.eps)+m*sqrt((rP_ball_rectangle.r_rel*length_direction)^2+(rP_ball_rectangle.r_rel*width_direction)^2);

          variablePrism_rLW.s_ref=smooth(2,lw_cp_r);
          variablePrism_rLW.n=v_lw_cp_r;
        //-----------------------------------------------------------------------------------------------

        //----------from center of ball mass to contact point ball----------
          variablePrism_ball.s_ref=R;
          variablePrism_ball.n=rP_mp_rectangle_mp_ball.r_rel;
        //------------------------------------------------------------------

          connect(rP_ball_rectangle.frame_b, frame_a2)
                                                 annotation (Line(
              points={{-66,6},{-66,60},{-102,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(frame_a1, rP_ball_rectangle.frame_a)
                                                 annotation (Line(
              points={{-102,-60},{-66,-60},{-66,-6}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(frame_a2, rP_mp_rectangle_mp_ball.frame_a)
                                                    annotation (Line(
              points={{-102,60},{20,60},{20,26}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(aAV.w, w) annotation (Line(
              points={{-40,13.4},{-40,-108}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(move_point_ball.frame_a, frame_b2)
                                                annotation (Line(
              points={{109,31},{102,31},{102,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(move_point_rectangle.frame_a, frame_b1)
                                               annotation (Line(
              points={{105,-41},{102,-41},{102,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(pos_rel, rP_mp_ball_rectangle.r_rel) annotation (Line(
              points={{80,-108},{80,20},{78.6,20}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(rP_mp_ball_rectangle.frame_a, frame_a1) annotation (Line(
              points={{72,14},{72,-20},{-66,-20},{-66,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variablePrism_ball.frame_b, frame_b2) annotation (Line(
              points={{64,60},{102,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variablePrism_ball.frame_b, rP_mp_ball_rectangle.frame_b) annotation (
             Line(
              points={{64,60},{72,60},{72,26}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variablePrism_ball.frame_a, frame_a2) annotation (Line(
              points={{48,60},{-102,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variablePrism_rLW.frame_a, frame_a1)
                                                      annotation (Line(
              points={{-62,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variablePrism_rLW.frame_b, frame_b1) annotation (Line(
              points={{-46,-60},{102,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_mp_rectangle_mp_ball.frame_b, variablePrism_rLW.frame_b)
            annotation (Line(
              points={{20,14},{20,-60},{-46,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_ball_rectangle.r_rel, pos_rel_mb_BCS2)
                                                   annotation (Line(
              points={{-59.4,-4.04133e-016},{-50,-4.04133e-016},{-50,0},{108,0}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(Vector_ball, deMultiplex1.u) annotation (Line(
              points={{-108,10},{-95.2,10}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(deMultiplex3.u, vector_r) annotation (Line(
              points={{-93.2,-30},{-108,-30}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(rP_ctb_BCS1.frame_a, frame_a2) annotation (Line(
              points={{34,80},{-30,80},{-30,60},{-102,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_ctb_BCS1.frame_b, variablePrism_ball.frame_b) annotation (Line(
              points={{46,80},{64,80},{64,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_ctb_BCS1.r_rel, pos_ctb_BCS1) annotation (Line(
              points={{40,73.4},{40,-108}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(aAV.frame_a, variablePrism_ball.frame_b) annotation (Line(
              points={{-40,26},{-40,42},{64,42},{64,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(aAV.frame_resolve, frame_a2) annotation (Line(
              points={{-46.06,20},{-74,20},{-74,60},{-102,60}},
              color={95,95,95},
              pattern=LinePattern.Dot,
              smooth=Smooth.None));
          annotation (Diagram(graphics));
        end MovePointSphereToRectangle;

        model ForceSphereToRectangle

          import SI = Modelica.SIunits;

          parameter SI.TranslationalSpringConstant c=1000000 "spring constant";
          parameter SI.TranslationalDampingConstant d=1000 "damping constant";
          parameter Real n1 = 1.5;
          parameter Real n2 = n1;
          parameter SI.CoefficientOfFriction mue_r=0.0001 "rolling friction";
          parameter Real gamma1;
          parameter Real gamma2;
          parameter Real gamma3;
          parameter Real gamma4;
          parameter Real gamma5;
          parameter Real gamma6;
          parameter SI.Distance t_max=0.0001 "maximum penetration";

          //parameter SI.Velocity v_th=0.001;
          //parameter Real k_ac=1 "accuracy of edge contact 0.1~1";
          //parameter SI.ModulusOfElasticity E1=210000000000;
          //parameter SI.ModulusOfElasticity E2=210000000000;
          //parameter SI.PoissonNumber nue1=0.30;
          //parameter SI.PoissonNumber nue2=0.30;

          final parameter Modelica.Mechanics.MultiBody.Types.Axis y_direction={0,1,0}
          "cartesian coordinate system in y direction -- direction of gravity";
          final parameter Modelica.Mechanics.MultiBody.Types.Axis x_direction={1,0,0}
          "cartesian coordinate system in x direction";
          final parameter Modelica.Mechanics.MultiBody.Types.Axis z_direction=cross(x_direction, y_direction);

          //BCS1 - body coordenate system resolved in center of ball mass
          //BCS2 - body coordinate system resolved in center of rectangle

          Modelica.Blocks.Interfaces.RealInput pos_rel[3]
          "relative position between ball contact point and center of rectangle resolved in BCS2"
            annotation (Placement(transformation(extent={{-116,46},{-100,62}})));
          Modelica.Blocks.Interfaces.BooleanOutput contact
            annotation (Placement(transformation(extent={{96,-12},{116,8}})));

          Modelica.Blocks.Interfaces.RealInput vector_ball[12] "radius ball"
            annotation (Placement(transformation(extent={{-116,-62},{-100,-46}})));
          Modelica.Blocks.Interfaces.RealInput w_mov[3]
          "angular velocity contact point ball resolved in BCS1"
            annotation (Placement(transformation(extent={{-116,-28},{-100,-12}})));

          Real length_direction[3] "length direction rectangle";
          Real width_direction[3] "width direction rectangle";
          Real height_direction[3] "height direction rectangle";
          Real L_W_H[3] "length, width and height of rectangle";
          Real R "radius ball";

          Real l_rel
          "relative position ball contact point in length direction BCS2";
          Real w_rel
          "relative position ball contact point in width direction BCS2";
          Real h_rel
          "relative position ball contact point in height direction BCS2";

          Real f_n "normal force in height direction BCS2";
          Real f_l "friction in length direction BCS2";
          Real f_w "friction in width direction BCS2";

          Real f_normal[3] "normal force resolved in BCS2";
          Real f_tangential[3] "friction resolved in BCS2";

        //   Real v_rel[3] "relative velocity ball contact point resolved in BCS2";
        //   Real v_r[3] "circumferential velocity resolved in BCS2";

          Real r_ctb_BCS1[3] "position contact point ball resolved in BCS1";
          Real v_cmb_BCS2[3] "velocity center of mass ball resolved in BCS2";
          Real v_ctb_BCS2[3] "velocity contact ball resolved in BCS2";
          Real T_BCS12[3,3]
          "Transmation matrix from orientation objekt to rotate BCS1 into BCS4(BCS2)";
          Real v_rel_ct_BCS2[3]
          "relative velocity contact points resolved in BCS4";

          Real f_c;
          Real f_d;
          Real f_c_nl;
          Real fcd;
          Real fcd_nl;
          Real f_d_nl;
          Real fdd;
      public
          Modelica.Mechanics.MultiBody.Forces.Force force(resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a,
              animation=false) "Force resolved in BCS4 based on BCS2"
            annotation (Placement(transformation(
                extent={{-6,-6},{6,6}},
                rotation=0,
                origin={-30,70})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a1
          "contact point rectangle BCS4 based on BCS2"
            annotation (Placement(transformation(
                extent={{-14,-14},{14,14}},
                rotation=90,
                origin={-60,102})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a2
          "contact point ball BCS3 based on BCS1"
            annotation (Placement(transformation(
                extent={{-14,-14},{14,14}},
                rotation=90,
                origin={0,102})));
          Modelica.Blocks.Interfaces.RealInput vector_r[12]
          "length/width and L_W_H"
            annotation (Placement(transformation(extent={{-116,-102},{-100,-86}})));
          Modelica.Blocks.Interfaces.RealInput r_rel1[3]
          "Relative position center of mass ball resolved in BCS2"
            annotation (Placement(transformation(extent={{-8,-8},{8,8}},
                rotation=270,
                origin={48,108})));
          Modelica.Blocks.Routing.DeMultiplex4 deMultiplex1(
            n1=3,
            n2=3,
            n3=3,
            n4=3) annotation (Placement(transformation(extent={{-94,-60},{-82,-48}})));
          Modelica.Blocks.Routing.DeMultiplex4 deMultiplex3(
            n1=3,
            n2=3,
            n3=3,
            n4=3) annotation (Placement(transformation(extent={{-94,-100},{-82,-88}})));
          Modelica.Blocks.Interfaces.RealInput pos_ctb_BCS1[3]
          "relative position contact point ball resolved in BCS1"
            annotation (Placement(transformation(extent={{-116,12},{-100,28}})));
        equation

           length_direction=deMultiplex3.y1;
           width_direction=deMultiplex3.y2;
           height_direction=deMultiplex3.y3;
           L_W_H=deMultiplex3.y4;
           R=deMultiplex1.y4[1];

           l_rel =  pos_rel*length_direction;
           w_rel =  pos_rel*width_direction;
           h_rel =  pos_rel*height_direction;

           r_ctb_BCS1 = pos_ctb_BCS1;
           v_cmb_BCS2 = der(r_rel1);
           T_BCS12 = Modelica.Mechanics.MultiBody.Frames.to_T(Modelica.Mechanics.MultiBody.Frames.relativeRotation(frame_a2.R, frame_a1.R));

        //----------contact specification--------------------------------------------------------------------------
           contact = ((h_rel <= 0) and (h_rel >= -t_max) and (abs(l_rel)<=L_W_H[1]/2) and (abs(w_rel)<=L_W_H[2]/2))
          "l-w plane";
           //contact = ((abs(h_rel) <= t_max) and (abs(l_rel)<=L_W_H[1]/2) and (abs(w_rel)<=L_W_H[2]/2));
        //---------------------------------------------------------------------------------------------------------

        //----------relative velocity resolved in BCS2-------------------------------------------------------------
        //    v_r[1]=w_mov*width_direction*R
        //     "rotation velocity around width direction BCS2";
        //    v_r[2]=w_mov*height_direction*R "rotation around height direction BCS2";
        //    v_r[3]=w_mov*length_direction*R
        //     "rotation velocity around length direction BCS2";
        //
        //    v_rel[1]=der(l_rel)+v_r[1] "v_rel in length direction BCS2";
        //    v_rel[2]=0 "v_rel in height direction BCS2 is neglected";
        //    v_rel[3]=der(w_rel)-v_r[3] "v_rel in width direction BCS2";
           v_ctb_BCS2 = v_cmb_BCS2 + T_BCS12*cross(w_mov, r_ctb_BCS1);
           v_rel_ct_BCS2 = zeros(3) - v_ctb_BCS2;

        //---------------------------------------------------------------------------------------------------------

        //----------force resolved in BCS4-------------------------------------------------------------------------
           if (contact) then
             //f_n = c*(h_rel) - d*der(h_rel)*(sign(der(h_rel))-1)/2;
             //f_n = -c*(h_rel) - d*der(h_rel)*(-sign(der(h_rel))-1)/2;
             //f_n = -c*(h_rel) - d*der(r_rel1[2]);

             f_n =sign(h_rel)*(c*abs(h_rel)^n1) + d*abs(h_rel)^n2*der(r_rel1[2]);  //why isn't der(h_rel) used here?
             f_normal = -f_n*height_direction;

             //mue=gamma1*(tanh(gamma2*v_rel)-tanh(gamma3*v_rel))+gamma4*tanh(gamma5*v_rel)+gamma6*v_rel
        //      f_w = (gamma1*(tanh(gamma2*v_rel_ct_BCS4[3])-tanh(gamma3*v_rel_ct_BCS4[3]))+gamma4*tanh(gamma5*v_rel_ct_BCS4[3])+gamma6*v_rel_ct_BCS4[3])*(f_n) + mue_r*tanh(der(w_rel)*gamma2)*(f_n);
        //      f_l = (gamma1*(tanh(gamma2*v_rel_ct_BCS4[1])-tanh(gamma3*v_rel_ct_BCS4[1]))+gamma4*tanh(gamma5*v_rel_ct_BCS4[1])+gamma6*v_rel_ct_BCS4[1])*(f_n) + mue_r*tanh(der(l_rel)*gamma2)*(f_n);
             f_w = (gamma1*(tanh(gamma2*v_rel_ct_BCS2[3])-tanh(gamma3*v_rel_ct_BCS2[3]))+gamma4*tanh(gamma5*v_rel_ct_BCS2[3])+gamma6*v_rel_ct_BCS2[3])*abs(f_n) + mue_r*tanh(v_rel_ct_BCS2[3]*gamma2)*abs(f_n);
             f_l = (gamma1*(tanh(gamma2*v_rel_ct_BCS2[1])-tanh(gamma3*v_rel_ct_BCS2[1]))+gamma4*tanh(gamma5*v_rel_ct_BCS2[1])+gamma6*v_rel_ct_BCS2[1])*abs(f_n) + mue_r*tanh(v_rel_ct_BCS2[1]*gamma2)*abs(f_n);

             f_tangential = f_w*width_direction + f_l*length_direction;
             f_c= c*(h_rel);
             f_d= d*der(h_rel);
             fcd=f_c+f_d;
             f_c_nl= sign(h_rel)*(c*abs(h_rel)^n1);
             f_d_nl= d*abs(h_rel)^n2*der(r_rel1[2]);
             fcd_nl=f_c_nl+f_d_nl;
             fdd=fcd-fcd_nl;
           else
             f_n=0;
             f_normal=zeros(3);

             f_w=0;
             f_l=0;
             f_tangential=zeros(3);
             f_c= 0;
             f_d= 0;
             fcd=0;
             f_c_nl= 0;
             f_d_nl= 0;
             fcd_nl=0;
             fdd=0;
           end if;

           force.force=f_normal+f_tangential;

        //------------------------------------------------------------------------------------------------------

          connect(force.frame_a, frame_a1) annotation (Line(
              points={{-36,70},{-60,70},{-60,102}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(frame_a2, force.frame_b) annotation (Line(
              points={{1.77636e-015,102},{1.77636e-015,70},{-24,70}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(deMultiplex1.u, vector_ball) annotation (Line(
              points={{-95.2,-54},{-108,-54}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(deMultiplex3.u, vector_r) annotation (Line(
              points={{-95.2,-94},{-108,-94}},
              color={0,0,127},
              smooth=Smooth.None));
          annotation (Diagram(graphics), Icon(graphics));
        end ForceSphereToRectangle;

        model MovePointSphereToCircle

          parameter Real f=100000;
          parameter Boolean Animation=true;
          parameter Modelica.SIunits.Radius radiusContactPoint=0.005;
          parameter Modelica.Mechanics.MultiBody.Types.Color
            colorContactPoints1 =                                                {0,180,0};
          parameter Modelica.Mechanics.MultiBody.Types.Color
            Color_contact_point_circle =                                                {255,0,255};

          final parameter Modelica.Mechanics.MultiBody.Types.Axis y_direction={0,1,0}
          "cartesian coordinate system in y direction -- default gravity direction";
          final parameter Modelica.Mechanics.MultiBody.Types.Axis x_direction={1,0,0}
          "cartesian coordinate system in x direction";
          final parameter Modelica.Mechanics.MultiBody.Types.Axis z_direction=cross(x_direction, y_direction);

          //BCS1 - body coordinate system resolved in center of ball mass
          //BCS2 - body coordinate system resolved in center of circle

      protected
          Real Dl_direction[3] "length direction circle";
          Real Dw_direction[3] "width direction circle";
          Real V_direction[3] "vertical direction circle";
          Real R "radius ball";
          Real r "radius circle";

          Real r_lw;

          Real v_lw_cp_cr[3]
          "vector relative position contact point circle in diameter length and diameter width direction BCS2";
          Real lw_cp_cr "norm of vector v_lw_cp_cr";

          Modelica.Mechanics.MultiBody.Sensors.RelativePosition
            rP_mp_circle_mp_ball(
              resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "reative position move point circle resolved in BCS ball"
            annotation (Placement(transformation(
                extent={{-6,-6},{6,6}},
                rotation=270,
                origin={14,20})));
          Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP_ball_circle(
              resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "relative position center of ball mass resolved in BCS circle"
            annotation (Placement(transformation(
                extent={{-6,-6},{6,6}},
                rotation=90,
                origin={-72,0})));
          Modelica.Mechanics.MultiBody.Sensors.AbsoluteAngularVelocity aAV(
              resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameA.frame_resolve)
          "angular velocity contact point ball resolved in BCS1"
            annotation (Placement(transformation(extent={{-6,-6},{6,6}},
                rotation=270,
                origin={-40,20})));
          Modelica.Mechanics.MultiBody.Parts.PointMass contact_point_circle(
            m=0,
            animation=Animation,
            sphereColor=Color_contact_point_circle,
            sphereDiameter=2*radiusContactPoint)
            annotation (Placement(transformation(extent={{96,-44},{110,-30}})));
          Modelica.Mechanics.MultiBody.Parts.PointMass contact_point_ball(
            m=0,
            animation=Animation,
            sphereColor=colorContactPoints1,
            sphereDiameter=2*radiusContactPoint)
            annotation (Placement(transformation(extent={{98,22},{112,36}})));
          Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP_mp_ball_circle(
              resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "relative position contact point ball resolved in BCS2"
            annotation (Placement(transformation(
                extent={{-6,-6},{6,6}},
                rotation=90,
                origin={72,20})));
      public
          Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b1
          "contact point circle BCS4 based on BCS2"
            annotation (Placement(transformation(extent={{86,-76},{118,-44}})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a1
          "center of circle (BCS2)"
            annotation (Placement(transformation(extent={{-118,-76},{-86,-44}})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a2
          "center of ball mass (BCS1)"
            annotation (Placement(transformation(extent={{-118,44},{-86,76}})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b2
          "contact point ball BCS3 based on BCS1"
            annotation (Placement(transformation(extent={{86,44},{118,76}})));
          Modelica.Blocks.Interfaces.RealInput Vector_ball[12] "radius ball"
                                                               annotation (
              Placement(transformation(
                extent={{-8,-8},{8,8}},
                rotation=0,
                origin={-108,10})));
          Modelica.Blocks.Interfaces.RealOutput pos_rel[3]
          "relative position contact point ball resolved in BCS2"
            annotation (Placement(transformation(
                extent={{-8,-8},{8,8}},
                rotation=270,
                origin={80,-108})));
          Modelica.Blocks.Interfaces.RealOutput w[3]
          "angular velocity contact point ball resolved in BCS1"
            annotation (Placement(transformation(
                extent={{-8,-8},{8,8}},
                rotation=270,
                origin={-40,-108})));
          Modelica.Blocks.Interfaces.RealInput vector_circle[12]
          "V-Dl-Dw direction and Radius"                       annotation (
              Placement(transformation(
                extent={{-8,-8},{8,8}},
                rotation=0,
                origin={-108,-30})));
          IdealizedContact.Components.Utilities.variablePrism1 variablePrism_ball
            annotation (Placement(transformation(extent={{46,50},{66,70}})));
          IdealizedContact.Components.Utilities.variablePrism1 variablePrism_crLW
            annotation (Placement(transformation(extent={{-64,-70},{-44,-50}})));
          Modelica.Blocks.Interfaces.RealOutput pos_rel_mb_BCS2[3]
          "Relative position vector resolved in frame defined by resolveInFrame"
            annotation (Placement(transformation(extent={{100,-10},{120,10}})));
          Modelica.Blocks.Routing.DeMultiplex4 deMultiplex1(
            n1=3,
            n2=3,
            n3=3,
            n4=3) annotation (Placement(transformation(extent={{-94,4},{-82,16}})));
          Modelica.Blocks.Routing.DeMultiplex4 deMultiplex3(
            n1=3,
            n2=3,
            n3=3,
            n4=3) annotation (Placement(transformation(extent={{-94,-36},{-82,-24}})));
          Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP_ctb_BCS1(
              resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "relative position contact point ball resolved in BCS1"
            annotation (Placement(transformation(extent={{34,78},{46,90}})));
          Modelica.Blocks.Interfaces.RealOutput pos_ctb_BCS1[3]
          "relative position contact point ball resolved in BCS1"   annotation (
              Placement(transformation(
                extent={{-8,-8},{8,8}},
                rotation=270,
                origin={40,-108})));
        equation

          V_direction=deMultiplex3.y1;
          Dw_direction=deMultiplex3.y2;
          Dl_direction=deMultiplex3.y3;
          r=deMultiplex3.y4[1];
          R=deMultiplex1.y4[1];

        //----------from center of circle to contact circle---------------------------------------

          r_lw=sqrt((rP_ball_circle.r_rel*Dl_direction)^2 + (rP_ball_circle.r_rel*Dw_direction)^2+Modelica.Constants.eps);

          lw_cp_cr=smooth(2, if r_lw<r then r_lw else r);

          v_lw_cp_cr=rP_ball_circle.r_rel*Dl_direction*Dl_direction + rP_ball_circle.r_rel*Dw_direction*Dw_direction;

          variablePrism_crLW.s_ref=lw_cp_cr;
          variablePrism_crLW.n=v_lw_cp_cr;

        //---------------------------------------------------------------------------------------

        //----------from center of ball mass to contact point ball------
          variablePrism_ball.s_ref=R;
          variablePrism_ball.n=rP_mp_circle_mp_ball.r_rel;
        //--------------------------------------------------------------

          connect(rP_ball_circle.frame_b, frame_a2)
                                                 annotation (Line(
              points={{-72,6},{-72,60},{-102,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(frame_a1, rP_ball_circle.frame_a)
                                                 annotation (Line(
              points={{-102,-60},{-72,-60},{-72,-6}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(aAV.w,w)  annotation (Line(
              points={{-40,13.4},{-40,-108}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(contact_point_ball.frame_a, frame_b2)
                                                annotation (Line(
              points={{105,29},{102,29},{102,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(contact_point_circle.frame_a, frame_b1)
                                               annotation (Line(
              points={{103,-37},{102,-37},{102,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(pos_rel, rP_mp_ball_circle.r_rel)    annotation (Line(
              points={{80,-108},{80,20},{78.6,20}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(rP_mp_ball_circle.frame_a, frame_a1)    annotation (Line(
              points={{72,14},{72,-18},{-72,-18},{-72,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_mp_circle_mp_ball.frame_a, frame_a2) annotation (Line(
              points={{14,26},{14,60},{-102,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variablePrism_ball.frame_a, frame_a2) annotation (Line(
              points={{46,60},{-102,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variablePrism_ball.frame_b, frame_b2) annotation (Line(
              points={{66,60},{102,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variablePrism_ball.frame_b, rP_mp_ball_circle.frame_b) annotation (
              Line(
              points={{66,60},{72,60},{72,26}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variablePrism_crLW.frame_a, frame_a1) annotation (Line(
              points={{-64,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variablePrism_crLW.frame_b, frame_b1) annotation (Line(
              points={{-44,-60},{102,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variablePrism_crLW.frame_b, rP_mp_circle_mp_ball.frame_b) annotation (
             Line(
              points={{-44,-60},{14,-60},{14,14}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_ball_circle.r_rel, pos_rel_mb_BCS2)
                                                annotation (Line(
              points={{-65.4,-4.04133e-016},{-40,-4.04133e-016},{-40,0},{110,0}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(deMultiplex1.u, Vector_ball) annotation (Line(
              points={{-95.2,10},{-108,10}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(deMultiplex3.u, vector_circle) annotation (Line(
              points={{-95.2,-30},{-108,-30}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(aAV.frame_a, variablePrism_ball.frame_b) annotation (Line(
              points={{-40,26},{-40,42},{66,42},{66,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(aAV.frame_resolve, frame_a2) annotation (Line(
              points={{-46.06,20},{-62,20},{-62,60},{-102,60}},
              color={95,95,95},
              pattern=LinePattern.Dot,
              smooth=Smooth.None));
          connect(rP_ctb_BCS1.frame_b, variablePrism_ball.frame_b) annotation (
              Line(
              points={{46,84},{66,84},{66,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_ctb_BCS1.frame_a, frame_a2) annotation (Line(
              points={{34,84},{14,84},{14,60},{-102,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_ctb_BCS1.r_rel, pos_ctb_BCS1) annotation (Line(
              points={{40,77.4},{40,-108}},
              color={0,0,127},
              smooth=Smooth.None));
          annotation (Diagram(graphics));
        end MovePointSphereToCircle;

        model ForceSphereToCircle

          import SI = Modelica.SIunits;

          parameter SI.TranslationalSpringConstant c=1000000;
          parameter SI.TranslationalDampingConstant d=1000;
          parameter Real n1 = 1.5;
          parameter Real n2 = n1;
          parameter SI.CoefficientOfFriction mue_r=0.0001 "rolling friction";
          parameter Real gamma1;
          parameter Real gamma2;
          parameter Real gamma3;
          parameter Real gamma4;
          parameter Real gamma5;
          parameter Real gamma6;
          parameter SI.Distance t_max=0.0001 "Maximale Eindringtiefe";

          //parameter SI.Velocity v_th=0.001;
          //parameter Real k_ac=1 "accuracy of edge contact 0.1~1";
          //parameter SI.ModulusOfElasticity E1=210000000000;
          //parameter SI.ModulusOfElasticity E2=210000000000;
          //parameter SI.PoissonNumber nue1=0.30;
          //parameter SI.PoissonNumber nue2=0.30;

          final parameter Modelica.Mechanics.MultiBody.Types.Axis y_direction={0,1,0}
          "cartesian coordinate system in y direction -- direction of gravity";
          final parameter Modelica.Mechanics.MultiBody.Types.Axis x_direction={1,0,0}
          "cartesian coordinate system in x direction";
          final parameter Modelica.Mechanics.MultiBody.Types.Axis z_direction=cross(x_direction, y_direction);
          //BCS1 - body coordinate system resolved in center of ball mass
          //BCS2 - body coordinate system resolved in center of circle
          //BCS3 - body coordinate system resolved in contact point ball based on BCS1
          //BCS4 - body coordinate system resolved in contact point circle based on BCS2

      public
          Modelica.Mechanics.MultiBody.Forces.Force force(resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a,
              animation=false) "Force resolved in BCS4"
            annotation (Placement(transformation(
                extent={{-6,-6},{6,6}},
                rotation=0,
                origin={-30,80})));
          Modelica.Blocks.Interfaces.BooleanOutput contact
            annotation (Placement(transformation(extent={{96,-12},{116,8}})));
          Modelica.Blocks.Interfaces.RealInput vector_ball[12] "radius ball"
            annotation (Placement(transformation(extent={{-116,-62},{-100,-46}})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a1
          "contact point circle BCS4"
            annotation (Placement(transformation(
                extent={{-14,-14},{14,14}},
                rotation=90,
                origin={-60,102})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a2
          "contact point ball BCS3"
            annotation (Placement(transformation(
                extent={{-14,-14},{14,14}},
                rotation=90,
                origin={0,102})));
          Modelica.Blocks.Interfaces.RealInput vector_c[12]
            annotation (Placement(transformation(extent={{-116,-102},{-100,-86}})));

          Real Dl_direction[3] "length direction circle";
          Real Dw_direction[3] "width direction circle";
          Real V_direction[3] "vertical direction circle";
          Real r "radius circle";
          Real R "radius ball";

          Real l_rel "relative position ball in diameter length direction BCS2";
          Real w_rel "relative position ball in diameter width direction BCS2";
          Real h_rel "relative position in vertical direction BCS2";

          Real f_n "normal force in vertical direction BCS2";
          Real f_l "friction in diameter length direction BCS2";
          Real f_w "friction in diameter width direction BCS2";

          Real f_normal[3] "normal force resolved in BCS2";
          Real f_tangential[3] "friction resolved in BCS2";

        //   Real v_rel[3] "relative velocity contact point ball resolved in BCS2";
        //   Real v_r[3] "circumferential velocity resolved in BCS2";

          Real r_ctb_BCS1[3] "position contact point ball resolved in BCS1";
          Real v_cmb_BCS2[3] "velocity center of mass ball resolved in BCS2";
          Real v_ctb_BCS2[3] "velocity contact ball resolved in BCS2";
          Real T_BCS12[3,3]
          "Transmation matrix from orientation objekt to rotate BCS1 into BCS4(BCS2)";
          Real v_rel_ct_BCS2[3]
          "relative velocity contact points resolved in BCS2";

          Modelica.Blocks.Interfaces.RealInput r_rel[3]
          "Relative position center of mass ball resolved in BCS2"
            annotation (Placement(transformation(extent={{-8,-8},{8,8}},
                rotation=270,
                origin={40,108})));
          Modelica.Blocks.Routing.DeMultiplex4 deMultiplex1(
            n1=3,
            n2=3,
            n3=3,
            n4=3) annotation (Placement(transformation(extent={{-92,-60},{-80,-48}})));
          Modelica.Blocks.Routing.DeMultiplex4 deMultiplex3(
            n1=3,
            n2=3,
            n3=3,
            n4=3) annotation (Placement(transformation(extent={{-92,-100},{-80,-88}})));
          Modelica.Blocks.Interfaces.RealInput pos_rel[3]
          "relative position between ball contact point and center of circle resolved in BCS2"
            annotation (Placement(transformation(extent={{-116,46},{-100,62}})));
          Modelica.Blocks.Interfaces.RealInput w_mov[3]
          "angular velocity contact point ball resolved in BCS1"
            annotation (Placement(transformation(extent={{-116,-22},{-100,-6}})));
          Modelica.Blocks.Interfaces.RealInput pos_ctb_BCS1[3]
          "relative position contact point ball resolved in BCS1"
            annotation (Placement(transformation(extent={{-116,12},{-100,28}})));
        equation
           V_direction=deMultiplex3.y1;
           Dw_direction=deMultiplex3.y2;
           Dl_direction=deMultiplex3.y3;
           r=deMultiplex3.y4[1];
           R=deMultiplex1.y4[1];

           l_rel =  pos_rel*Dl_direction;
           w_rel =  pos_rel*Dw_direction;
           h_rel =  pos_rel*V_direction;

           r_ctb_BCS1 = pos_ctb_BCS1;
           v_cmb_BCS2 = der(r_rel);
           T_BCS12 = Modelica.Mechanics.MultiBody.Frames.to_T(Modelica.Mechanics.MultiBody.Frames.relativeRotation(frame_a2.R, frame_a1.R));

        //----------contact specification----------------------------------------------------
           contact = (h_rel <= 0) and (h_rel >= -t_max) and sqrt((l_rel)^2+(w_rel)^2)<=r
          "x-z plane";
        //-----------------------------------------------------------------------------------

        //----------relative velocity resolved in BCS2--------------------------------------------
        //    v_r[1]=w_mov*Dw_direction*R
        //     "rotation velocity around diameter width direction BCS2";
        //    v_r[2]=0 "rotation around vertical direction BCS2 is neglected";
        //    v_r[3]=w_mov*Dl_direction*R
        //     "rotation velocity around diameter length direction BCS2";
        //
        //    v_rel[1]=der(l_rel)+v_r[1] "v_rel in diameter length direction BCS2";
        //    v_rel[2]=0 "v_rel in vertical direction BCS2 is neglected";
        //    v_rel[3]=der(w_rel)-v_r[3] "v_rel in diameter width direction BCS2";
        //
        // //   v_rel[1]=der(l_rel)-(abs(w_mov*Dw_direction)+abs(w_mov*V_direction))*R*sign(der(l_rel))
        // //    "w_rel in x direction";
        // //   v_rel[2]=der(h_rel)-(abs(w_mov*Dw_direction)+abs(w_mov*Dl_direction))*R*sign(der(h_rel))
        // //    "w_rel in y direction";
        // //   v_rel[3]=der(w_rel)-(abs(w_mov*Dl_direction)+abs(w_mov*V_direction))*R*sign(der(w_rel))
        // //    "w_rel in z direction";

           v_ctb_BCS2 = v_cmb_BCS2 + T_BCS12*cross(w_mov, r_ctb_BCS1);
           v_rel_ct_BCS2 = zeros(3) - v_ctb_BCS2;

        //---------------------------------------------------------------------------------------

        //----------force resolved in BCS4-------------------------------------------------------
           if (contact) then

             f_n = sign(h_rel)*(c*abs(h_rel)^n1) + d*abs(h_rel)^n2*der(r_rel[2]);
             f_normal = -f_n*V_direction;

              //mue=gamma1*(tanh(gamma2*v_rel)-tanh(gamma3*v_rel))+gamma4*tanh(gamma5*v_rel)+gamma6*v_rel
        //      f_w = (gamma1*(tanh(gamma2*v_rel[3])-tanh(gamma3*v_rel[3]))+gamma4*tanh(gamma5*v_rel[3])+gamma6*v_rel[3])*(f_n) + mue_r*tanh(der(w_rel)*gamma2)*(f_n);
        //      f_l = (gamma1*(tanh(gamma2*v_rel[1])-tanh(gamma3*v_rel[1]))+gamma4*tanh(gamma5*v_rel[1])+gamma6*v_rel[1])*(f_n) + mue_r*tanh(der(l_rel)*gamma2)*(f_n);
             f_w = (gamma1*(tanh(gamma2*v_rel_ct_BCS2[3])-tanh(gamma3*v_rel_ct_BCS2[3]))+gamma4*tanh(gamma5*v_rel_ct_BCS2[3])+gamma6*v_rel_ct_BCS2[3])*abs(f_n) + mue_r*tanh(v_rel_ct_BCS2[3]*gamma2)*abs(f_n);
             f_l = (gamma1*(tanh(gamma2*v_rel_ct_BCS2[1])-tanh(gamma3*v_rel_ct_BCS2[1]))+gamma4*tanh(gamma5*v_rel_ct_BCS2[1])+gamma6*v_rel_ct_BCS2[1])*abs(f_n) + mue_r*tanh(v_rel_ct_BCS2[1]*gamma2)*abs(f_n);

             f_tangential = f_w*Dw_direction + f_l*Dl_direction;
           else
             f_n=0;
             f_normal=zeros(3);

             f_w=0;
             f_l=0;
             f_tangential=zeros(3);
           end if;

           force.force=f_normal+f_tangential;
        //---------------------------------------------------------------------------------------
          connect(force.frame_a,frame_a1)  annotation (Line(
              points={{-36,80},{-60,80},{-60,102}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(frame_a2,force. frame_b) annotation (Line(
              points={{1.77636e-015,102},{1.77636e-015,80},{-24,80}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(vector_ball, deMultiplex1.u) annotation (Line(
              points={{-108,-54},{-93.2,-54}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(vector_c, deMultiplex3.u) annotation (Line(
              points={{-108,-94},{-93.2,-94}},
              color={0,0,127},
              smooth=Smooth.None));
          annotation (Diagram(graphics));
        end ForceSphereToCircle;

        model MovePointConvexToConvex

          parameter Modelica.SIunits.Frequency f=100000;
          parameter Boolean Animation=true;
          parameter Modelica.SIunits.Radius radiusContactPoint=0.005;
          parameter Modelica.Mechanics.MultiBody.Types.Color
            colorContactPoint1 =                                                {0,180,0};
          parameter Modelica.Mechanics.MultiBody.Types.Color
            colorContactPoint2 =                                                {255,0,255};
          Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a
            annotation (Placement(transformation(extent={{-316,176},{-284,208}})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a1
            annotation (Placement(transformation(extent={{-316,-204},{-284,-172}})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b
            annotation (Placement(transformation(extent={{324,176},{356,208}})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b1
            annotation (Placement(transformation(extent={{324,-172},{356,-204}})));
           IdealizedContact.Components.Utilities.variablePrism1
            variablePrism1_1
            annotation (Placement(transformation(extent={{108,182},{128,202}})));
          Modelica.Mechanics.MultiBody.Visualizers.FixedShape fixedShape(
            shapeType="sphere",
            animation=Animation,
            r_shape={-radiusContactPoint,0,0},
            length=2*radiusContactPoint,
            width=2*radiusContactPoint,
            height=2*radiusContactPoint,
            color=colorContactPoint1)
            annotation (Placement(transformation(extent={{-10,-10},{10,10}},
                rotation=90,
                origin={318,208})));
          Modelica.Blocks.Interfaces.RealInput u1[12]
            annotation (Placement(transformation(extent={{-322,72},{-282,112}})));
          Modelica.Blocks.Interfaces.RealInput u2[12]
            annotation (Placement(transformation(extent={{-320,-68},{-280,-28}})));
          Modelica.Mechanics.MultiBody.Visualizers.FixedShape fixedShape1(
            shapeType="sphere",
            animation=Animation,
            r_shape={-radiusContactPoint,0,0},
            length=radiusContactPoint,
            width=radiusContactPoint,
            height=radiusContactPoint,
            color=colorContactPoint2)
            annotation (Placement(transformation(extent={{-10,-10},{10,10}},
                rotation=270,
                origin={320,-208})));
          IdealizedContact.Components.Utilities.variablePrism1
            variablePrism1_2 annotation (Placement(transformation(
                extent={{-12,12},{12,-12}},
                rotation=0,
                origin={90,-188})));
          IdealizedContact.ContactBlock.PunctiformContact.Components.CalculationsConvexSurfaces.FindMinimum
            findMinimum
            annotation (Placement(transformation(extent={{-20,-20},{44,38}})));
          IdealizedContact.ContactBlock.PunctiformContact.Components.CalculationsConvexSurfaces.R0
                                                                                                            r0_1
            annotation (Placement(transformation(
                extent={{-11,-10},{11,10}},
                rotation=90,
                origin={118,135})));
          IdealizedContact.ContactBlock.PunctiformContact.Components.CalculationsConvexSurfaces.R0
                                                                                                            r0_2
            annotation (Placement(transformation(
                extent={{12,-12},{-12,12}},
                rotation=90,
                origin={90,-130})));
          Modelica.Blocks.Interfaces.RealOutput distance annotation (Placement(transformation(extent={{330,-24},{350,-4}})));
          Modelica.Mechanics.MultiBody.Sensors.AbsoluteAngularVelocity
            absoluteAngularVelocity annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={-200,104})));
        CalculationsConvexSurfaces.RelativeVelocities velocities annotation (Placement(transformation(extent={{-220,-18},{-156,42}})));
          Modelica.Mechanics.MultiBody.Sensors.AbsoluteAngularVelocity
            absoluteAngularVelocity1
                                    annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=90,
                origin={-202,-80})));
          Modelica.Blocks.Interfaces.RealOutput v_rel[3]
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-142,-230})));
          Modelica.Blocks.Interfaces.RealOutput normal_basis_trf[3,3]
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={40,-230})));
          IdealizedContact.Interfaces.ShapeTypeInput surfaceType1
            annotation (Placement(transformation(extent={{-320,14},{-280,54}})));
          IdealizedContact.Interfaces.ShapeTypeInput surfaceType2
            annotation (Placement(transformation(extent={{-320,-120},{-280,-80}})));
        equation
          //deploy parameters/inputs
        connect(findMinimum.surfaceType1,surfaceType1);
        connect(findMinimum.surfaceType2,surfaceType2);
          connect(velocities.surfaceType1, surfaceType1);
          connect(velocities.surfaceType2, surfaceType2);
        connect(r0_1.shapeType,surfaceType1);
        connect(r0_2.shapeType,surfaceType2);
          connect(velocities.h1, u1[10:12]);
          connect(velocities.h2, u2[10:12]);
        connect(findMinimum.h1,u1[10:12]);
        connect(findMinimum.h2,u2[10:12]);
        connect(r0_1.h,u1[10:12]);
        connect(r0_2.h,u2[10:12]);

          connect(variablePrism1_1.frame_a,frame_a)  annotation (Line(
              points={{108,192},{-300,192}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variablePrism1_1.frame_b,frame_b)  annotation (Line(
              points={{128,192},{340,192}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(fixedShape.frame_a,frame_b)  annotation (Line(
              points={{318,198},{318,192},{340,192}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(fixedShape1.frame_a,frame_b1)  annotation (Line(
              points={{320,-198},{320,-188},{340,-188}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variablePrism1_2.frame_a,frame_a1)  annotation (Line(
              points={{78,-188},{-300,-188}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variablePrism1_2.frame_b,frame_b1)  annotation (Line(
              points={{102,-188},{340,-188}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(findMinimum.a1,frame_a)  annotation (Line(
              points={{13.8286,38},{14,38},{14,192},{-300,192}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(findMinimum.a2,frame_a1)  annotation (Line(
              points={{10.6286,-20.4143},{10,-20.4143},{10,-188},{-300,-188}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(r0_2.out, variablePrism1_2.n)
            annotation (Line(
              points={{81.6,-143.2},{81.6,-174},{82,-174},{82,-178},{82.08,-178},{82.08,-180.8}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(r0_2.z, variablePrism1_2.s_ref)
            annotation (Line(
              points={{98.4,-143.2},{98.4,-150},{98,-150},{98,-166},{97.44,-166},{97.44,-180.8}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(r0_1.out, variablePrism1_1.n)
            annotation (Line(
              points={{111,147.1},{111,168},{111.4,168},{111.4,186}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(r0_1.z, variablePrism1_1.s_ref)
            annotation (Line(
              points={{125,147.1},{125,173.5},{124.2,173.5},{124.2,186}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(distance, findMinimum.distance)
            annotation (Line(
              points={{340,-14},{45.1429,-14},{45.1429,-14.4071}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(absoluteAngularVelocity.frame_a,frame_a)  annotation (Line(
              points={{-200,114},{-200,192},{-300,192}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(absoluteAngularVelocity.w, velocities.omega_1)
            annotation (Line(
              points={{-200,93},{-200,42.6},{-203.36,42.6}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(absoluteAngularVelocity1.frame_a,frame_a1)  annotation (Line(
              points={{-202,-90},{-202,-188},{-300,-188}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(absoluteAngularVelocity1.w, velocities.omega_2)
            annotation (Line(
              points={{-202,-69},{-202,-18},{-202.72,-18}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(velocities.A2, findMinimum.A2) annotation (Line(
              points={{-170.08,-18},{-170.08,-38},{62,-38},{62,-6.53571},{
                45.1429,-6.53571}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(velocities.A1, findMinimum.A1) annotation (Line(
              points={{-182.88,-18},{-182.88,-30},{-182,-30},{-182,-70},{68,-70},
                {68,2},{44.9143,2},{44.9143,1.54286}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(findMinimum.rc_1, velocities.rc1) annotation (Line(
              points={{45.8286,33.0286},{64,33.0286},{64,34},{86,34},{86,58},{
                -82,58},{-82,10.8},{-156,10.8}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(findMinimum.rc_2, velocities.rc2) annotation (Line(
              points={{44.9143,23.9143},{72,23.9143},{72,24},{96,24},{96,66},{
                -88,66},{-88,-4},{-156,-4},{-156,-5.4}},
              color={0,0,127},
              smooth=Smooth.None));
        connect(velocities.vrel, v_rel)
          annotation (Line(
            points={{-171.68,42.3},{-171.68,66},{-142,66},{-142,-230}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(findMinimum.normal_basis_trf, normal_basis_trf) annotation (Line(
            points={{45.1429,8.79286},{45.1429,8},{74,8},{74,-102},{40,-102},{
                40,-230}},
            color={0,0,127},
            smooth=Smooth.None));
          connect(findMinimum.x0,findMinimum. y) annotation (Line(
              points={{-20.9143,20.6},{-42,20.6},{-42,78},{108,78},{108,16.4571},
                {44.9143,16.4571}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(velocities.ymin, findMinimum.y) annotation (Line(
              points={{-156,25.8},{-134,25.8},{-134,26},{-106,26},{-106,78},{
                108,78},{108,16.4571},{44.9143,16.4571}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(findMinimum.y[1, 1],r0_1. angles[1]) annotation (Line(
              points={{44.9143,13.9714},{78,13.9714},{78,14},{129,14},{129,124}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(findMinimum.y[2, 1],r0_1. angles[2])
            annotation (Line(
              points={{44.9143,15.6286},{44.9143,15.2285},{127,15.2285},{127,
                124}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(findMinimum.y[3, 1],r0_2. angles[1])
            annotation (Line(
              points={{44.9143,17.2857},{103.2,17.2857},{103.2,-118}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(findMinimum.y[4, 1],r0_2. angles[2])
            annotation (Line(
              points={{44.9143,18.9429},{100.8,18.9429},{100.8,-118}},
              color={0,0,127},
              smooth=Smooth.None));
          annotation (Diagram(coordinateSystem(extent={{-300,-220},{340,220}},
                  preserveAspectRatio=false),graphics), Icon(coordinateSystem(
                  extent={{-300,-220},{340,220}})));
        end MovePointConvexToConvex;

        model ForceConvexToConvex

          import SI = Modelica.SIunits;

          parameter SI.TranslationalSpringConstant c;
          parameter SI.TranslationalDampingConstant d;
          parameter Real n1;
          parameter Real n2;
          parameter Real gamma1;
          parameter Real gamma2;
          parameter Real gamma3;
          parameter Real gamma4;
          parameter Real gamma5;
          parameter Real gamma6;
          parameter SI.CoefficientOfFriction mue_r=0.0001 "rolling friction";
          parameter SI.Distance p_max=0.0025 "Maximale Eindringtiefe";

      protected
          Real f_normal[3];
          Real f_n;
          Real f_tx;
          Real f_tz;
          Real f_tangential_x[3];
          Real f_tangential_z[3];
          Real xn[3];
          Real yn[3];
          Real zn[3];
          Real vn;
          Real vtx;
          Real vtz;
          Real p "penetration";

      public
          Modelica.Blocks.Interfaces.BooleanOutput contact
            annotation (Placement(transformation(extent={{96,-12},{116,8}})));
          Modelica.Mechanics.MultiBody.Forces.Force force(resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a,
            connectionLineDiameter=0,
            animation=false) "Force tangetical"
            annotation (Placement(transformation(
                extent={{-6,-6},{6,6}},
                rotation=0,
                origin={-30,70})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a1
          "contact point rectangle"
            annotation (Placement(transformation(
                extent={{-14,-14},{14,14}},
                rotation=90,
                origin={-60,102})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a2
          "contact point ball"
            annotation (Placement(transformation(
                extent={{-14,-14},{14,14}},
                rotation=90,
                origin={0,102})));
          Modelica.Blocks.Interfaces.RealInput distance
          "relative position between ball contact point and center of rectangle resolved in BCS2"
            annotation (Placement(transformation(extent={{-8,-8},{8,8}},
                rotation=270,
                origin={48,108})));
          Modelica.Blocks.Interfaces.RealInput v_rel[3] annotation (Placement(transformation(extent={{-120,20},{-80,60}})));
          Modelica.Blocks.Interfaces.RealInput normalbasis[3,3]
            annotation (Placement(transformation(extent={{-120,-60},{-80,-20}})));
        equation

           xn[1]= normalbasis[1, 1];
           xn[2]= normalbasis[2, 1];
           xn[3]= normalbasis[3, 1];
           yn[1]= normalbasis[1, 2];
           yn[2]= normalbasis[2, 2];
           yn[3]= normalbasis[3, 2];
           zn[1]= normalbasis[1, 3];
           zn[2]= normalbasis[2, 3];
           zn[3]= normalbasis[3, 3];
           vtx= v_rel[1];
           vn= v_rel[2];
           vtz= v_rel[3];
           contact = (distance < p_max);

           if (contact) then
              p=(p_max - distance);
              f_n = sign(p)*(c*abs(p)^n1) + d*abs(p)^n2*vn;
              //f_n= c*(t_max - distance) + d*vn;
              f_tx = -gamma1*(tanh(gamma2*vtx)-tanh(gamma3*vtx))+gamma4*tanh(gamma5*vtx)+gamma6*vtx*f_n - mue_r*tanh(vtx)*f_n;
              f_tz = -gamma1*(tanh(gamma2*vtz)-tanh(gamma3*vtz))+gamma4*tanh(gamma5*vtz)+gamma6*vtz*f_n - mue_r*tanh(vtz)*f_n;
              f_normal = f_n*yn;
              f_tangential_x= f_tx*xn;
              f_tangential_z= f_tz*zn;
           else
             p=0;
             f_n= 0;
             f_tx=0;
             f_tz=0;
             f_normal= zeros(3);
             f_tangential_x=zeros(3);
             f_tangential_z=zeros(3);
           end if;

           force.force= f_normal+f_tangential_x+f_tangential_z;

          connect(force.frame_a, frame_a1) annotation (Line(
              points={{-36,70},{-60,70},{-60,102}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(frame_a2, force.frame_b) annotation (Line(
              points={{1.77636e-015,102},{1.77636e-015,70},{-24,70}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
                              graphics), Icon(graphics),
            experiment(
              Tolerance=1e-005,
              fixedstepsize=0.001,
              Algorithm="Dassl"),
            __Dymola_experimentSetupOutput);
        end ForceConvexToConvex;

        model MovePointConvexToPlane
           parameter Boolean animation=true;
          parameter Modelica.SIunits.Radius radiusContactPoint=0.005;
          parameter Modelica.Mechanics.MultiBody.Types.Color
            colorContactPoint1 =                                                {0,180,0};
          parameter Modelica.Mechanics.MultiBody.Types.Color
            colorContactPoint2 =                                                {255,0,255};

          Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a
            annotation (Placement(transformation(extent={{-116,84},{-84,116}})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a1
            annotation (Placement(transformation(extent={{-116,-96},{-84,-64}})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b
            annotation (Placement(transformation(extent={{184,84},{216,116}})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b1
            annotation (Placement(transformation(extent={{184,-96},{216,-64}})));
        CalculationsConvexToPlane.TransformationMatrixBetweenBodyFrames
          transformBodyFrame annotation (Placement(transformation(extent={{70,0},{90,20}})));
           IdealizedContact.Components.Utilities.variablePrism1
            variablePrism1_1
            annotation (Placement(transformation(extent={{120,90},{140,110}})));
          CalculationsConvexToPlane.FindMinimum
            MIN
            annotation (Placement(transformation(extent={{120,0},{140,20}})));
          Modelica.Blocks.Interfaces.RealInput u1[12]
            annotation (Placement(transformation(extent={{-110,30},{-90,50}})));
          Modelica.Blocks.Interfaces.RealInput u2[12]
            annotation (Placement(transformation(extent={{-110,-30},{-90,-10}})));
          CalculationsConvexToPlane.R0_1 r0 annotation (Placement(transformation(
                extent={{-10,-9},{10,9}},
                rotation=90,
                origin={129,60})));
          CalculationsConvexToPlane.splitparam
            splitparam1
            annotation (Placement(transformation(extent={{-90,0},{-70,20}})));
           IdealizedContact.Components.Utilities.variablePrism1
            variablePrism1_2 annotation (Placement(transformation(
                extent={{-10,10},{10,-10}},
                rotation=0,
                origin={130,-80})));
          CalculationsConvexToPlane.R0_2 contact2_1
            annotation (Placement(transformation(extent={{120,-50},{140,-30}})));
        CalculationsConvexToPlane.RelativeVelocities
          relativeVelocities annotation (Placement(transformation(extent={{-60,0},{-40,20}})));
          Modelica.Mechanics.MultiBody.Sensors.AbsoluteAngularVelocity
            absoluteAngularVelocity2
                                    annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={-60,70})));
          Modelica.Mechanics.MultiBody.Sensors.AbsoluteAngularVelocity
            absoluteAngularVelocity1
                                    annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=90,
                origin={-60,-50})));
          Modelica.Blocks.Interfaces.RealOutput vrel[3] annotation (Placement(
                transformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={-34,-110})));
          Modelica.Blocks.Interfaces.RealOutput prel[3]
          "Relative position vector resolved in frame defined by resolveInFrame"
            annotation (Placement(transformation(extent={{200,10},{220,30}})));
          Modelica.Mechanics.MultiBody.Sensors.RelativePosition relativePosition
            annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=90,
                origin={184,20})));
          Modelica.Mechanics.MultiBody.Visualizers.FixedShape fixedShape(
            shapeType="sphere",
            animation=animation,
            length=2*radiusContactPoint,
            width=2*radiusContactPoint,
            height=2*radiusContactPoint,
            color=colorContactPoint1,
            r_shape=-{1,0,0}*radiusContactPoint)
            annotation (Placement(transformation(extent={{-10,-10},{10,10}},
                rotation=90,
                origin={182,124})));
          Modelica.Mechanics.MultiBody.Visualizers.FixedShape fixedShape1(
            shapeType="sphere",
            animation=animation,
            length=2*radiusContactPoint,
            width=2*radiusContactPoint,
            height=2*radiusContactPoint,
            r_shape=-{1,0,0}*radiusContactPoint,
            color=colorContactPoint2)
            annotation (Placement(transformation(extent={{-10,-10},{10,10}},
                rotation=270,
                origin={184,-104})));
          Interfaces.ShapeTypeInput                  surfaceType1
            annotation (Placement(transformation(extent={{-110,54},{-94,70}})));
          Interfaces.ShapeTypeInput                  surfaceType2
            annotation (Placement(transformation(extent={{-112,-62},{-92,-42}})));
        equation
          connect(transformBodyFrame.frame_bcs1, frame_a) annotation (Line(
              points={{69.8,20},{70,20},{70,100},{-100,100}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(transformBodyFrame.frame_bcs2, frame_a1) annotation (Line(
              points={{69.8,0},{70,0},{70,-80},{-100,-80}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variablePrism1_1.frame_a, frame_a) annotation (Line(
              points={{120,100},{-100,100}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variablePrism1_1.frame_b, frame_b) annotation (Line(
              points={{140,100},{200,100}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(transformBodyFrame.trf, MIN.T) annotation (Line(
              points={{91,10},{120,10}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(MIN.y, MIN.x0) annotation (Line(
              points={{141,10},{160,10},{160,30},{130,30},{130,20}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(u1, splitparam1.u1) annotation (Line(
              points={{-100,40},{-90,40},{-90,20}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(splitparam1.u2, u2) annotation (Line(
              points={{-90,0},{-90,-20},{-100,-20}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(MIN.u1, splitparam1.y1) annotation (Line(
              points={{120,16},{100,16},{100,40},{-70,40},{-70,21}},
              color={0,0,127},
              smooth=Smooth.None));

          connect(variablePrism1_2.frame_a, frame_a1) annotation (Line(
              points={{120,-80},{-100,-80}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variablePrism1_2.frame_b, frame_b1) annotation (Line(
              points={{140,-80},{200,-80}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(contact2_1.frame_a1, frame_a1) annotation (Line(
              points={{120,-40},{100,-40},{100,-80},{-100,-80}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(contact2_1.frame_a, frame_b) annotation (Line(
              points={{140,-40},{168,-40},{168,100},{200,100}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(contact2_1.y, variablePrism1_2.n) annotation (Line(
              points={{123,-51},{123,-62.5},{123.4,-62.5},{123.4,-74}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(contact2_1.z, variablePrism1_2.s_ref) annotation (Line(
              points={{137,-51},{137,-62.5},{136.2,-62.5},{136.2,-74}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(r0.k, MIN.y) annotation (Line(
              points={{138,54},{160,54},{160,10},{141,10}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(r0.out, variablePrism1_1.n) annotation (Line(
              points={{122.7,71},{122.7,82.5},{123.4,82.5},{123.4,94}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(r0.z, variablePrism1_1.s_ref) annotation (Line(
              points={{135.3,71},{135.3,82.5},{136.2,82.5},{136.2,94}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(absoluteAngularVelocity2.frame_a, frame_a) annotation (Line(
              points={{-60,80},{-60,100},{-100,100}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(absoluteAngularVelocity1.frame_a, frame_a1) annotation (Line(
              points={{-60,-60},{-60,-80},{-100,-80}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
        connect(absoluteAngularVelocity1.w, relativeVelocities.omega_2) annotation (Line(
            points={{-60,-39},{-60,0}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(absoluteAngularVelocity2.w, relativeVelocities.omega_1) annotation (Line(
            points={{-60,59},{-60,20},{-59.8,20}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(transformBodyFrame.A1, relativeVelocities.A1) annotation (Line(
            points={{69,14},{16,14},{16,-12},{-52,-12},{-52,0}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(MIN.y, relativeVelocities.y) annotation (Line(
            points={{141,10},{160,10},{160,30},{-26,30},{-26,20},{-40,20}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(relativeVelocities.h1, splitparam1.y1) annotation (Line(
            points={{-40,16},{-22,16},{-22,40},{-70,40},{-70,21}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(relativeVelocities.vrel, vrel) annotation (Line(
            points={{-50,21},{-50,30},{-34,30},{-34,-110}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(transformBodyFrame.A2, relativeVelocities.A2) annotation (Line(
            points={{69,6},{66,6},{66,-10},{-48,-10},{-48,0},{-47.8,0}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(transformBodyFrame.rc1, relativeVelocities.rc1) annotation (Line(
            points={{80,-1},{80,-16},{24,-16},{24,8},{-40,8}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(transformBodyFrame.rc2, relativeVelocities.rc2) annotation (Line(
            points={{80,21},{80,26},{14,26},{14,4.2},{-40,4.2}},
            color={0,0,127},
            smooth=Smooth.None));
          connect(relativePosition.frame_b, frame_b) annotation (Line(
              points={{184,30},{184,100},{200,100}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(relativePosition.frame_a, frame_b1) annotation (Line(
              points={{184,10},{184,-80},{200,-80}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(relativePosition.r_rel, prel) annotation (Line(
              points={{195,20},{210,20}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(fixedShape.frame_a, frame_b)
            annotation (Line(
              points={{182,114},{184,114},{184,100},{200,100}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(frame_b1, fixedShape1.frame_a)
            annotation (Line(
              points={{200,-80},{184,-80},{184,-94}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(r0.h, splitparam1.y1) annotation (Line(
              points={{120,54},{110,54},{110,40},{-70,40},{-70,21}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(surfaceType2, contact2_1.contactShapeType);
          connect(splitparam1.y2, contact2_1.h) annotation (Line(
              points={{-70,-1},{-70,-20},{133,-20},{133,-30}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(MIN.contactShapeType, surfaceType1);
          connect(r0.contactShapeType, surfaceType1);
          connect(relativeVelocities.contactShapeType, surfaceType1);
          annotation (Diagram(coordinateSystem(extent={{-100,-100},{200,120}},
                  preserveAspectRatio=false),graphics), Icon(coordinateSystem(
                  extent={{-100,-100},{200,120}})));
        end MovePointConvexToPlane;

        model ForceConvexToPlane
        //This model calculates the force between an ellipsoid and a plane.
        //The force vector is resolved in the body frame of the plane.
          import SI = Modelica.SIunits;

          parameter SI.TranslationalSpringConstant c;
          parameter SI.TranslationalDampingConstant d;
          parameter Real n1 = 1;
          parameter Real n2 = 1.5;
          parameter Real gamma1;
          parameter Real gamma2;
          parameter Real gamma3;
          parameter Real gamma4;
          parameter Real gamma5;
          parameter Real gamma6;
          parameter SI.CoefficientOfFriction mue_r=0.0001 "rolling friction";
          parameter SI.Distance t_max=0.0001 "maximum of penetration";
      public
          Modelica.Mechanics.MultiBody.Forces.Force force(resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a,
            connectionLineDiameter=0,
          animation=false) "Force tangetical"
            annotation (Placement(transformation(
                extent={{-6,-6},{6,6}},
                rotation=0,
                origin={-30,70})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a1
          "contact point rectangle"
            annotation (Placement(transformation(
                extent={{-14,-14},{14,14}},
                rotation=90,
                origin={-60,100})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a2
          "contact point ball"
            annotation (Placement(transformation(
                extent={{-14,-14},{14,14}},
                rotation=90,
                origin={0,102})));
          Modelica.Blocks.Interfaces.RealInput vrel[3]
          "relative velocities of the anticipated contact points"
            annotation (Placement(transformation(extent={{-120,40},{-80,80}})));
          Modelica.Blocks.Interfaces.RealInput prel[3] "relative position"
            annotation (Placement(transformation(extent={{-20,-20},{20,20}},
                rotation=270,
                origin={60,100})));
          Modelica.Blocks.Interfaces.BooleanOutput contact
            annotation (Placement(transformation(extent={{96,-12},{116,8}})));
         Real muex;
         Real muez;
        //The v-variables contain the components of the relative velocity v2-v1 in the frame of the plane.
        //The p-variables contain the components of the relative position p1-p2 of the anticipated contact points.
        //The f-variables are the absolute values of the force in their respective directions.
      protected
        Real vx;
        Real vy;
        Real vz;
        Real px;
        Real py;
        Real pz;
        Real fn;
        Real ftx;
        Real ftz;
        Real f_n[3];
        Real f_tx[3];
        Real f_tz[3];

        equation
        //mue-values for the respective directions
        muex=gamma1*(tanh(gamma2*vx) - tanh(gamma3*vx)) + gamma4*tanh(gamma5*vx) + gamma6*vx;
        muez=gamma1*(tanh(gamma2*vz) - tanh(gamma3*vz)) + gamma4*tanh(gamma5*vz) + gamma6*vz;

        px=prel[1];
        py=prel[2];
        pz=prel[3];
        vx=vrel[1];
        vy=vrel[2];
        vz=vrel[3];
        //contact specification
        contact= (py<=0) and (abs(px)<1e-6) and (abs(pz)<1e-6) and (abs(py)<t_max);
        if (contact) then
        //force calculation
          fn= -sign(py)*(c*abs(py)^n1) + d*abs(py)^n2*vy;
          ftx=muex*fn;
          ftz=muez*fn;
          f_n=fn*{0,1,0};
          f_tx=ftx*{1,0,0};
          f_tz=ftz*{0,0,1};
        else
          fn=0;
          ftx=0;
          ftz=0;
          f_n=zeros(3);
          f_tx=zeros(3);
          f_tz=zeros(3);
        end if;
        //total force
        force.force=f_n+f_tx+f_tz;
          connect(force.frame_a, frame_a1) annotation (Line(
              points={{-36,70},{-60,70},{-60,100}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(frame_a2, force.frame_b) annotation (Line(
              points={{1.77636e-015,102},{1.77636e-015,70},{-24,70}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          annotation (Diagram(graphics), Icon(graphics));
        end ForceConvexToPlane;

        package CalculationsConvexSurfaces
        "Collection of necessary calculation functions to determine the contact between two arbitrary convex surfaces"
          extends Modelica.Icons.BasesPackage;

          model FindMinimum

            Modelica.Blocks.Interfaces.RealOutput y[4,1]( start=zeros(4,1))
              annotation (Placement(transformation(extent={{174,74},{194,94}}), iconTransformation(extent={{168,-20},{200,12}})));

            Modelica.Blocks.Interfaces.RealInput x0[4,1]
              annotation (Placement(transformation(extent={{-20,-20},{20,20}},
                  rotation=0,
                  origin={-102,46}), iconTransformation(
                  extent={{-20,-20},{20,20}},
                  rotation=0,
                  origin={-104,16})));

        protected
            Real rc1[3,1];
            Real rc2[3,1];
            Real scaling=100000; //scaling
            IdealizedContact.ContactSurfaces.Types.ContactShapeType c1;
            IdealizedContact.ContactSurfaces.Types.ContactShapeType c2;

        public
            Modelica.Blocks.Interfaces.RealInput h1[3]
              annotation (Placement(transformation(extent={{-20,-20},{20,20}},
                  rotation=0,
                  origin={-100,-66}), iconTransformation(extent={{-124,64},{-84,104}}, rotation=0)));
            Modelica.Blocks.Interfaces.RealInput h2[3]
              annotation (Placement(transformation(extent={{-20,-20},{20,20}},
                  rotation=0,
                  origin={-100,-100}), iconTransformation(
                  extent={{-20,-20},{20,20}},
                  rotation=0,
                  origin={-104,-58})));
            Modelica.Mechanics.MultiBody.Interfaces.Frame_a a1
              annotation (Placement(transformation(extent={{-16,-16},{16,16}},
                  rotation=90,
                  origin={48,100}), iconTransformation(
                  extent={{-16,-16},{16,16}},
                  rotation=90,
                  origin={48,100})));
            Modelica.Mechanics.MultiBody.Interfaces.Frame_a a2
              annotation (Placement(transformation(extent={{-16,-16},{16,16}},
                  rotation=90,
                  origin={26,-182}), iconTransformation(
                  extent={{-16,-16},{16,16}},
                  rotation=90,
                  origin={34,-182})));
            Modelica.Blocks.Interfaces.RealOutput distance
              annotation (Placement(transformation(extent={{-10,-10},{10,10}},
                  rotation=0,
                  origin={180,50}), iconTransformation(
                  extent={{-17,-17},{17,17}},
                  rotation=0,
                  origin={185,-153})));
            Modelica.Blocks.Interfaces.RealOutput A1[3,3]
              annotation (Placement(transformation(extent={{-10,-10},{10,10}},
                  rotation=0,
                  origin={190,-70}), iconTransformation(
                  extent={{-16,-16},{16,16}},
                  rotation=0,
                  origin={184,-76})));
            Modelica.Blocks.Interfaces.RealOutput A2[3,3]
              annotation (Placement(transformation(extent={{-10,-10},{10,10}},
                  rotation=0,
                  origin={190,-86}), iconTransformation(
                  extent={{-17,-17},{17,17}},
                  rotation=0,
                  origin={185,-115})));
            Modelica.Blocks.Interfaces.RealOutput rc_1[3]
              annotation (Placement(transformation(extent={{-10,-10},{10,10}},
                  rotation=0,
                  origin={180,16}), iconTransformation(
                  extent={{-20,-20},{20,20}},
                  rotation=0,
                  origin={188,76})));
            Modelica.Blocks.Interfaces.RealOutput rc_2[3]
              annotation (Placement(transformation(extent={{-10,-10},{10,10}},
                  rotation=0,
                  origin={182,-14}), iconTransformation(
                  extent={{-16,-16},{16,16}},
                  rotation=0,
                  origin={184,32})));
            Modelica.Blocks.Interfaces.RealOutput normal_basis_trf[3,3] annotation (
                Placement(transformation(
                  extent={{-10,-10},{10,10}},
                  rotation=0,
                  origin={190,-130}), iconTransformation(
                  extent={{-17,-17},{17,17}},
                  rotation=0,
                  origin={185,-41})));
            IdealizedContact.Interfaces.ShapeTypeInput surfaceType1 annotation (Placement(
                  transformation(extent={{-124,-156},{-84,-116}}), iconTransformation(
                    extent={{-124,-156},{-84,-116}})));
            IdealizedContact.Interfaces.ShapeTypeInput surfaceType2 annotation (Placement(
                  transformation(extent={{-124,-194},{-84,-154}}), iconTransformation(
                    extent={{-124,-194},{-84,-154}})));
          equation
          //The frame input is used to get the body frame coordinates of the two ellipsoids and store
          //them into 3x1 matrices so that matrix algebra can be used.
             c1=surfaceType1;
             c2=surfaceType2;
             rc1[1,1]= a1.r_0[1];
             rc1[2,1]= a1.r_0[2];
             rc1[3,1]= a1.r_0[3];

             rc2[1,1]= a2.r_0[1];
             rc2[2,1]= a2.r_0[2];
             rc2[3,1]= a2.r_0[3];
          //The same coordinates are also stored into 3-slot-arrays
          rc_1= a1.r_0;
          rc_2= a2.r_0;
          //The matrices A1 and A2 are the transformation matrices of the first and second ellipsoid orientation with respect to
          //the inertial frame of reference. The data stored in the frame (ex:"a1.R.T") is the transformation matrix of the basis.
          //Because in a n-dimensional flat and ortho-normal vector-space, the coordinates written as a nx1-matrix (as usual)
          //transform contravariant: the opposite direction of the basis transformation. This is the reason of the transposition of
          //the frame-data.
             A1= transpose(a1.R.T);
             A2= transpose(a2.R.T);
          //enforce equilibrium
             a1.f = zeros(3);
             a1.t = zeros(3);
             a2.f = zeros(3);
             a2.t = zeros(3);
           //center of the model: the call of the search function:
           //The input values are the body-frame-coordinates, the transformation matrix, the parameters of the ellipsoid and
           //the starting value. The starting value is fed back so that in a continuous simulation this algorithm
           //gets a good starting value in each following time step
           //The body frame coordinates and the ellipsoid parameters are scaled so that there are always enough decimal
           //spaces during the calculation;
            y =searchMinimum(
                      c1,
                      c2,
                      scaling*rc1,
                      scaling*rc2,
                      A1,
                      A2,
                      scaling*h1,
                      scaling*h2,
                      x0,scaling);
          //As soon as the minimum values for the ellipsoid variables are calculated, the least distance
          //itself can be calculated. The distance between the anticipated contact points is used
          //in the contact specification.
            distance =
              IdealizedContact.ContactBlock.PunctiformContact.Components.CalculationsConvexSurfaces.distance(
                    c1,
                    c2,
                    rc1,
                    rc2,
                    h1,
                    h2,
                    A1,
                    A2,
                    y);
          //Because the calculation of the force is done component-wise and the formulas correspond to components
          //in an ortho-normal basis, an ortho-normal coordinate system has to be generated at the anticipated contact
          //point. one direction of this coordinate system is perpendicular to the surface of the ellipsoid
          //and because it is a ortho-normal coordinate system, the other axes are tangential to the surface.
            normal_basis_trf =
              IdealizedContact.ContactBlock.PunctiformContact.Components.CalculationsConvexSurfaces.normalBasis(
                    c2,
                    y[3,1],
                    y[4,1],
                    A2,
                    h2);
          annotation (Diagram(coordinateSystem(extent={{-100,-180},{180,100}}, preserveAspectRatio=false),
                              graphics), Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                    -180},{180,100}}),                                                                                     graphics),
              Documentation(info="<!DOCTYPE html><html>
<p>This&nbsp;model&nbsp;routes&nbsp;the&nbsp;necessary&nbsp;signals&nbsp;into&nbsp;one&nbsp;block&nbsp;to&nbsp;call&nbsp;the&nbsp;search&nbsp;function.</p>
<p>It&nbsp;also&nbsp;generates&nbsp;an&nbsp;output&nbsp;value&nbsp;for&nbsp;the&nbsp;distance&nbsp;of&nbsp;the&nbsp;anticipated&nbsp;contact&nbsp;points,</p>
<p>as&nbsp;well&nbsp;as&nbsp;the&nbsp;continuous&nbsp;basis&nbsp;transformation&nbsp;matrix&nbsp;which&nbsp;of&nbsp;course&nbsp;is&nbsp;an&nbsp;orthonormal</p>
<p>basis&nbsp;with&nbsp;one&nbsp;direction&nbsp;perpendicular&nbsp;to&nbsp;the&nbsp;surfaces&nbsp;at&nbsp;the&nbsp;anticipated&nbsp;contact&nbsp;points.</p>
</html>"));
          end FindMinimum;

          model R0
            //This model calculates the coordinates of the contact point of the convex surface
          //with respect to the first ellpsoid's coordinate system.
          //The outputs are the vector itself and its length so that
          //the prismatic block can be used.
          //   Modelica.Blocks.Interfaces.RealInput x[4,1]
          //     annotation (Placement(transformation(extent={{-20,-20},{20,20}},
          //         rotation=0,
          //         origin={-100,-100})));
            Modelica.Blocks.Interfaces.RealInput angles[2]
              annotation (Placement(transformation(extent={{-20,-20},{20,20}},
                  rotation=0,
                  origin={-100,-100})));
            Modelica.Blocks.Interfaces.RealOutput out[3]
              annotation (Placement(transformation(extent={{100,60},{120,80}})));
            Modelica.Blocks.Interfaces.RealOutput z
              annotation (Placement(transformation(extent={{100,-80},{120,-60}})));
            Modelica.Blocks.Interfaces.RealInput h[3]
              annotation (Placement(transformation(extent={{-20,-20},{20,20}},
                  rotation=270,
                  origin={-100,100}), iconTransformation(extent={{-118,62},{-78,102}}, rotation=0)));
        protected
            Real phi;
            Real theta;
            Real y[3,1];
        public
            IdealizedContact.Interfaces.ShapeTypeInput shapeType
              annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));
          algorithm
          //   k:=x[1, 1];
          //   l:=x[2, 1];
            phi:=angles[1];
            theta:=angles[2];
            y :=IdealizedContact.ContactSurfaces.ParametricSurfaceDefinition.parametricSurfaceWrapper(
              shapeType,
              h,
              phi,
              theta);
          out[1]:=y[1, 1];
          out[2]:=y[2, 1];
          out[3]:=y[3, 1];
          z:=sqrt(out[1]^2+out[2]^2+out[3]^2);
            annotation (Diagram(graphics),
            Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics),
            Documentation(info="<!DOCTYPE html><html>
<p>This&nbsp;model&nbsp;calculates&nbsp;the&nbsp;coordinates&nbsp;of&nbsp;the&nbsp;contact&nbsp;point&nbsp;of&nbsp;the&nbsp;first convex with&nbsp;respect&nbsp;to&nbsp;the&nbsp;body&nbsp;coordinate&nbsp;system.</p>
<p>The&nbsp;outputs&nbsp;are&nbsp;the&nbsp;vector&nbsp;itself&nbsp;and&nbsp;it&apos;s&nbsp;length&nbsp;so&nbsp;that the&nbsp;prismatic&nbsp;block&nbsp;can&nbsp;be&nbsp;used.</p>
</html>"));
          end R0;

          model RelativeVelocities

            Modelica.Blocks.Interfaces.RealInput omega_1[3] annotation (Placement(
                  transformation(
                  extent={{-20,-20},{20,20}},
                  rotation=270,
                  origin={-48,102})));
            Modelica.Blocks.Interfaces.RealInput ymin[4,1]  annotation (Placement(
                  transformation(
                  extent={{-20,-20},{20,20}},
                  rotation=180,
                  origin={100,46})));
            Modelica.Blocks.Interfaces.RealInput h1[3]      annotation (Placement(
                  transformation(
                  extent={{-20,-20},{20,20}},
                  rotation=0,
                  origin={-100,66}), iconTransformation(extent={{-120,52},{-80,
                    92}})));
            Modelica.Blocks.Interfaces.RealOutput vrel[3]
              annotation (Placement(transformation(extent={{-21,-21},{21,21}},
                  rotation=90,
                  origin={51,101})));
            Modelica.Blocks.Interfaces.RealInput A1[3,3]    annotation (Placement(
                  transformation(
                  extent={{-20,-20},{20,20}},
                  rotation=90,
                  origin={16,-100})));
        protected
            Real omega_1_vec[3,1];
            Real omega_2_vec[3,1];
            Real vu1[3,1];
            Real vu2[3,1];
            Real vu_1[3];
            Real vu_2[3];
            Real rk1[3,1];
            Real rk2[3,1];
            Real vc1[3];
            Real vc2[3];
            IdealizedContact.ContactSurfaces.Types.ContactShapeType c1;
            IdealizedContact.ContactSurfaces.Types.ContactShapeType c2;
        public
            Modelica.Blocks.Interfaces.RealInput A2[3,3]    annotation (Placement(
                  transformation(
                  extent={{-20,-20},{20,20}},
                  rotation=90,
                  origin={56,-100})));
            Modelica.Blocks.Interfaces.RealInput omega_2[3] annotation (Placement(
                  transformation(
                  extent={{-20,-20},{20,20}},
                  rotation=90,
                  origin={-46,-100})));
            Modelica.Blocks.Interfaces.RealInput h2[3]      annotation (Placement(
                  transformation(
                  extent={{-20,-20},{20,20}},
                  rotation=0,
                  origin={-100,-68}), iconTransformation(extent={{-120,-92},{
                    -80,-52}})));
            Modelica.Blocks.Interfaces.RealInput rc1[3]     annotation (Placement(
                  transformation(
                  extent={{-20,-20},{20,20}},
                  rotation=180,
                  origin={100,-4})));
            Modelica.Blocks.Interfaces.RealInput rc2[3]     annotation (Placement(
                  transformation(
                  extent={{-20,-20},{20,20}},
                  rotation=180,
                  origin={100,-58})));
            IdealizedContact.Interfaces.ShapeTypeInput surfaceType1
              annotation (Placement(transformation(extent={{-120,4},{-80,44}}),
                iconTransformation(extent={{-120,4},{-80,44}})));
            IdealizedContact.Interfaces.ShapeTypeInput surfaceType2
              annotation (Placement(transformation(extent={{-120,-42},{-80,-2}}),
                iconTransformation(extent={{-120,-42},{-80,-2}})));
          algorithm
            c1:=surfaceType1;
            c2:=surfaceType2;
            omega_1_vec[1,1]:=omega_1[1];
            omega_1_vec[2,1]:=omega_1[2];
            omega_1_vec[3,1]:=omega_1[3];
            rk1 :=IdealizedContact.ContactSurfaces.ParametricSurfaceDefinition.parametricSurfaceWrapper(
              c1,
              h1,
              ymin[1, 1],
              ymin[2, 1]);
            vu1 := crossproduct(omega_1_vec, rk1);
            vu1:=A1*vu1;
            vu_1[1]:=vu1[1, 1];
            vu_1[2]:=vu1[2, 1];
            vu_1[3]:=vu1[3, 1];
            omega_2_vec[1,1]:=omega_2[1];
            omega_2_vec[2,1]:=omega_2[2];
            omega_2_vec[3,1]:=omega_2[3];
            rk2 :=IdealizedContact.ContactSurfaces.ParametricSurfaceDefinition.parametricSurfaceWrapper(
              c2,
              h2,
              ymin[3, 1],
              ymin[4, 1]);
            vu2 := crossproduct(omega_2_vec, rk2);
            vu2:=A2*vu2;
            vu_2[1]:=vu2[1, 1];
            vu_2[2]:=vu2[2, 1];
            vu_2[3]:=vu2[3, 1];
            vc1:=der(rc1);
            vc2:=der(rc2);
            vrel:=vc2-vc1+vu_2 - vu_1;

            annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                    -100},{100,100}}),
                                graphics), Icon(coordinateSystem(
                  preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
                graphics),
              Documentation(info="<!DOCTYPE html><html>
<p>This&nbsp;model&nbsp;calculates&nbsp;the&nbsp;relative&nbsp;velocity&nbsp;between&nbsp;the&nbsp;anticipated&nbsp;contact&nbsp;points with&nbsp;respect&nbsp;to&nbsp;the&nbsp;contact&nbsp;point&nbsp;on&nbsp;the&nbsp;second&nbsp;ellipsoid&nbsp;(v2-v1).</p>
</html>"));
          end RelativeVelocities;

          function searchMinimum
             //This function calls the Newton solver and tries it with different starting values until
            //a real minimum is found (pd check)
            //If a minimum is found the results are transformed into the range of 0 and 2*pi
          input IdealizedContact.ContactSurfaces.Types.ContactShapeType contactSurfaceType1;
          input IdealizedContact.ContactSurfaces.Types.ContactShapeType contactSurfaceType2;
          input Real rc1[3,1] "position vector of the center of surface 1";
          input Real rc2[3,1] "position vector of the center of surface 2";
          input Real A1[3,3] "transformation matrix BCS1";
          input Real A2[3,3] "transformation matrix BCS2";
          input Real h1[3] "semi axes surface 1";
          input Real h2[3] "semi axes surface 2";
          input Real x0[4,1] "starting values for the iteration";
          input Real scalingFactor "applied scaling factor";
          output Real y[4,1];
        protected
            Real pi = Modelica.Constants.pi;
            Real xi[4,1];
            Real t;
            Real xn[4,1];
            Real dev=min(min(h1),min(h2))/(10*scalingFactor)
            "deviation of starting value if the given starting value doesn't result in a minimum";
          algorithm
          xi:=x0;
            xn :=newtonAlgorithm(
              contactSurfaceType1,
              contactSurfaceType2,
              rc1,
              rc2,
              A1,
              A2,
              h1,
              h2,
              xi);
          t:=1;
            while not checkPositiveDefiniteHessian(
                contactSurfaceType1,
                contactSurfaceType2,
                rc1,
                rc2,
                A1,
                A2,
                h1,
                h2,
                xn) and t<1000 loop
          //     xi[1,1]:=x0[1, 1] +0.01*t*cos(2*pi*0.01*t)*sin(2*pi*0.01*t)*sin(2*pi*0.01*t);
          //     xi[2,1]:=x0[2, 1]+0.01*t*sin(2*pi*0.01*t)*sin(2*pi*0.01*t)*sin(2*pi*0.01*t);
          //     xi[3,1]:=x0[3, 1] +0.01*t*cos(2*pi*0.01*t)*sin(2*pi*0.01*t);
          //     xi[4,1]:=x0[4, 1] +0.01*t*cos(2*pi*0.01*t);
          //     Modelica.Utilities.Streams.print("dev_= " + String(dev_) + " h1[1]= "+String(h1[1])+ " h1[2]= "+String(h1[2])+ " h1[3]= "+String(h1[3])+ " h2[1]= "+String(h2[1])+ " h2[2]= "+String(h2[2])+ " h2[3]= "+String(h2[3]));
          //     Modelica.Utilities.Streams.print("No minimum. Deviating starting value. Iteration No.: " + String(t) + " dev=" + String(dev));
              xi[1,1]:=x0[1, 1] + dev*t*cos(2*pi*dev*t)*sin(2*pi*dev*t)*sin(2*pi*dev*t);
              xi[2,1]:=x0[2, 1] + dev*t*sin(2*pi*dev*t)*sin(2*pi*dev*t)*sin(2*pi*dev*t);
              xi[3,1]:=x0[3, 1] + dev*t*cos(2*pi*dev*t)*sin(2*pi*dev*t);
              xi[4,1]:=x0[4, 1] + dev*t*cos(2*pi*dev*t);
              xn :=newtonAlgorithm(
                contactSurfaceType1,
                contactSurfaceType2,
                rc1,
                rc2,
                A1,
                A2,
                h1,
                h2,
                xi);
              t:=t + 1;
          end while;

          while abs(xn[1, 1]) > 2*pi or xn[1,
                1] < 0 loop
            if xn[1,1]>0 then
              xn[1,1]:=xn[1,1] - 2*pi;
            else
              xn[1,1]:=xn[1,1] + 2*pi;
            end if;
          end while;

          if contactSurfaceType1=="cylindrical" then
             while abs(xn[2,1])>0.5 loop
                xn[2,1]:=sign(xn[2, 1])*0.5;
             end while;
          else
            while abs(xn[2, 1]) > 2*pi or xn[2,1] < 0 loop
                if xn[2,1]>0 then
                    xn[2,1]:=xn[2,1] - 2*pi;
                else
                    xn[2,1]:=xn[2,1] + 2*pi;
                end if;
            end while;
          end if;

          while abs(xn[3, 1]) > 2*pi or xn[3,1] < 0 loop
            if xn[3,1]>0 then
              xn[3,1]:=xn[3,1] - 2*pi;
            else
              xn[3,1]:=xn[3,1] + 2*pi;
            end if;
          end while;

          if contactSurfaceType2=="cylindrical" then
            while abs(xn[4,1])>0.5 loop
                xn[4,1]:=sign(xn[4, 1])*0.5;
            end while;
          else
            while abs(xn[4, 1]) > 2*pi or xn[4,1] < 0 loop
              if xn[4,1]>0 then
                    xn[4,1]:=xn[4,1] - 2*pi;
              else
                  xn[4,1]:=xn[4,1] + 2*pi;
              end if;
            end while;
          end if;
          y:=xn;

            annotation (Documentation(info="<!DOCTYPE html><html>
<p>This&nbsp;function&nbsp;calls&nbsp;the&nbsp;Newton&nbsp;solver&nbsp;and&nbsp;tries&nbsp;it&nbsp;with&nbsp;different&nbsp;starting&nbsp;values&nbsp;until a&nbsp;real&nbsp;minimum&nbsp;is&nbsp;found&nbsp;(check of positive definite hessian).</p>
<p>If&nbsp;a&nbsp;minimum&nbsp;is&nbsp;found&nbsp;the&nbsp;results&nbsp;are&nbsp;transformed&nbsp;into&nbsp;the&nbsp;range&nbsp;of&nbsp;0&nbsp;and&nbsp;2*pi.</p>
</html>"));
          end searchMinimum;

          function newtonAlgorithm

          input IdealizedContact.ContactSurfaces.Types.ContactShapeType contactSurfaceType1;
          input IdealizedContact.ContactSurfaces.Types.ContactShapeType contactSurfaceType2;
          input Real rc1[3,1];
          input Real rc2[3,1];
          input Real A1[3,3] "transformation matrix BCS1";
          input Real A2[3,3] "transformation matrix BCS2";
          input Real h1[3] "semi axes surface 1";
          input Real h2[3] "semi axes surface 2";
          input Real x0[4,1] "start values for the angles";
          output Real y[4,1];
        protected
            Real xn[4,1];
            Real xn1[4,1];
            Real Delta[4,1];
            Real delta;
          algorithm
            xn:=x0;
            xn1 :=xn - Modelica.Math.Matrices.inv(hessian(
                      contactSurfaceType1,
                      contactSurfaceType2,
                      rc1,
                      rc2,
                      A1,
                      A2,
                      h1,
                      h2,
                      xn))*gradient(
                      contactSurfaceType1,
                      contactSurfaceType2,
                      rc1,
                      rc2,
                      A1,
                      A2,
                      h1,
                      h2,
                      xn);
              Delta:=xn1 - xn;
            delta :=absoluteValue(Delta);
              xn:=xn1;
              while delta >1e-10 loop
              xn1 :=xn - Modelica.Math.Matrices.inv(hessian(
                        contactSurfaceType1,
                        contactSurfaceType2,
                        rc1,
                        rc2,
                        A1,
                        A2,
                        h1,
                        h2,
                        xn))*gradient(
                        contactSurfaceType1,
                        contactSurfaceType2,
                        rc1,
                        rc2,
                        A1,
                        A2,
                        h1,
                        h2,
                        xn);
              Delta:=xn1 - xn;
              delta :=absoluteValue(Delta);
              xn:=xn1;
              end while;
              y:=xn;

            annotation (Documentation(info="<!DOCTYPE html><html>
<p>Performs multivariable&nbsp;Newton&nbsp;Algorithm</p>
</html>"));
          end newtonAlgorithm;

          function differenceVector
          input IdealizedContact.ContactSurfaces.Types.ContactShapeType contactSurfaceType1;
          input IdealizedContact.ContactSurfaces.Types.ContactShapeType contactSurfaceType2;
          input Real rc1[3,1];
          input Real rc2[3,1];
          input Real A1[3,3] "transformation matrix BCS1";
          input Real A2[3,3] "transformation matrix BCS2";
          input Real h1[3] "semi axes surface 1";
          input Real h2[3] "semi axes surface 2";
          input Real phi1 "polar angle 1";
          input Real theta1 "azimuthal angle 1";
          input Real phi2 "polar angle 2";
          input Real theta2 "azimuthal angle 2";
          output Real y[3,1];
        protected
            Real hv1[3,1];
            Real hv2[3,1];
          algorithm
            hv1 :=IdealizedContact.ContactSurfaces.ParametricSurfaceDefinition.parametricSurfaceWrapper(
              contactSurfaceType1,
              h1,
              phi1,
              theta1);
            hv2 :=IdealizedContact.ContactSurfaces.ParametricSurfaceDefinition.parametricSurfaceWrapper(
              contactSurfaceType2,
              h2,
              phi2,
              theta2);
          y:=rc2 - rc1 + A2*hv2 - A1*hv1;

            annotation (Documentation(info="<!DOCTYPE html><html>
<p>This&nbsp;function&nbsp;calculates&nbsp;the&nbsp;components&nbsp;of&nbsp;the&nbsp;difference&nbsp;vector&nbsp;between&nbsp;the&nbsp;anticipated&nbsp;contact&nbsp;points&nbsp;with respect&nbsp;to&nbsp;the&nbsp;inertial&nbsp;frame&nbsp;of&nbsp;reference. The&nbsp;coordinates&nbsp;of&nbsp;body&nbsp;coordinate&nbsp;frames&nbsp;are&nbsp;given&nbsp;in&nbsp;the&nbsp;inertial&nbsp;frame&nbsp;of&nbsp;reference. The&nbsp;coordinates&nbsp;calculated&nbsp;with&nbsp;the&nbsp;r0-function&nbsp;have&nbsp;to&nbsp;be&nbsp;transformed&nbsp;into&nbsp;the&nbsp;inertial&nbsp;frame&nbsp;of&nbsp;reference, before&nbsp;they&nbsp;can&nbsp;be&nbsp;compared&nbsp;with&nbsp;the&nbsp;body-frame&nbsp;coordinates.</p>
</html>"));
          end differenceVector;

          function gradient

          input IdealizedContact.ContactSurfaces.Types.ContactShapeType contactSurfaceType1;
          input IdealizedContact.ContactSurfaces.Types.ContactShapeType contactSurfaceType2;
          input Real rc1[3,1];
          input Real rc2[3,1];
          input Real A1[3,3] "transformation matrix BCS1";
          input Real A2[3,3] "transformation matrix BCS2";
          input Real h1[3] "semi axes surface 1";
          input Real h2[3] "semi axes surface 2";
          input Real phi[4,1] "angles";
          output Real y[4,1];
        protected
            Real phi1;
            Real theta1;
            Real phi2;
            Real theta2;
            Real d[3,1] "difference vector";
            Real hrk1[3,1];
            Real hrk2[3,1];
            Real hrl1[3,1];
            Real hrl2[3,1];
            Real g[1,1];
          algorithm
          phi1:=phi[1, 1];
          theta1:=phi[2, 1];
          phi2:=phi[3, 1];
          theta2:=phi[4, 1];
            d :=differenceVector(contactSurfaceType1, contactSurfaceType2, rc1, rc2, A1, A2, h1, h2, phi1, theta1, phi2,theta2);
          //   hrk1 := -dr1(
          //           c1,
          //           1,
          //           A1,
          //           h1,
          //           phi1,
          //           theta1);
          //   hrk2 := -dr1(
          //           c1,
          //           2,
          //           A1,
          //           h1,
          //           phi1,
          //           theta1);
          //   hrl1 := dr1(
          //           c2,
          //           1,
          //           A2,
          //           h2,
          //           phi2,
          //           theta2);
          //   hrl2 := dr1(
          //           c2,
          //           2,
          //           A2,
          //           h2,
          //           phi2,
          //           theta2);

          //transform the coordinates of the first partial derivatives into the inertial frame of reference
            hrk1 := A1*(-IdealizedContact.ContactSurfaces.ParametricSurfaceDefinition.FirstPartialDerivatives.firstPartialDerivativesWrapper(contactSurfaceType1,1,h1,phi1,theta1));
            hrk2 := A1* (-IdealizedContact.ContactSurfaces.ParametricSurfaceDefinition.FirstPartialDerivatives.firstPartialDerivativesWrapper(contactSurfaceType1,2,h1,phi1,theta1));
            hrl1 := A2*IdealizedContact.ContactSurfaces.ParametricSurfaceDefinition.FirstPartialDerivatives.firstPartialDerivativesWrapper(contactSurfaceType2,1,h2,phi2,theta2);
            hrl2 := A2*IdealizedContact.ContactSurfaces.ParametricSurfaceDefinition.FirstPartialDerivatives.firstPartialDerivativesWrapper(contactSurfaceType2,2,h2,phi2,theta2);
              g:=transpose(d)*hrk1;
              y[1,1]:=g[1, 1];
              g:=transpose(d)*hrk2;
              y[2,1]:=g[1, 1];
              g:=transpose(d)*hrl1;
              y[3,1]:=g[1, 1];
              g:=transpose(d)*hrl2;
              y[4,1]:=g[1, 1];
              y:=2*y;

            annotation (Documentation(info="<!DOCTYPE html><html>
<p>This&nbsp;function&nbsp;calculates&nbsp;the&nbsp;gradient&nbsp;of&nbsp;the&nbsp;difference&nbsp;function&nbsp;which&nbsp;is&nbsp;a&nbsp;function&nbsp;of&nbsp;the&nbsp;4&nbsp;variables&nbsp;describing the&nbsp;respective&nbsp;surfaces. This&nbsp;gradient&nbsp;is&nbsp;put&nbsp;together&nbsp;from&nbsp;the&nbsp;difference&nbsp;functions&nbsp;and&nbsp;the&nbsp;first derivatives&nbsp;through&nbsp;matrix&nbsp;algebra,&nbsp;without&nbsp;calculating&nbsp;each&nbsp;component&nbsp;individually.</p>
</html>"));
          end gradient;

          function hessian

          input IdealizedContact.ContactSurfaces.Types.ContactShapeType contactSurfaceType1;
          input IdealizedContact.ContactSurfaces.Types.ContactShapeType contactSurfaceType2;
          input Real rc1[3,1];
          input Real rc2[3,1];
          input Real A1[3,3] "transformation matrix BCS1";
          input Real A2[3,3] "transformation matrix BCS2";
          input Real h1[3] "semi axes surface 1";
          input Real h2[3] "semi axes surface 2";
          input Real phi[4,1] "angles";
          output Real y[4,4];
        protected
            Real k1;
            Real k2;
            Real l1;
            Real l2;
            Real a[3,1];
            Real hrk1[3,1];
            Real hrk2[3,1];
            Real hrl1[3,1];
            Real hrl2[3,1];
            Real hrk1k1[3,1];
            Real hrk2k2[3,1];
            Real hrl1l1[3,1];
            Real hrl2l2[3,1];
            Real hrk1k2[3,1];
            Real hrl1l2[3,1];
            Real hv[4,4];
            Real g[1,1];
          algorithm
          k1:=phi[1, 1];
          k2:=phi[2, 1];
          l1:=phi[3, 1];
          l2:=phi[4, 1];
            a :=differenceVector( contactSurfaceType1,contactSurfaceType2,rc1, rc2, A1, A2, h1, h2, k1, k2, l1,  l2);
          //   hrk1 := -dr1(c1, 1, A1, h1, k1, k2);
          //   hrk2 := -dr1(c1, 2, A1, h1, k1, k2);
          //   hrl1 := dr1( c2, 1, A2, h2, l1, l2);
          //   hrl2 := dr1( c2, 2, A2, h2, l1, l2);
          //
          //   hrk1k1 := -dr2(c1,1,1, A1, h1, k1, k2);
          //   hrk2k2 := -dr2(c1,2,2, A1, h1, k1, k2);
          //   hrl1l1 := dr2(c2,1,1,  A2, h2, l1, l2);
          //   hrl2l2 := dr2(c2,2, 2, A2, h2, l1, l2);
          //
          //   hrk1k2 := -dr2(c1,1, 2, A1,h1, k1,k2);
          //   hrl1l2 := dr2(c2,1, 2,  A2,h2, l1,l2);

            //first derivative and transformation into the inertial frame of reference
            hrk1 := A1*(-IdealizedContact.ContactSurfaces.ParametricSurfaceDefinition.FirstPartialDerivatives.firstPartialDerivativesWrapper(contactSurfaceType1, 1, h1, k1, k2));
            hrk2 := A1*(-IdealizedContact.ContactSurfaces.ParametricSurfaceDefinition.FirstPartialDerivatives.firstPartialDerivativesWrapper(contactSurfaceType1, 2, h1, k1, k2));
            hrl1 := A2*IdealizedContact.ContactSurfaces.ParametricSurfaceDefinition.FirstPartialDerivatives.firstPartialDerivativesWrapper(contactSurfaceType2, 1,  h2, l1, l2);
            hrl2 := A2*IdealizedContact.ContactSurfaces.ParametricSurfaceDefinition.FirstPartialDerivatives.firstPartialDerivativesWrapper(contactSurfaceType2, 2,  h2, l1, l2);

            //second derivative and transformation into the inertial frame of reference
            hrk1k1 := A1*(-IdealizedContact.ContactSurfaces.ParametricSurfaceDefinition.SecondPartialDerivatives.secondPartialDerivativesWrapper(contactSurfaceType1,1,1, h1, k1, k2));
            hrk2k2 := A1*(-IdealizedContact.ContactSurfaces.ParametricSurfaceDefinition.SecondPartialDerivatives.secondPartialDerivativesWrapper(contactSurfaceType1,2,2, h1, k1, k2));
            hrl1l1 := A2*IdealizedContact.ContactSurfaces.ParametricSurfaceDefinition.SecondPartialDerivatives.secondPartialDerivativesWrapper(contactSurfaceType2,1,1, h2, l1, l2);
            hrl2l2 := A2*IdealizedContact.ContactSurfaces.ParametricSurfaceDefinition.SecondPartialDerivatives.secondPartialDerivativesWrapper(contactSurfaceType2,2, 2, h2, l1, l2);

            hrk1k2 := A1*(-IdealizedContact.ContactSurfaces.ParametricSurfaceDefinition.SecondPartialDerivatives.secondPartialDerivativesWrapper(contactSurfaceType1,1, 2, h1, k1,k2));
            hrl1l2 := A2*IdealizedContact.ContactSurfaces.ParametricSurfaceDefinition.SecondPartialDerivatives.secondPartialDerivativesWrapper(contactSurfaceType2,1, 2, h2, l1,l2);

              g:=transpose(hrk1)*hrk1 + transpose(a)*hrk1k1;
              hv[1,1]:=g[1, 1];
              g:=transpose(hrk2)*hrk2 + transpose(a)*hrk2k2;
              hv[2,2]:=g[1, 1];
              g:=transpose(hrl1)*hrl1 + transpose(a)*hrl1l1;
              hv[3,3]:=g[1, 1];
              g:=transpose(hrl2)*hrl2 + transpose(a)*hrl2l2;
              hv[4,4]:=g[1, 1];
              g:=transpose(hrk2)*hrk1 + transpose(a)*hrk1k2;
              hv[1,2]:=g[1, 1];
              g:=transpose(hrl1)*hrk1;
              hv[1,3]:=g[1, 1];
              g:=transpose(hrl2)*hrk1;
              hv[1,4]:=g[1, 1];
              g:=transpose(hrl1)*hrk2;
              hv[2,3]:=g[1, 1];
              g:=transpose(hrl2)*hrk2;
              hv[2,4]:=g[1, 1];
              g:=transpose(hrl2)*hrl1 + transpose(a)*hrl1l2;
              hv[3,4]:=g[1, 1];
              hv[2,1]:=hv[1, 2];
              hv[3,1]:=hv[1, 3];
              hv[3,2]:=hv[2, 3];
              hv[4,1]:=hv[1, 4];
              hv[4,2]:=hv[2, 4];
              hv[4,3]:=hv[3, 4];
              hv:=2*hv;
              //Because numerical calculations of linear systems of equations become more unstable
              //with the system matrix approaching singularity, a not positive definite matrix
              //is generated when the hessian matrix' determinant approaches zero.
          if Modelica.Math.Matrices.det(hv)<1e-6 and Modelica.Math.Matrices.det(hv)>-1e-6 then
            y[1,1]:=-1;
            y[2,2]:=-1;
            y[3,3]:=-1;
            y[4,4]:=-1;
            y[1,2]:=0;
            y[1,3]:=0;
            y[1,4]:=0;
            y[2,1]:=0;
            y[2,3]:=0;
            y[2,4]:=0;
            y[3,1]:=0;
            y[3,2]:=0;
            y[3,4]:=0;
            y[4,1]:=0;
            y[4,2]:=0;
            y[4,3]:=0;
          else
            y:=hv;
          end if;
          annotation (Documentation(info="<!DOCTYPE html><html>
<p>This&nbsp;function&nbsp;calculates&nbsp;the&nbsp;hessian&nbsp;matrix&nbsp;of&nbsp;the&nbsp;4-variable-difference&nbsp;function.&nbsp;Like&nbsp;in&nbsp;the&nbsp;case&nbsp;of&nbsp;the&nbsp;gradient, the&nbsp;hessian&nbsp;matrix&nbsp;is&nbsp;put&nbsp;together&nbsp;from&nbsp;the&nbsp;difference&nbsp;vector-function&nbsp;itself&nbsp;and&nbsp;the&nbsp;first&nbsp;and&nbsp;second&nbsp;order&nbsp;derivatives through&nbsp;matrix&nbsp;algebra.&nbsp;So, it is not necessary&nbsp;to calculate each&nbsp;of&nbsp;the&nbsp;16&nbsp;components&nbsp;individually.</p>
</html>"));
          end hessian;

          function distance

          input IdealizedContact.ContactSurfaces.Types.ContactShapeType contactSurfaceType1;
          input IdealizedContact.ContactSurfaces.Types.ContactShapeType contactSurfaceType2;
          input Real rc1[3,1];
          input Real rc2[3,1];
          input Real h1[3] "semi axes surface 1";
          input Real h2[3] "semi axes surface 2";
          input Real A1[3,3] "transformation matrix BCS1";
          input Real A2[3,3] "transformation matrix BCS2";
          input Real angles[4,1] "angles";
          output Real d;
        protected
            Real phi1;
            Real phi2;
            Real theta1;
            Real theta2;
            Real vecd[3,1];
            Real ds[1,1];
          algorithm
            phi1:=angles[1, 1];
            theta1:=angles[2, 1];
            phi2:=angles[3, 1];
            theta2:=angles[4, 1];
            vecd :=differenceVector(contactSurfaceType1,contactSurfaceType2,rc1,rc2,A1,A2,h1,h2,phi1,theta1,phi2,theta2);
              ds:=transpose(vecd)*vecd;
              d:=(ds[1, 1])^0.5;

            annotation (Documentation(info="<!DOCTYPE html><html>
<p>Calculates scalar&nbsp;distance&nbsp;value</p>
</html>"));
          end distance;

          function checkPositiveDefiniteHessian

          input IdealizedContact.ContactSurfaces.Types.ContactShapeType contactSurfaceType1;
          input IdealizedContact.ContactSurfaces.Types.ContactShapeType contactSurfaceType2;
          input Real rc1[3,1];
          input Real rc2[3,1];
          input Real A1[3,3] "transformation matrix BCS1";
          input Real A2[3,3] "transformation matrix BCS2";
          input Real h1[3] "semi axes surface 1";
          input Real h2[3] "semi axes surface 2";
          input Real x[4,1];
          output Boolean y;
        protected
            Real J[4,4];
            Real H1;
            Real H2[2,2];
            Real H3[3,3];
          algorithm
            J :=hessian(
                      contactSurfaceType1,
                      contactSurfaceType2,
                      rc1,
                      rc2,
                      A1,
                      A2,
                      h1,
                      h2,
                      x);
              H1:=J[1, 1];
              H2[1,1]:=J[1, 1];
              H2[1,2]:=J[1, 2];
              H2[2,1]:=J[2, 1];
              H2[2,2]:=J[2, 2];
              H3[1,1]:=J[1, 1];
              H3[1,2]:=J[1, 2];
              H3[1,3]:=J[1, 3];
              H3[2,1]:=J[2, 1];
              H3[2,2]:=J[2, 2];
              H3[2,3]:=J[2, 3];
              H3[3,1]:=J[3, 1];
              H3[3,2]:=J[3, 2];
              H3[3,3]:=J[3, 3];

              if H1>0 and Modelica.Math.Matrices.det(H2)>0 and Modelica.Math.Matrices.det(H3)>0 and Modelica.Math.Matrices.det(J)>0 then
                y:=true;
              else
                y:=false;
              end if;

            annotation (Documentation(info="<!DOCTYPE html><html>
<p>This&nbsp;function&nbsp;checks&nbsp;whether the hessian matrix is&nbsp;positive&nbsp;definite. Because&nbsp;4x4&nbsp;still&nbsp;is&nbsp;a&nbsp;small&nbsp;matrix&nbsp;dimension,&nbsp;the&nbsp;positive-definite-check&nbsp;is done&nbsp;through&nbsp;checking&nbsp;the&nbsp;subdeterminants&nbsp;of&nbsp;the&nbsp;hessian&nbsp;matrix.</p>
</html>"));
          end checkPositiveDefiniteHessian;

          function absoluteValue

          input Real x[4,1];
          output Real y;
          algorithm
          y:=(x[1,1]^2 + x[2,1]^2 + x[3,1]^2 + x[4,1]^2)^0.5;
          annotation (Documentation(info="<!DOCTYPE html><html>
<p>Calculates the absolute&nbsp;value&nbsp;of&nbsp;a&nbsp;4-valued&nbsp;vector</p>
</html>"));
          end absoluteValue;

          function normalBasis

          input IdealizedContact.ContactSurfaces.Types.ContactShapeType contactSurfaceType
            "specify type of convex contact surface";
          //input Real angles[4,1];
          input Real phi;
          input Real theta;
          input Real A[3,3] "transformation matrix";
          input Real h[3] "semi axes";
          output Real diff[3,3];

        protected
            Real d[3,1];
            Real e[3,1];
            Real f[3,1];
            Real m;
            Real n;
            Real ci[3,1];
            Real yn[3,1];
            Real scalar1[1,1];
            Real scalar2;
            Real z[3,1];
            Real zn[3,1];
            Real xn[3,1];
          algorithm
          //   k:=angles[1, 1];
          //   l:=angles[2, 1];
          //   m:=angles[3, 1];
          //   n:=angles[4, 1];
            ci :=IdealizedContact.ContactSurfaces.ParametricSurfaceDefinition.parametricSurfaceWrapper(
              contactSurfaceType,
              h,
              phi,
              theta);
            d :=IdealizedContact.ContactSurfaces.ParametricSurfaceDefinition.FirstPartialDerivatives.firstPartialDerivativesWrapper(
              contactSurfaceType,
              1,
              h,
              phi,
              theta);
            e :=IdealizedContact.ContactSurfaces.ParametricSurfaceDefinition.FirstPartialDerivatives.firstPartialDerivativesWrapper(
              contactSurfaceType,
              2,
              h,
              phi,
              theta);
            f :=normalizedCrossproduct(d, e);
          scalar1:=transpose(ci)*f;
          scalar2:=scalar1[1, 1];
           if scalar2 < 0 then
             f:=(-1)*f;
           end if;
              yn:=f;
          d:=d/(d[1, 1]^2 + d[2, 1]^2 + d[3, 1]^2)^(0.5);
            z :=normalizedCrossproduct(d, f);
          xn:=d;
          zn:=z;
          diff:=[xn,yn,zn];

            annotation (Documentation(info="<!DOCTYPE html><html>
<p>This&nbsp;function&nbsp;generates&nbsp;the&nbsp;normal&nbsp;basis&nbsp;in&nbsp;the&nbsp;anticipated&nbsp;contact&nbsp;points so&nbsp;that&nbsp;the&nbsp;forces&nbsp;can&nbsp;be&nbsp;applied&nbsp;correctly.</p>
</html>"));
          end normalBasis;

          function crossproduct
          input Real a[3,1];
          input Real b[3,1];
          output Real c[3,1];
          algorithm
          c[1,1]:=a[2, 1]*b[3, 1] - a[3, 1]*b[2, 1];
          c[2,1]:=-(a[1, 1]*b[3, 1] - a[3, 1]*b[1, 1]);
          c[3,1]:=a[1, 1]*b[2, 1] - a[2, 1]*b[1, 1];
          annotation (Documentation(info="<!DOCTYPE html><html>
<p>Cross&nbsp;product&nbsp;of&nbsp;vectors&nbsp;given&nbsp;in&nbsp;3x1 matrix&nbsp;variables</p>
</html>"));
          end crossproduct;

          function normalizedCrossproduct

          input Real a[3,1];
          input Real b[3,1];
          output Real c[3,1];
        protected
            Real abs;
          algorithm
          c[1,1]:=a[2, 1]*b[3, 1] - a[3, 1]*b[2, 1];
          c[2,1]:=-(a[1, 1]*b[3, 1] - a[3, 1]*b[1, 1]);
          c[3,1]:=a[1, 1]*b[2, 1] - a[2, 1]*b[1, 1];

          abs:=(c[1, 1]^2 + c[2, 1]^2 + c[3, 1]^2)^0.5;
          c:=c/abs;
          annotation (Documentation(info="<!DOCTYPE html><html>
<p>Normalized&nbsp;cross&nbsp;product&nbsp;of&nbsp;vectors&nbsp;given&nbsp;in&nbsp;3x1-Matrix&nbsp;variables</p>
</html>"));
          end normalizedCrossproduct;

         annotation(preferredView="info", Documentation(info="<!DOCTYPE html><html>
<p>Package of functions and blocks to calculate contact points on two convex surfaces.</p>
</html>"));
        end CalculationsConvexSurfaces;

        package CalculationsConvexToPlane
        "Collection of necessary calculation functions to determine the contact between an arbitrary convex surface and a plane"
          extends Modelica.Icons.BasesPackage;
          model FindMinimum

            Modelica.Blocks.Interfaces.RealInput T[3,3]
              annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));
            Modelica.Blocks.Interfaces.RealOutput y[2,1](start=zeros(2,1))
              annotation (Placement(transformation(extent={{100,-10},{120,10}})));

            Modelica.Blocks.Interfaces.RealInput x0[2,1]
              annotation (Placement(transformation(extent={{-20,-20},{20,20}},
                  rotation=-90,
                  origin={0,100})));
        protected
            Real a[3];
            Real r[3];
        public
            Modelica.Blocks.Interfaces.RealInput u1[3]
              annotation (Placement(transformation(extent={{-120,40},{-80,80}})));
            Interfaces.ShapeTypeInput contactShapeType
            "shape of convex surface"                                            annotation (Placement(transformation(extent={{-120,-92},{-80,-52}})));
          equation

          a[1]=T[2,1];
          a[2]=T[2,2];
          a[3]=T[2,3];
          r[1]=u1[1];
          r[2]=u1[2];
          r[3]=u1[3];
          algorithm
            y := IdealizedContact.ContactBlock.PunctiformContact.Components.CalculationsConvexToPlane.searchMinimum(contactShapeType,
              x0,
              a,
              r);
            annotation (Diagram(graphics), Documentation(info="<!DOCTYPE html><html>
<p>This&nbsp;Model&nbsp;is&nbsp;used&nbsp;to&nbsp;route&nbsp;the&nbsp;input&nbsp;values&nbsp;into&nbsp;a&nbsp;single&nbsp;model.&nbsp;The&nbsp;essence&nbsp;of&nbsp;this&nbsp;model&nbsp;is&nbsp;the&nbsp;call of&nbsp;the&nbsp;search&nbsp;function.</p>
</html>"));
          end FindMinimum;

          model R0_1

            Modelica.Blocks.Interfaces.RealInput k[2,1]
              annotation (Placement(transformation(extent={{-20,-20},{20,20}},
                  rotation=90,
                  origin={-60,-100})));
            Modelica.Blocks.Interfaces.RealOutput out[3]
              annotation (Placement(transformation(extent={{100,60},{120,80}})));
            Modelica.Blocks.Interfaces.RealOutput z
              annotation (Placement(transformation(extent={{100,-80},{120,-60}})));
            Modelica.Blocks.Interfaces.RealInput h[3]
              annotation (Placement(transformation(extent={{-20,-20},{20,20}},
                  rotation=270,
                  origin={-60,100})));
        protected
            Real phi;
            Real theta;
            Real out_[3,1];
        public
            Interfaces.ShapeTypeInput contactShapeType
            "shape of convex surface"                                            annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));
          algorithm
           phi:=k[1, 1];
           theta:=k[2, 1];

           out_:=IdealizedContact.ContactSurfaces.ParametricSurfaceDefinition.parametricSurfaceWrapper(contactShapeType,h,phi,theta);

           out[1]:=out_[1,1];
           out[2]:=out_[2,1];
           out[3]:=out_[3,1];

            z:=sqrt(out[1]^2 + out[2]^2 + out[3]^2);

            annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
                                graphics),
                     smoothOrder=20,
              Documentation(info="<!DOCTYPE html><html>
<p>This&nbsp;model&nbsp;computes&nbsp;the&nbsp;coordinates&nbsp;of&nbsp;the&nbsp;contact&nbsp;point&nbsp;with&nbsp;respect&nbsp;to&nbsp;the&nbsp;body&nbsp;frame.</p>
</html>"));
          end R0_1;

          model R0_2

            Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a
              annotation (Placement(transformation(extent={{-16,-16},{16,16}},
                  rotation=180,
                  origin={100,0})));
            Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a1
              annotation (Placement(transformation(extent={{-16,-16},{16,16}},
                  rotation=180,
                  origin={-100,0})));
            Modelica.Blocks.Interfaces.RealOutput y[3]
              annotation (Placement(transformation(extent={{-10,-10},{10,10}},
                  rotation=270,
                  origin={-70,-110})));
            Modelica.Blocks.Interfaces.RealOutput z
              annotation (Placement(transformation(extent={{-10,-10},{10,10}},
                  rotation=270,
                  origin={70,-110})));
            Modelica.Blocks.Interfaces.RealInput h[3] "parameters of the plane"
                                                                                annotation (Placement(
                  transformation(
                  extent={{-20,-20},{20,20}},
                  rotation=270,
                  origin={30,100})));
            Interfaces.ShapeTypeInput contactShapeType "shape of plane surface"
                                                                                annotation (Placement(transformation(extent={{-20,-20},
                      {20,20}},
                  rotation=270,
                  origin={-60,100})));
        protected
            Real r[3],r_[3];

          equation
          r=(frame_a1.R.T)*(frame_a.r_0-frame_a1.r_0);

          //projection
          r_={r[1],0,r[3]};

          //limit to size of plane
          y=limiter(contactShapeType,h,r_);

          z=sqrt(y[1]^2+y[3]^2);

          frame_a.f = zeros(3);
          frame_a.t = zeros(3);
          frame_a1.f = zeros(3);
          frame_a1.t = zeros(3);

            annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                      -100},{100,100}}),
                                graphics), Documentation(info="<!DOCTYPE html><html>
<p>This&nbsp;model&nbsp;computes&nbsp;the&nbsp;components&nbsp;of&nbsp;the&nbsp;anticipated&nbsp;contact&nbsp;point&nbsp;on&nbsp;the&nbsp;plane&nbsp;with&nbsp;respect&nbsp;to&nbsp;the&nbsp;plane&nbsp;body&nbsp;frame.</p>
<p>The&nbsp;components&nbsp;are&nbsp;the&nbsp;difference&nbsp;of&nbsp;the&nbsp;anticipated&nbsp;contact&nbsp;point&nbsp;on&nbsp;the&nbsp;ellipsoid&nbsp;and&nbsp;the&nbsp;origin&nbsp;of&nbsp;the&nbsp;plane.</p>
<p>These&nbsp;components&nbsp;have&nbsp;to&nbsp;be&nbsp;transformed&nbsp;into&nbsp;the&nbsp;system&nbsp;of&nbsp;the&nbsp;plane&nbsp;and&nbsp;the&nbsp;direction&nbsp;perpendicular&nbsp;to&nbsp;the&nbsp;plane is&nbsp;set&nbsp;to&nbsp;zero.</p>
</html>"));
          end R0_2;

          model RelativeVelocities
          "Relative velocity between the anticipated contact points"
          // This model calculates the relative velocity between the anticipated contact points.

            Modelica.Blocks.Interfaces.RealInput omega_1[3] annotation (Placement(
                  transformation(
                  extent={{-20,-20},{20,20}},
                  rotation=270,
                  origin={-98,100})));
            Modelica.Blocks.Interfaces.RealInput y[2,1]     annotation (Placement(
                  transformation(
                  extent={{-20,-20},{20,20}},
                  rotation=180,
                  origin={100,100})));
            Modelica.Blocks.Interfaces.RealInput h1[3]      annotation (Placement(
                  transformation(
                  extent={{-20,-20},{20,20}},
                  rotation=180,
                  origin={100,60})));
            Modelica.Blocks.Interfaces.RealOutput vrel[3]
              annotation (Placement(transformation(extent={{-10,-10},{10,10}},
                  rotation=90,
                  origin={0,110})));
            Modelica.Blocks.Interfaces.RealInput A1[3,3]    annotation (Placement(
                  transformation(
                  extent={{-20,-20},{20,20}},
                  rotation=90,
                  origin={-20,-100})));
            Modelica.Blocks.Interfaces.RealInput omega_2[3] annotation (Placement(
                  transformation(
                  extent={{-20,-20},{20,20}},
                  rotation=90,
                  origin={-100,-100})));
            Modelica.Blocks.Interfaces.RealInput rc1[3]     annotation (Placement(
                  transformation(
                  extent={{-20,-20},{20,20}},
                  rotation=180,
                  origin={100,-20})));
            Modelica.Blocks.Interfaces.RealInput rc2[3]     annotation (Placement(
                  transformation(
                  extent={{-20,-20},{20,20}},
                  rotation=180,
                  origin={100,-58})));
            Modelica.Blocks.Interfaces.RealInput A2[3,3]    annotation (Placement(
                  transformation(
                  extent={{-20,-20},{20,20}},
                  rotation=90,
                  origin={22,-100})));
            Interfaces.ShapeTypeInput contactShapeType
            "shape of convex surface"                                           annotation (Placement(transformation(extent={{-124,-20},{
                      -84,20}})));
        protected
          Real rk1[3,1];
          Real vu1_h[3,1];
          Real vu2_h[3,1];
          Real Delta_vch[3,1];
          Real Delta_vu[3,1];
          Real rk2[3,1];

          Real vrelh[3,1];
            Real omega_1_vec[3,1];
            Real omega_2_vec[3,1];
            Real Delta_vc[3];
            Real phi,theta;

          algorithm
            omega_1_vec[1,1]:=omega_1[1];
            omega_1_vec[2,1]:=omega_1[2];
            omega_1_vec[3,1]:=omega_1[3];
            omega_2_vec[1,1]:=omega_2[1];
            omega_2_vec[2,1]:=omega_2[2];
            omega_2_vec[3,1]:=omega_2[3];
            Delta_vc:=der(rc2 - rc1);
            Delta_vch[1,1]:=Delta_vc[1];
            Delta_vch[2,1]:=Delta_vc[2];
            Delta_vch[3,1]:=Delta_vc[3];
            Delta_vch:=transpose(A2)*Delta_vch;

            phi:=y[1, 1];
            theta:=y[2, 1];
          //   rk1[1,1]:=h1[1]*cos(y[1, 1])*sin(y[2, 1]);
          //   rk1[2,1]:=h1[2]*sin(y[1, 1])*sin(y[2, 1]);
          //   rk1[3,1]:=h1[3]*cos(y[2, 1]);
            rk1:=IdealizedContact.ContactSurfaces.ParametricSurfaceDefinition.parametricSurfaceWrapper(contactShapeType,h1,phi,theta);

            vu1_h := IdealizedContact.Components.VectorCalculations.crossProductMatrix(omega_1_vec, rk1);
            vu1_h:=transpose(A2)*A1*vu1_h;

            rk2:=transpose(A2)*A1*rk1;
            rk2[2,1]:=0;

            vu2_h :=IdealizedContact.Components.VectorCalculations.crossProductMatrix(omega_2_vec, rk2);

            Delta_vu:=vu2_h - vu1_h;
            vrelh:=Delta_vu + Delta_vch;
            vrel[1]:=vrelh[1, 1];
            vrel[2]:=vrelh[2, 1];
            vrel[3]:=vrelh[3, 1];

            annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
                                graphics), Documentation(info="<!DOCTYPE html><html><p>This model calculates the relative velocity between the anticipated contact points.</p>
  <p>The formula used can be found in the full documentation. The velocity of an arbitrary point on an arbitrarily moving rigid body is the composition of the velocity of the origin of the coordinate system associated with the rigid body and the peripheral velocity of the point in question.</p></html>"));
          end RelativeVelocities;

          model TransformationMatrixBetweenBodyFrames
            //This model computes the components of the transformation matrix between the orientations of the convex surface and the plane.
            Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_bcs1
              annotation (Placement(transformation(extent={{-118,84},{-86,116}})));
            Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_bcs2
              annotation (Placement(transformation(extent={{-118,-116},{-86,-84}})));
            Modelica.Blocks.Interfaces.RealOutput trf[3,3]
            "transformation matrix"
              annotation (Placement(transformation(extent={{-10,-10},{10,10}},
                  rotation=0,
                  origin={110,0})));
            Modelica.Blocks.Interfaces.RealOutput rc1[3] "center of convex"
              annotation (Placement(transformation(extent={{-10,-10},{10,10}},
                  rotation=270,
                  origin={0,-110})));
            Modelica.Blocks.Interfaces.RealOutput A2[3,3]
              annotation (Placement(transformation(extent={{-10,-10},{10,10}},
                  rotation=180,
                  origin={-110,-40})));
            Modelica.Blocks.Interfaces.RealOutput A1[3,3]
              annotation (Placement(transformation(extent={{-10,-10},{10,10}},
                  rotation=180,
                  origin={-110,40})));
            Modelica.Blocks.Interfaces.RealOutput rc2[3] "center of plane"
              annotation (Placement(transformation(extent={{-10,-10},{10,10}},
                  rotation=90,
                  origin={0,110})));
          equation
            trf = frame_bcs2.R.T*transpose(frame_bcs1.R.T);
            A1=transpose(frame_bcs1.R.T);
            A2=transpose(frame_bcs2.R.T);
            rc1= frame_bcs1.r_0;
            rc2=frame_bcs2.r_0;
             frame_bcs1.f = zeros(3);
             frame_bcs1.t = zeros(3);
             frame_bcs2.f = zeros(3);
             frame_bcs2.t = zeros(3);
            annotation (                               Diagram(graphics), Documentation(info="<!DOCTYPE html><html>
<p>This&nbsp;model&nbsp;computes&nbsp;the&nbsp;components&nbsp;of&nbsp;the&nbsp;transformation&nbsp;matrix&nbsp;between&nbsp;the&nbsp;orientations&nbsp;of&nbsp;the&nbsp;ellipsoid&nbsp;and&nbsp;the&nbsp;plane.</p>
</html>"));
          end TransformationMatrixBetweenBodyFrames;

          model splitparam

            Modelica.Blocks.Interfaces.RealInput u1[12] annotation (Placement(
                  transformation(
                  extent={{-20,-20},{20,20}},
                  rotation=270,
                  origin={-100,100})));
            Modelica.Blocks.Interfaces.RealInput u2[12] annotation (Placement(
                  transformation(
                  extent={{-20,-20},{20,20}},
                  rotation=90,
                  origin={-100,-100})));
            Modelica.Blocks.Interfaces.RealOutput y1[3]
              annotation (Placement(transformation(extent={{-10,-10},{10,10}},
                  rotation=90,
                  origin={100,110})));
            Modelica.Blocks.Interfaces.RealOutput y2[3]
              annotation (Placement(transformation(extent={{-10,-10},{10,10}},
                  rotation=270,
                  origin={100,-110})));
          equation
          y1[1]=u1[10];
          y1[2]=u1[11];
          y1[3]=u1[12];
          y2[1]=u2[10];
          y2[3]=u2[11]
            "quick and dirty way to get the model runnig with the normal surface definition.";
          y2[2]=u2[12];
            annotation (Diagram(graphics), Documentation(info="<!DOCTYPE html><html>
<p>This&nbsp;model&nbsp;serves&nbsp;as&nbsp;an&nbsp;interface&nbsp;between&nbsp;the&nbsp;parameter&nbsp;routing&nbsp;that&nbsp;is&nbsp;used&nbsp;in&nbsp;general&nbsp;in&nbsp;these&nbsp;coupling&nbsp;models and&nbsp;the&nbsp;routing&nbsp;that&nbsp;is&nbsp;used&nbsp;in&nbsp;this&nbsp;internal&nbsp;structure.</p>
</html>"));
          end splitparam;

          function f "the function that is to be minimized"
            //This scalar function computes the component of the convex surface in the direction perpendicular to the plane.
            //The input values are the parameters which determine the points on the surface of the ellipsoid,
            //the respective components of the transformation matrix and the semiaxis parameters of the ellipsoid
            input IdealizedContact.ContactSurfaces.Types.ContactShapeType contactSurfaceType
            "type of the convex surface";
            input Real vec[2,1]
            "parameter vector which determines the points on the convex surface";
            input Real a[3]
            "respective components of the transformation matrix between the orientation of the plane and the convex surface";
            input Real h[3] "semi axes of the convex surface";
            output Real f;
            //auxiliary variables are used to represent the equation clearly
        protected
            Real a_21;
            Real a_22;
            Real a_23;

            Real phi;
            Real theta;
            Real f_[3,1];
          algorithm
            phi:=vec[1,1];
            theta:=vec[2,1];
            a_21:=a[1];
            a_22:=a[2];
            a_23:=a[3];

            f_:=IdealizedContact.ContactSurfaces.ParametricSurfaceDefinition.parametricSurfaceWrapper(
              contactSurfaceType,
              h,
              phi,
              theta);
           //f:=a_21*r_1*cos(x)*sin(y)+a_22*r_2*sin(x)*sin(y)+a_23*r_3*cos(y);
            f:=a_21*f_[1,1] + a_22*f_[2, 1] + a_23*f_[3, 1];

            annotation (Documentation(info="<!DOCTYPE html><html>
<p>This&nbsp;scalar&nbsp;function&nbsp;computes&nbsp;the&nbsp;component&nbsp;of&nbsp;the&nbsp;ellipsoid&nbsp;surface&nbsp;in&nbsp;the&nbsp;direction&nbsp;perpendicular&nbsp;to&nbsp;the&nbsp;plane. The&nbsp;input&nbsp;values&nbsp;are&nbsp;the&nbsp;parameters&nbsp;which&nbsp;determine&nbsp;the&nbsp;points&nbsp;on&nbsp;the&nbsp;surface&nbsp;of&nbsp;the&nbsp;ellipsoid, the&nbsp;respective&nbsp;components&nbsp;of&nbsp;the&nbsp;transformation&nbsp;matrix&nbsp;and&nbsp;the&nbsp;semiaxis&nbsp;parameters&nbsp;of&nbsp;the&nbsp;ellipsoid.</p>
</html>"));
          end f;

          function gradient "gradient of f"
            //This function computes the components of the gradient of the function f.
            //The input values are the parameters which determine the points on the convex surface,
            //the respective components of the transformation matrix and the semi axes.
            input IdealizedContact.ContactSurfaces.Types.ContactShapeType contactSurfaceType
            "type of the convex surface";
            input Real vec[2,1]
            "parameter vector which determines the points on the surface of the ellipsoid";
            input Real a[3]
            "respective components of the transformation matrix between the orientation of the plane and the ellipsoid";
            input Real h[3] "semi axes of the ellipsoid";
            output Real gradient[2,1];
            //auxiliary variables are used to represent the equation clearly
        protected
            Real a_21;
            Real a_22;
            Real a_23;
            Real phi;
            Real theta;
            Real df_1[3,1];
            Real df_2[3,1];
          algorithm
            phi:=vec[1,1];
            theta:=vec[2,1];
            a_21:=a[1];
            a_22:=a[2];
            a_23:=a[3];

            //derivatives in BCS of surface
            df_1:=IdealizedContact.ContactSurfaces.ParametricSurfaceDefinition.FirstPartialDerivatives.firstPartialDerivativesWrapper(
              contactSurfaceType,
              1,
              h,
              phi,
              theta);
            df_2:=IdealizedContact.ContactSurfaces.ParametricSurfaceDefinition.FirstPartialDerivatives.firstPartialDerivativesWrapper(
              contactSurfaceType,
              2,
              h,
              phi,
              theta);

            //transform to BCS of plane
              // in case of ellipsoid:
              // gradient[1,1]:=-a_21*h_1*sin(phi)*sin(theta) + a_22*h_2*cos(phi)*sin(theta);
              // gradient[2,1]:=a_21*h_1*cos(phi)*cos(theta) + a_22*h_2*sin(phi)*cos(theta) - a_23*h_3*sin(theta);
            gradient[1,1]:=a_21*df_1[1,1] + a_22*df_1[2,1] + a_23*df_1[3,1];
            gradient[2,1]:=a_21*df_2[1,1] + a_22*df_2[2,1] + a_23*df_2[3,1];
          annotation (Documentation(info="<!DOCTYPE html><html>
<p>This&nbsp;function&nbsp;computes&nbsp;the&nbsp;components&nbsp;of&nbsp;the&nbsp;gradient&nbsp;of&nbsp;the&nbsp;function&nbsp;f. The&nbsp;input&nbsp;values&nbsp;are&nbsp;the&nbsp;parameters&nbsp;which&nbsp;determine&nbsp;the&nbsp;points&nbsp;on&nbsp;the&nbsp;surface&nbsp;of&nbsp;the&nbsp;ellipsoid, the&nbsp;respective&nbsp;components&nbsp;of&nbsp;the&nbsp;transformation&nbsp;matrix&nbsp;and&nbsp;the&nbsp;semiaxis&nbsp;parameters&nbsp;of&nbsp;the&nbsp;ellipsoid.</p>
</html>"));
          end gradient;

          function hessian "hessian matrix of f"
            //This function computes the components of the hessian matrix of the function f and arranges them into a [2x2]-matrix representation.
            //The input values are the parameters which determine the points on the convex surface,
            //the respective components of the transformation matrix and the semiaxis parameters of the convex surface.
            input IdealizedContact.ContactSurfaces.Types.ContactShapeType contactSurfaceType
            "type of the convex surface";
            input Real vec[2,1]
            "parameter vector which determines the points on the surface of the ellipsoid";
            input Real a[3]
            "respective components of the transformation matrix between the orientation of the plane and the ellipsoid";
            input Real h[3] "semi axes";
            output Real hessian[2,2];

            //auxiliary variables are used to represent the equation clearly
        protected
            Real a_21;
            Real a_22;
            Real a_23;
            Real phi;
            Real theta;
            Real hessian_[2,2];
            Real ddf_11[3,1];
            Real ddf_12[3,1];
            Real ddf_22[3,1];
          algorithm
            phi:=vec[1,1];
            theta:=vec[2,1];
            a_21:=a[1];
            a_22:=a[2];
            a_23:=a[3];

            ddf_11:=IdealizedContact.ContactSurfaces.ParametricSurfaceDefinition.SecondPartialDerivatives.secondPartialDerivativesWrapper(
              contactSurfaceType,
              1,
              1,
              h,
              phi,
              theta);
             ddf_12:=IdealizedContact.ContactSurfaces.ParametricSurfaceDefinition.SecondPartialDerivatives.secondPartialDerivativesWrapper(
              contactSurfaceType,
              1,
              2,
              h,
              phi,
              theta);
             ddf_22:=IdealizedContact.ContactSurfaces.ParametricSurfaceDefinition.SecondPartialDerivatives.secondPartialDerivativesWrapper(
              contactSurfaceType,
              2,
              2,
              h,
              phi,
              theta);

            // Hessian in case of ellipsoid:
            //   hessian_[1,1]:=-a_21*h_1*cos(phi)*sin(theta) - a_22*h_2*sin(phi)*sin(theta);
            //   hessian_[1,2]:=-a_21*h_1*sin(phi)*cos(theta) + a_22*h_2*cos(phi)*cos(theta);
            //   hessian_[2,1]:=-a_21*h_1*sin(phi)*cos(theta) + a_22*h_2*cos(phi)*cos(theta);
            //   hessian_[2,2]:=-a_21*h_1*cos(phi)*sin(theta) - a_22*h_2*sin(phi)*sin(theta) - a_23*h_3*cos(theta);
            hessian_[1,1]:= a_21*ddf_11[1,1] + a_22*ddf_11[2,1] + a_23*ddf_11[3,1];
            hessian_[1,2]:= a_21*ddf_12[1,1] + a_22*ddf_12[2,1] + a_23*ddf_12[3,1];
            hessian_[2,1]:= a_21*ddf_12[1,1] + a_22*ddf_12[2,1] + a_23*ddf_12[3,1];
            hessian_[2,2]:= a_21*ddf_22[1,1] + a_22*ddf_22[2,1] + a_23*ddf_22[3,1];

            //The determinant should not become to small, otherwise the solving algorithm will become unstable
            if  Modelica.Math.Matrices.det(hessian_) <0.0000001 and Modelica.Math.Matrices.det(hessian_) >-0.0000001 then
              hessian[1,1]:=-1;
              hessian[1,2]:=0;
              hessian[2,1]:=0;
              hessian[2,2]:=-1;
            else
              hessian:=hessian_;
            end if;
          annotation (Documentation(info="<!DOCTYPE html><html>
<p>This&nbsp;function&nbsp;computes&nbsp;the&nbsp;components&nbsp;of&nbsp;the&nbsp;hessian&nbsp;matrix&nbsp;of&nbsp;the&nbsp;function&nbsp;f&nbsp;and&nbsp;arranges&nbsp;them&nbsp;into&nbsp;a&nbsp;[2x2]-matrix&nbsp;representation. The&nbsp;input&nbsp;values&nbsp;are&nbsp;the&nbsp;parameters&nbsp;which&nbsp;determine&nbsp;the&nbsp;points&nbsp;on&nbsp;the&nbsp;surface&nbsp;of&nbsp;the&nbsp;ellipsoid, the&nbsp;respective&nbsp;components&nbsp;of&nbsp;the&nbsp;transformation&nbsp;matrix&nbsp;and&nbsp;the&nbsp;semiaxis&nbsp;parameters&nbsp;of&nbsp;the&nbsp;ellipsoid.</p>
</html>"));
          end hessian;

          function searchMinimum "search function"
          input IdealizedContact.ContactSurfaces.Types.ContactShapeType contactSurfaceType
            "type of the convex surface";
          input Real x0[2,1] "starting values for the iteration";
          input Real a[3]
            "respective components of the transformation matrix between the orientation of the plane and the ellipsoid";
          input Real r[3] "semiaxis of the the convex surface";
          output Real y[2,1] "final value for the iteration";
        protected
            Real xn[2,1] "auxiliary variable of the iteration";
            Real xi[2,1] "auxiliary variable of the iteration";
            Real t
            "counting variable to change the starting value if the given starting value doesn't result in a minimum";
            Real dev=min(r)/10
            "deviation of starting value if the given starting value doesn't result in a minimum";
          algorithm
          xi:=x0;
          //first call of the Newton algorithm
            xn :=
              IdealizedContact.ContactBlock.PunctiformContact.Components.CalculationsConvexToPlane.newtonAlgorithm(contactSurfaceType,
              xi,
              a,
              r);
              t:=1;

          //while loop to determine whether the result of the Newton algorithm is a minimum.
          //if this is not the case, the Newton algorithm is called again with a slight deviation in starting values until a minimum is found
          while not checkPositiveDefiniteHessian(contactSurfaceType,
                    xn,
                    a,
                    r) loop
              // xi[1,1]:=y[1, 1] + 0.01*t*cos(6*0.01*t);
              // xi[2,1]:=y[2, 1] + 0.01*t*sin(6*0.01*t);
              xi[1,1]:=y[1, 1] + dev*t*cos(6*dev*t);
              xi[2,1]:=y[2, 1] + dev*t*sin(6*dev*t);
              xn :=newtonAlgorithm(contactSurfaceType,
                    xi,
                    a,
                    r);
              t:=t + 1;
            end while;

          y:=xn;

            annotation (Documentation(info="<!DOCTYPE html><html>
<p>This search&nbsp;function&nbsp;to&nbsp;determine&nbsp;whether&nbsp;the&nbsp;solutions&nbsp;found&nbsp;by&nbsp;the&nbsp;Newton&nbsp;algorithm&nbsp;are&nbsp;in&nbsp;fact&nbsp;minima.</p>
</html>"));
          end searchMinimum;

          function newtonAlgorithm
          "Newton algorithm to find a solution to a multivariable equation"
          // The input quantities are a starting value vec, the respective components of the transformation matrix
          // between the orientations of the plane and the ellipsoid and the semiaxis parameters of the ellipsoid.
          // The output quantity is a solution to the given multivariable equation
          input IdealizedContact.ContactSurfaces.Types.ContactShapeType contactSurfaceType
            "type of the convex surface";
          input Real vec[2,1] "starting values for the iteration";
          input Real a[3]
            "respective components of the transformation matrix between the orientation of the plane and the ellipsoid";
          input Real r[3] "semiaxis of the ellipsoid";
          output Real min[2,1];
          // The protected quantities are auxiliary variables which are used during the algorithm,
          // mostly for temporary storage purposes
        protected
            Real xn[2,1];
            Real xn1[2,1];
            Real Delta[2,1];
            Real delta[1,1];
            Real d;
          algorithm
          //The algorithm based on the form that as it was at first proposed by Newton
            xn:=vec;
            xn1 := xn - Modelica.Math.Matrices.inv(IdealizedContact.ContactBlock.PunctiformContact.Components.CalculationsConvexToPlane.hessian(contactSurfaceType,
              xn,
              a,
              r))*IdealizedContact.ContactBlock.PunctiformContact.Components.CalculationsConvexToPlane.gradient(contactSurfaceType,
              xn,
              a,
              r);

          Delta:=xn1 - xn;
          delta:=(transpose(Delta)*Delta);
          d:=delta[1, 1];
          d:=d^0.5;
             while d>0.000000001 loop
              xn1 := xn - Modelica.Math.Matrices.inv(IdealizedContact.ContactBlock.PunctiformContact.Components.CalculationsConvexToPlane.hessian(contactSurfaceType,
                xn,
                a,
                r))*IdealizedContact.ContactBlock.PunctiformContact.Components.CalculationsConvexToPlane.gradient(contactSurfaceType,
                xn,
                a,
                r);
                Delta:=xn1 - xn;
            delta:=(transpose(Delta)*Delta);
            d:=delta[1, 1];
            d:=d^0.5;
               xn:=xn1;
             end while;
            min:=xn;
          annotation (Documentation(info="<!DOCTYPE html><html>
<p>Performs Newton&apos;s Algorithm to get a solution to the minimization problem. The&nbsp;input&nbsp;quantities&nbsp;are&nbsp;a&nbsp;starting&nbsp;value&nbsp;vec,&nbsp;the&nbsp;respective&nbsp;components&nbsp;of&nbsp;the&nbsp;transformation&nbsp;matrix&nbsp;between&nbsp;the&nbsp;orientations&nbsp;of&nbsp;the&nbsp;plane&nbsp;and&nbsp;the&nbsp;ellipsoid&nbsp;and&nbsp;the&nbsp;semiaxis&nbsp;parameters&nbsp;of&nbsp;the&nbsp;ellipsoid. The&nbsp;output&nbsp;quantity&nbsp;is&nbsp;a&nbsp;solution&nbsp;to&nbsp;the&nbsp;given&nbsp;multivariable&nbsp;equation.</p>
</html>"));
          end newtonAlgorithm;

          function checkPositiveDefiniteHessian "positive definite check"
            //This function checks whether the hessian matrix of the function f is positive definite
          input IdealizedContact.ContactSurfaces.Types.ContactShapeType contactSurfaceType
            "type of the convex surface";
          input Real vec[2,1];
          input Real a[3]
            "respective components of the transformation matrix between the orientation of the plane and the convex surface";
          input Real h[3] "semi axes";
          output Boolean def;
        protected
            Real hessian[2,2];
          algorithm
            hessian := IdealizedContact.ContactBlock.PunctiformContact.Components.CalculationsConvexToPlane.hessian(contactSurfaceType,
              vec,
              a,
              h);
            if hessian[1,1]>0 and Modelica.Math.Matrices.det(hessian)>0 then
              def:=true;
            else
              def:=false;
            end if;
          annotation (Documentation(info="<!DOCTYPE html><html>
<p>This&nbsp;function&nbsp;checks&nbsp;whether&nbsp;the&nbsp;hessian&nbsp;matrix&nbsp;of&nbsp;the&nbsp;function&nbsp;f&nbsp;is&nbsp;positive&nbsp;definite.</p>
</html>"));
          end checkPositiveDefiniteHessian;

          function limiter
          input IdealizedContact.ContactSurfaces.Types.ContactShapeType contactSurfaceType
            "type of the plane surface";
          input Real h[3];
          input Real contact[3];
          output Real limited_contact[3];
        protected
            Real h_[3];
            Real r,l,phi;
          algorithm

            if contactSurfaceType=="rectangular" then
              h_:=0.5*h;
              limited_contact[1]:=sign(contact[1])*min(abs(contact[1]), h_[1]);
              limited_contact[2]:=contact[2];
              limited_contact[3]:=sign(contact[3])*min(abs(contact[3]), h_[3]);

            elseif contactSurfaceType=="circular" then
              l:=Modelica.Math.Vectors.length(contact);
              r:=min(h[1], l);
              limited_contact:=Modelica.Math.Vectors.normalize(contact)*r;

            else
                assert(false,"Limitation of plane surface is not specified.");

            end if;

            annotation (Documentation(info="<!DOCTYPE html><html>
<p>This&nbsp;function&nbsp;limits&nbsp;the&nbsp;contact&nbsp;point&nbsp;on&nbsp;the&nbsp;plane&nbsp;to&nbsp;the&nbsp;plane dimensions.</p>
</html>"));
          end limiter;
         annotation(preferredView="info", Documentation(info="<!DOCTYPE html><html>
<p>Package of functions and blocks to calculate contact points on a convex and a plane surface.</p>
</html>"));
        end CalculationsConvexToPlane;

       annotation(preferredView="info");
      end Components;

       annotation(preferredView="info");
    end PunctiformContact;

    package LinearContact "Source package for linear contact area"
    extends Modelica.Icons.SourcesPackage;
      model CylinderToRectangle
        extends IdealizedContact.Components.PartialContactBlock;

    public
        IdealizedContact.ContactBlock.LinearContact.Components.MovePointCylinderToRectangle
                                                                                            geometry[2](
        q={1,-1},
        f={f,f},
        exact={exact,exact},
        Animation={animation,animation},
        Color_contact_point_rectangle={colorContactPoints1,colorContactPoints1},
        radiusContactPoint={radiusContactPoint,radiusContactPoint},
        Color_contact_point_cylinder={colorContactPoints2,colorContactPoints2})
        "move point detection"
        annotation (Placement(transformation(extent={{-60,12},{0,72}})));
       IdealizedContact.ContactBlock.LinearContact.Components.ForceCylinderToRectangle
                                                                                       force[2](
        q={1,-1},
        c={springCoefficient,springCoefficient},
        d={dampingCoefficient,dampingCoefficient},
        n1={N1,N1},
        n2={N2,N2},
        t_max={p_max,p_max},
        f={f,f},
        mue_r={mue_r,mue_r},
        gamma1={gamma1,gamma1},
        gamma2={gamma2,gamma2},
        gamma3={gamma3,gamma3},
        gamma4={gamma4,gamma4},
        gamma5={gamma5,gamma5},
        gamma6={gamma6,gamma6}) annotation (Placement(transformation(extent={{2,-54},{54,0}})));

      Modelica.Blocks.Logical.Or or1
        annotation (Placement(transformation(extent={{68,-34},{88,-14}})));
      equation
         assert((Modelica.Utilities.Strings.isEqual(surfaceType1,"cylindrical") and Modelica.Utilities.Strings.isEqual(surfaceType2,"rectangular")),"Error in contact specification: Contact definition is CylinderToRectangle but other contact surfaces are connected to the contact block.",level=AssertionLevel.error);

      connect(geometry[1].frame_b2, force[1].frame_a1)
        annotation (Line(
          points={{-0.461538,60},{31.12,60},{31.12,0.54}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(geometry[2].frame_b2, force[2].frame_a1)
        annotation (Line(
          points={{-0.461538,60},{31.12,60},{31.12,0.54}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(geometry[1].frame_a2, frame_a)
        annotation (Line(
          points={{-60.4615,60},{-82,60},{-82,86},{-102,86}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(geometry[2].frame_a2, frame_a)
        annotation (Line(
          points={{-60.4615,60},{-82,60},{-82,86},{-102,86}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(frame_b, geometry[1].frame_a1)
        annotation (Line(
          points={{-102,-74},{-74,-74},{-74,24},{-60.4615,24}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(frame_b, geometry[2].frame_a1)
        annotation (Line(
          points={{-102,-74},{-74,-74},{-74,24},{-60.4615,24}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(force[1].frame_a3, frame_b)
        annotation (Line(
          points={{31.12,-54.54},{31.12,-74},{-102,-74}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(force[2].frame_a3, frame_b)
        annotation (Line(
          points={{31.12,-54.54},{31.12,-74},{-102,-74}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(geometry[1].vector_cylinder, vector_1)
        annotation (Line(
          points={{-61.8462,48},{-82,48},{-82,37},{-107,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(geometry[2].vector_cylinder, vector_1)
        annotation (Line(
          points={{-61.8462,48},{-82,48},{-82,37},{-107,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(force[1].vector_cylinder, vector_1)
        annotation (Line(
          points={{-0.08,-41.58},{-82,-41.58},{-82,37},{-107,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(force[2].vector_cylinder, vector_1)
        annotation (Line(
          points={{-0.08,-41.58},{-82,-41.58},{-82,37},{-107,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(force[1].vector_rectangle, vector_2)
        annotation (Line(
          points={{-0.08,-52.38},{-78,-52.38},{-78,-30},{-106,-30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(force[2].vector_rectangle, vector_2)
        annotation (Line(
          points={{-0.08,-52.38},{-78,-52.38},{-78,-30},{-106,-30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(geometry[1].vector_rectangle, vector_2)
        annotation (Line(
          points={{-61.8462,36},{-78,36},{-78,-30},{-106,-30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(geometry[2].vector_rectangle, vector_2)
        annotation (Line(
          points={{-61.8462,36},{-78,36},{-78,-30},{-106,-30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(geometry.frame_b1, force.frame_a2)
        annotation (Line(
          points={{-0.461538,24},{11.36,24},{11.36,0.54}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(frame_a, force[1].frame_a4) annotation (Line(
          points={{-102,86},{-70,86},{-70,-66},{16.04,-66},{16.04,-54}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(frame_a, force[2].frame_a4) annotation (Line(
          points={{-102,86},{-70,86},{-70,-66},{16.04,-66},{16.04,-54}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(contact, or1.y) annotation (Line(
          points={{106,-2},{92,-2},{92,-24},{89,-24}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(force[1].contact, or1.u1) annotation (Line(
          points={{55.56,-27.54},{55.56,-22.77},{66,-22.77},{66,-24}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(force[2].contact, or1.u2) annotation (Line(
          points={{55.56,-27.54},{55.56,-32.77},{66,-32.77},{66,-32}},
          color={255,0,255},
          smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),
                            graphics), Icon(graphics={Rectangle(extent={{-100,100},
                    {100,-100}}, lineColor={255,128,0}), Text(
                extent={{-82,8},{82,-12}},
                lineColor={0,0,255},
              textString="%name")}),
          Documentation(info="<!DOCTYPE html><html>
</html>"));
      end CylinderToRectangle;

      model CylinderToCircle
        extends IdealizedContact.Components.PartialContactBlock;

    public
        IdealizedContact.ContactBlock.LinearContact.Components.MovePointCylinderToCircle
                                                                                         geometry[2](
        q={1,-1},
        f={f,f},
        exact={exact,exact}) "move point detection" annotation (Placement(transformation(extent={{-60,12},{0,72}})));
        IdealizedContact.ContactBlock.LinearContact.Components.ForceCylinderToCircle
                                                                                     force[2](
        c={springCoefficient,springCoefficient},
        d={dampingCoefficient,dampingCoefficient},
        n1={N1,N1},
        n2={N2,N2},
        t_max={p_max,p_max},
        q={1,-1},
        f={f,f},
        Animation={animation,animation},
        exact={exact,exact},
        radiusContactPoint={radiusContactPoint,radiusContactPoint},
        Color_contact_point_cylinder={colorContactPoints1,colorContactPoints1},
        Color_contact_point_circle={colorContactPoints2,colorContactPoints2},
        mue_r={mue_r,mue_r},
        gamma1={gamma1,gamma1},
        gamma2={gamma2,gamma2},
        gamma3={gamma3,gamma3},
        gamma4={gamma4,gamma4},
        gamma5={gamma5,gamma5},
        gamma6={gamma6,gamma6}) annotation (Placement(transformation(extent={{0,-60},{60,0}})));

      Modelica.Blocks.Logical.Or or1
        annotation (Placement(transformation(extent={{70,-24},{90,-4}})));
      equation
           assert((Modelica.Utilities.Strings.isEqual(surfaceType1,"cylindrical") and Modelica.Utilities.Strings.isEqual(surfaceType2,"circular")),"Error in contact specification: Contact definition is CylinderToCircle but other contact surfaces are connected to the contact block.",level=AssertionLevel.error);

      connect(geometry.pos_rel_c_l, force.pos_rel_c_L)
        annotation (Line(
          points={{-30,9.6},{-30,-12.6},{-1.8,-12.6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(geometry.w_rel, force.w_rel)
        annotation (Line(
          points={{-42,9.6},{-42,-24.6},{-1.8,-24.6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(force.angles, geometry.angles)
        annotation (Line(
          points={{-1.8,-36.6},{-54,-36.6},{-54,9.6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(geometry.frame_b2, force.frame_a1)
        annotation (Line(
          points={{0.6,60},{30,60},{30,0.6}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(geometry[1].frame_a2, frame_a)
        annotation (Line(
          points={{-60.6,60},{-82,60},{-82,86},{-102,86}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(geometry[2].frame_a2, frame_a)
        annotation (Line(
          points={{-60.6,60},{-82,60},{-82,86},{-102,86}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(geometry[1].frame_a1, frame_b)
        annotation (Line(
          points={{-60.6,24},{-66,24},{-66,-74},{-102,-74}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(geometry[2].frame_a1, frame_b)
        annotation (Line(
          points={{-60.6,24},{-66,24},{-66,-74},{-102,-74}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(force[1].frame_a3, frame_b)
        annotation (Line(
          points={{30,-60.6},{30,-74},{-102,-74}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(force[2].frame_a3, frame_b)
        annotation (Line(
          points={{30,-60.6},{30,-74},{-102,-74}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(geometry[1].vector_cylinder, vector_1)
        annotation (Line(
          points={{-62.4,48},{-82,48},{-82,37},{-107,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(geometry[2].vector_cylinder, vector_1)
        annotation (Line(
          points={{-62.4,48},{-82,48},{-82,37},{-107,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(geometry[1].vector_circle, vector_2)
        annotation (Line(
          points={{-62.4,36},{-76,36},{-76,-30},{-106,-30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(geometry[2].vector_circle, vector_2)
        annotation (Line(
          points={{-62.4,36},{-76,36},{-76,-30},{-106,-30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(force[1].vector_cylinder, vector_1)
        annotation (Line(
          points={{-2.4,-46.2},{-82,-46.2},{-82,37},{-107,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(force[2].vector_cylinder, vector_1)
        annotation (Line(
          points={{-2.4,-46.2},{-82,-46.2},{-82,37},{-107,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(force[1].vector_circle, vector_2)
        annotation (Line(
          points={{-2.4,-58.2},{-76,-58.2},{-76,-30},{-106,-30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(force[2].vector_circle, vector_2)
        annotation (Line(
          points={{-2.4,-58.2},{-76,-58.2},{-76,-30},{-106,-30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(force.pos_ctc_BCS1a, geometry.pos_ctc_BCS1a)
        annotation (Line(
          points={{-1.8,-3.6},{-18,-3.6},{-18,9.6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(contact, or1.y) annotation (Line(
          points={{106,-2},{94,-2},{94,-14},{91,-14}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(force[1].contact, or1.u1) annotation (Line(
          points={{62.1,-11.7},{62.1,-12.77},{68,-12.77},{68,-14}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(force[2].contact, or1.u2) annotation (Line(
          points={{62.1,-11.7},{62.1,-22.77},{68,-22.77},{68,-22}},
          color={255,0,255},
          smooth=Smooth.None));
        annotation (Icon(graphics={                   Rectangle(extent={{-100,100},{100,
                    -100}},      lineColor={255,128,0}), Text(
                extent={{-84,10},{80,-10}},
                lineColor={0,0,255},
              textString="%name")}),     Diagram(graphics));
      end CylinderToCircle;

      model CylinderToCylinderPoint
        extends IdealizedContact.Components.PartialContactBlock;

    public
        Components.MovePointCylinderToCylinderPoint geometry(
        f=f,
        radiusContactPoint=radiusContactPoint,
        Color_contact_point_cylinder1=colorContactPoints1,
        Color_contact_point_cylinder2=colorContactPoints2,
        animation=animation) annotation (Placement(transformation(extent={{-60,28},{-20,68}})));
        Components.ForceCylinderToCylinderPoint force(
        f=f,
        c=springCoefficient,
        d=dampingCoefficient,
        n1=N1,
        n2=N2,
        mue_r=mue_r,
        gamma1=gamma1,
        gamma2=gamma2,
        gamma3=gamma3,
        gamma4=gamma4,
        gamma5=gamma5,
        gamma6=gamma6,
        t_max=p_max) annotation (Placement(transformation(extent={{-28,-68},{12,-28}})));

      equation
             assert((Modelica.Utilities.Strings.isEqual(surfaceType1,"cylindrical") and Modelica.Utilities.Strings.isEqual(surfaceType2,"cylindrical")),"Error in contact specification: Contact definition is CylinderToCylinder but other contact surfaces are connected to the contact block.",level=AssertionLevel.error);

      connect(geometry.frame_b2, force.frame_a3)
        annotation (Line(
          points={{-20.1429,32.4444},{-12,32.4444},{-12,-27.6}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(geometry.frame_b1, force.frame_a4)
        annotation (Line(
          points={{-20,61.7778},{0,61.7778},{0,-27.6}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(geometry.frame_a1, frame_a) annotation (Line(
          points={{-60.2857,63.3333},{-71.7857,63.3333},{-71.7857,86},{-102,86}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(geometry.frame_a2, frame_b) annotation (Line(
          points={{-59.5714,32.4444},{-76,32.4444},{-76,-74},{-102,-74}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(force.frame_a2, frame_b)
        annotation (Line(
          points={{-28.4,-60},{-66,-60},{-66,-74},{-102,-74}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(force.frame_a1, frame_a)
        annotation (Line(
          points={{-28.4,-36},{-72,-36},{-72,86},{-102,86}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(geometry.vector_cylinder1, vector_1)
        annotation (Line(
          points={{-60.5714,49.7778},{-88,49.7778},{-88,37},{-107,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(geometry.vector_cylinder2, vector_2)
        annotation (Line(
          points={{-60.5714,45.3333},{-82,45.3333},{-82,-30},{-106,-30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(force.vector_cylinder2, vector_2)
        annotation (Line(
          points={{-29.6,-52},{-82,-52},{-82,-30},{-106,-30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(force.vector_cylinder1, vector_1)
        annotation (Line(
          points={{-29.6,-44},{-88,-44},{-88,37},{-107,37}},
          color={0,0,127},
          smooth=Smooth.None));

      force.enabled=true;
      geometry.enabled=true;
      connect(force.contact, contact) annotation (Line(
          points={{13.2,-48.4},{42,-48.4},{42,-2},{106,-2}},
          color={255,0,255},
          smooth=Smooth.None));
        annotation (Icon(graphics={                   Rectangle(extent={{-100,100},
                    {100,-100}}, lineColor={255,128,0}), Text(
                extent={{-80,10},{84,-10}},
                lineColor={0,0,255},
              textString="%name")}),                       Diagram(
              coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}),                                        graphics));
      end CylinderToCylinderPoint;

      model CylinderToCylinderLine
        extends IdealizedContact.Components.PartialContactBlock;

    public
        Components.MovePointCylinderToCylinderLine geometry[2](
        q={1,-1},
        f={f,f},
        animation={animation,animation},
        radiusContactPoint={radiusContactPoint,radiusContactPoint},
        Color_contact_point_cylinder1={colorContactPoints1,colorContactPoints1},
        Color_contact_point_cylinder2={colorContactPoints2,colorContactPoints2})
        "move point detection"
        annotation (Placement(transformation(extent={{-44,44},{-4,84}})));
        Components.ForceCylinderToCylinderLine force[2](
        c={springCoefficient,springCoefficient},
        d={dampingCoefficient,dampingCoefficient},
        n1={N1,N1},
        n2={N2,N2},
        t_max={p_max,p_max},
        f={f,f},
        mue_r={mue_r,mue_r},
        gamma1={gamma1,gamma1},
        gamma2={gamma2,gamma2},
        gamma3={gamma3,gamma3},
        gamma4={gamma4,gamma4},
        gamma5={gamma5,gamma5},
        gamma6={gamma6,gamma6}) annotation (Placement(transformation(extent={{10,-50},
                {50,-10}})));

      Modelica.Blocks.Logical.Or or1
        annotation (Placement(transformation(extent={{66,-36},{86,-16}})));
      equation
        assert((Modelica.Utilities.Strings.isEqual(surfaceType1,"cylindrical") and Modelica.Utilities.Strings.isEqual(surfaceType2,"cylindrical")),"Error in contact specification: Contact definition is CylinderToCylinder but other contact surfaces are connected to the contact block.",level=AssertionLevel.error);

      connect(geometry[1].frame_a1, frame_a) annotation (Line(
          points={{-44.4,71.6923},{-80,71.6923},{-80,86},{-102,86}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(geometry[2].frame_a1, frame_a) annotation (Line(
          points={{-44.4,71.6923},{-80,71.6923},{-80,86},{-102,86}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(geometry[1].frame_a2, frame_b) annotation (Line(
          points={{-44.4,53.2308},{-74,53.2308},{-74,-74},{-102,-74}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(geometry[2].frame_a2, frame_b) annotation (Line(
          points={{-44.4,53.2308},{-74,53.2308},{-74,-74},{-102,-74}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(geometry[1].vector_cylinder1, vector_1)
        annotation (Line(
          points={{-45.6,65.5385},{-92,65.5385},{-92,37},{-107,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(geometry[2].vector_cylinder1, vector_1)
        annotation (Line(
          points={{-45.6,65.5385},{-92,65.5385},{-92,37},{-107,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(geometry[1].vector_cylinder2, vector_2)
        annotation (Line(
          points={{-45.6,59.3846},{-84,59.3846},{-84,-30},{-106,-30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(geometry[2].vector_cylinder2, vector_2)
        annotation (Line(
          points={{-45.6,59.3846},{-84,59.3846},{-84,-30},{-106,-30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(geometry.frame_b2, force.frame_a3)
        annotation (Line(
          points={{-3.6,53.2308},{26,53.2308},{26,-9.6}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(geometry.frame_b1, force.frame_a4)
        annotation (Line(
          points={{-3.6,71.6923},{38,71.6923},{38,-9.6}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(force[1].frame_a2, frame_b)
        annotation (Line(
          points={{9.6,-42},{-52,-42},{-52,-74},{-102,-74}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(force[2].frame_a2, frame_b)
        annotation (Line(
          points={{9.6,-42},{-52,-42},{-52,-74},{-102,-74}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(force[1].vector_cylinder2, vector_2)
        annotation (Line(
          points={{8.4,-34},{-84,-34},{-84,-30},{-106,-30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(force[2].vector_cylinder2, vector_2)
        annotation (Line(
          points={{8.4,-34},{-84,-34},{-84,-30},{-106,-30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(force[1].vector_cylinder1, vector_1)
        annotation (Line(
          points={{8.4,-26},{-92,-26},{-92,37},{-107,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(force[2].vector_cylinder1, vector_1)
        annotation (Line(
          points={{8.4,-26},{-92,-26},{-92,37},{-107,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(force[1].frame_a1, frame_a)
        annotation (Line(
          points={{9.6,-18},{-80,-18},{-80,86},{-102,86}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(force[2].frame_a1, frame_a)
        annotation (Line(
          points={{9.6,-18},{-80,-18},{-80,86},{-102,86}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));

      force[1].enabled=true;
      force[2].enabled=true;
      geometry[1].enabled=true;
      geometry[2].enabled=true;
      connect(contact, or1.y) annotation (Line(
          points={{106,-2},{90,-2},{90,-26},{87,-26}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(force[1].contact, or1.u1) annotation (Line(
          points={{51.2,-30.4},{51.2,-24.77},{64,-24.77},{64,-26}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(force[2].contact, or1.u2) annotation (Line(
          points={{51.2,-30.4},{51.2,-34.77},{64,-34.77},{64,-34}},
          color={255,0,255},
          smooth=Smooth.None));
        annotation (Icon(graphics={                   Rectangle(extent={{-100,100},
                    {100,-100}}, lineColor={255,128,0}), Text(
                extent={{-80,10},{84,-10}},
                lineColor={0,0,255},
              textString="%name")}),                       Diagram(
              coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}),                                        graphics));
      end CylinderToCylinderLine;

      model CylinderToCylinderCombined
        extends IdealizedContact.Components.PartialContactBlock;
        extends Modelica.Icons.UnderConstruction;

    public
      Real Length_Direction1_wf[3];
      Real Length_Direction2_wf[3];

      Boolean enable2p;
        Components.MovePointCylinderToCylinderPoint geometry1(
        f=f,
        radiusContactPoint=radiusContactPoint,
        Color_contact_point_cylinder1=colorContactPoints1,
        Color_contact_point_cylinder2=colorContactPoints2,
        animation=animation) annotation (Placement(transformation(extent={{-60,28},{-20,68}})));
        Components.ForceCylinderToCylinderPoint force1(
        f=f,
        c=springCoefficient,
        d=dampingCoefficient,
        n1=N1,
        n2=N2,
        mue_r=mue_r,
        gamma1=gamma1,
        gamma2=gamma2,
        gamma3=gamma3,
        gamma4=gamma4,
        gamma5=gamma5,
        gamma6=gamma6,
        t_max=p_max) annotation (Placement(transformation(extent={{-28,-68},{12,-28}})));
    public
        Components.MovePointCylinderToCylinderLine geometry2[2](
        q={1,-1},
        f={f,f},
        animation={animation,animation},
        radiusContactPoint={radiusContactPoint,radiusContactPoint},
        Color_contact_point_cylinder1={colorContactPoints1,colorContactPoints1},
        Color_contact_point_cylinder2={colorContactPoints2,colorContactPoints2})
        "move point detection"
        annotation (Placement(transformation(extent={{40,48},{80,88}})));
        Components.ForceCylinderToCylinderLine force2[2](
        c={springCoefficient,springCoefficient},
        d={dampingCoefficient,dampingCoefficient},
        n1={N1,N1},
        n2={N2,N2},
        t_max={p_max,p_max},
        f={f,f},
        mue_r={mue_r,mue_r},
        gamma1={gamma1,gamma1},
        gamma2={gamma2,gamma2},
        gamma3={gamma3,gamma3},
        gamma4={gamma4,gamma4},
        gamma5={gamma5,gamma5},
        gamma6={gamma6,gamma6}) annotation (Placement(transformation(extent={{44,-14},
                  {84,26}})));
        Modelica.Blocks.Routing.DeMultiplex4 deMultiplex1(
          n1=3,
          n2=3,
          n3=3,
          n4=3) annotation (Placement(transformation(extent={{-38,-92},{-26,-80}})));
        Modelica.Blocks.Routing.DeMultiplex4 deMultiplex2(
          n1=3,
          n2=3,
          n3=3,
          n4=3) annotation (Placement(transformation(extent={{-20,-100},{-8,-88}})));
      equation
             assert((Modelica.Utilities.Strings.isEqual(surfaceType1,"cylindrical") and Modelica.Utilities.Strings.isEqual(surfaceType2,"cylindrical")),"Error in contact specification: Contact definition is CylinderToCylinder but other contact surfaces are connected to the contact block.",level=AssertionLevel.error);

      Length_Direction1_wf = Modelica.Mechanics.MultiBody.Frames.resolve1(frame_a.R,deMultiplex1.y1);
      Length_Direction2_wf = Modelica.Mechanics.MultiBody.Frames.resolve1(frame_b.R,deMultiplex2.y1);

      enable2p=abs(IdealizedContact.Components.VectorCalculations.angleBetweenTwoVectors(Length_Direction1_wf,Length_Direction2_wf))<0.01;
      force2[1].enabled=enable2p;
      force2[2].enabled=enable2p;
      geometry2[1].enabled=enable2p;
      geometry2[2].enabled=enable2p;
      force1.enabled=not enable2p;
      geometry1.enabled=not enable2p;
      if not enable2p then
        contact=force1.contact;
      else
        contact=force2[1].contact or force2[2].contact;
      end if;

      connect(geometry1.frame_b2, force1.frame_a3)
        annotation (Line(
          points={{-20.1429,32.4444},{-12,32.4444},{-12,-27.6}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(geometry1.frame_b1, force1.frame_a4)
        annotation (Line(
          points={{-20,61.7778},{0,61.7778},{0,-27.6}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(geometry1.frame_a1, frame_a) annotation (Line(
          points={{-60.2857,63.3333},{-66,63.3333},{-66,64},{-72,64},{-72,86},{
              -102,86}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(geometry1.frame_a2, frame_b) annotation (Line(
          points={{-59.5714,32.4444},{-76,32.4444},{-76,-74},{-102,-74}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(force1.frame_a2, frame_b)
        annotation (Line(
          points={{-28.4,-60},{-66,-60},{-66,-74},{-102,-74}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(force1.frame_a1, frame_a)
        annotation (Line(
          points={{-28.4,-36},{-72,-36},{-72,86},{-102,86}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(geometry1.vector_cylinder1, vector_1)
        annotation (Line(
          points={{-60.5714,49.7778},{-88,49.7778},{-88,37},{-107,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(geometry1.vector_cylinder2, vector_2)
        annotation (Line(
          points={{-60.5714,45.3333},{-82,45.3333},{-82,-30},{-106,-30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(force1.vector_cylinder2, vector_2)
        annotation (Line(
          points={{-29.6,-52},{-82,-52},{-82,-30},{-106,-30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(force1.vector_cylinder1, vector_1)
        annotation (Line(
          points={{-29.6,-44},{-88,-44},{-88,37},{-107,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(geometry2[1].frame_a1, frame_a) annotation (Line(
          points={{39.6,75.6923},{16,75.6923},{16,76},{-72,76},{-72,86},{-102,
              86}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(geometry2[2].frame_a1, frame_a) annotation (Line(
          points={{39.6,75.6923},{16,75.6923},{16,76},{-72,76},{-72,86},{-102,
              86}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(geometry2[1].frame_a2, frame_b) annotation (Line(
          points={{39.6,57.2308},{20,57.2308},{20,-74},{-102,-74}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(geometry2[2].frame_a2, frame_b) annotation (Line(
          points={{39.6,57.2308},{20,57.2308},{20,-6},{-76,-6},{-76,-74},{-102,
              -74}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(geometry2[1].vector_cylinder1, vector_1)
        annotation (Line(
          points={{38.4,69.5385},{4,69.5385},{4,37},{-107,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(geometry2[2].vector_cylinder1, vector_1)
        annotation (Line(
          points={{38.4,69.5385},{4,69.5385},{4,37},{-107,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(geometry2[1].vector_cylinder2, vector_2)
        annotation (Line(
          points={{38.4,63.3846},{12,63.3846},{12,2},{-64,2},{-64,-30},{-106,
              -30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(geometry2[2].vector_cylinder2, vector_2)
        annotation (Line(
          points={{38.4,63.3846},{12,63.3846},{12,2},{-64,2},{-64,-30},{-106,
              -30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(geometry2.frame_b2, force2.frame_a3)
        annotation (Line(
          points={{80.4,57.2308},{84,57.2308},{84,42},{60,42},{60,26.4}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(geometry2.frame_b1, force2.frame_a4)
        annotation (Line(
          points={{80.4,75.6923},{86,75.6923},{86,76},{92,76},{92,38},{72,38},{
              72,26.4}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(force2[1].frame_a2, frame_b)
        annotation (Line(
          points={{43.6,-6},{-76,-6},{-76,-74},{-102,-74}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(force2[2].frame_a2, frame_b)
        annotation (Line(
          points={{43.6,-6},{-76,-6},{-76,-74},{-102,-74}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(force2[1].vector_cylinder2, vector_2)
        annotation (Line(
          points={{42.4,2},{-64,2},{-64,-30},{-106,-30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(force2[2].vector_cylinder2, vector_2)
        annotation (Line(
          points={{42.4,2},{-64,2},{-64,-30},{-106,-30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(force2[1].vector_cylinder1, vector_1)
        annotation (Line(
          points={{42.4,10},{-16,10},{-16,37},{-107,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(force2[2].vector_cylinder1, vector_1)
        annotation (Line(
          points={{42.4,10},{-16,10},{-16,37},{-107,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(force2[1].frame_a1, frame_a) annotation (Line(
          points={{43.6,18},{16,18},{16,76},{-72,76},{-72,86},{-102,86}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(force2[2].frame_a1, frame_a) annotation (Line(
          points={{43.6,18},{16,18},{16,76},{-72,76},{-72,86},{-102,86}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
        connect(vector_1, deMultiplex1.u) annotation (Line(
            points={{-107,37},{-88,37},{-88,-86},{-39.2,-86}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(vector_2, deMultiplex2.u) annotation (Line(
            points={{-106,-30},{-82,-30},{-82,-94},{-21.2,-94}},
            color={0,0,127},
            smooth=Smooth.None));

        annotation (Icon(graphics={                   Rectangle(extent={{-100,100},
                    {100,-100}}, lineColor={255,128,0}), Text(
                extent={{-80,10},{84,-10}},
                lineColor={0,0,255},
              textString="%name")}),                       Diagram(coordinateSystem(
                preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
                                                                   graphics),
          Documentation(info="<!DOCTYPE html><html>
<p>The collision of two cylinders can lead to linear or punctiform contact regions. The calculation for these two cases is currently separated in two blocks. This attempts to integrate both.</p>
</html>"));
      end CylinderToCylinderCombined;

      package Components
      extends Modelica.Icons.BasesPackage;

        model MovePointCylinderToRectangle

          parameter Boolean exact=true;
          parameter Modelica.SIunits.Frequency f=10000000;
          parameter Real q=1 "1=left   -1=right";
          parameter Modelica.Mechanics.MultiBody.Types.Color
            Color_contact_point_rectangle = {255,0,255};
          parameter Modelica.Mechanics.MultiBody.Types.Color Color_contact_point_cylinder = {255,0,255};
          parameter Modelica.SIunits.Radius radiusContactPoint=0.005;
          final parameter Modelica.Mechanics.MultiBody.Types.Axis y_direction={0,1,0}
          "cartesian coordinate system in y direction -- direction of gravity";
          final parameter Modelica.Mechanics.MultiBody.Types.Axis x_direction={1,0,0};
          final parameter Modelica.Mechanics.MultiBody.Types.Axis z_direction=cross(x_direction, y_direction);
          parameter Boolean Animation=true;
          constant Real pi=Modelica.Constants.pi;

        // BCS2 - body coordinate system resolved in center of rectangle
        // BCS1 - body coordinate system resolved in center of cylinder mass
        // BCS2a - coordinate system resolved in BCS2 and in x direction(length direction cylinder) has the same orientation as BCS1
        // BCS1a - coordinate system resolved in center of cylinder face side based on BCS1
        // BCS3 - coordinate system resolved in cylinder contact point based in BCS1
        // BCS4 - coordinate system resolved in rectangle contact point based in BCS2

          Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a2
          "center of cylinder mass BCS1"
            annotation (Placement(transformation(extent={{-112,50},{-92,70}})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b2
          "contact point left/right cylinder BCS3 resolved in BCS1"
            annotation (Placement(transformation(extent={{148,50},{168,70}})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a1
          "center of rectangle BCS2"
                                  annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=0,
                origin={-102,-60})));
          Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP_p_lc(
              resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "relativ position center of cylinder top/bottom surface resolved in BCS2"
            annotation (Placement(transformation(
                extent={{-6,-6},{6,6}},
                rotation=90,
                origin={-60,6})));
          Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP_cc_mpr(
              resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "position move point right resolved in frame center of cylinder mass"
            annotation (Placement(transformation(
                extent={{-6,-6},{6,6}},
                rotation=270,
                origin={36,2})));
          Modelica.Blocks.Interfaces.RealOutput pos_rel_c_l[3]
          "relativ position center of cylinder top/bottom surface resolved in BCS2 (from rP_p_lc)"
            annotation (Placement(transformation(extent={{-8,-8},{8,8}},
                rotation=270,
                origin={18,-108})));
          Modelica.Blocks.Interfaces.RealInput vector_cylinder[12]
          "length_direction and radius and half_length"
            annotation (Placement(transformation(extent={{-8,-8},{8,8}},
                rotation=0,
                origin={-108,20}), iconTransformation(extent={{-116,12},{-100,28}})));

          Modelica.Mechanics.MultiBody.Sensors.TansformRelativeVector
            tansformRelativeVector(frame_r_in=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_b,
              frame_r_out=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "Transformation cylinder Length-Vektor from BCS-cylinder to BCS-rectangle"
            annotation (Placement(transformation(extent={{-6,-6},{6,6}},
                rotation=90,
                origin={-76,0})));
          Modelica.Blocks.Interfaces.RealOutput angles[3]     annotation (Placement(
                transformation(
                extent={{-8,-8},{8,8}},
                rotation=270,
                origin={-62,-108})));
          Modelica.Blocks.Interfaces.RealInput vector_rectangle[12]
          "length/width-direction and L_W_H"
            annotation (Placement(transformation(extent={{-8,-8},{8,8}},
                rotation=0,
                origin={-108,-20})));
      protected
          Real Length_Direction_c[3] "length direction cylinder";
          Real R_l[3] "radius and half-length cylinder";
          Real Length_Direction_R[3] "length direction rectangle";
          Real Width_Direction_R[3] "width-direction rectangle";
          Real Height_Direction_R[3] "height-direction rectangle";
          Real L_W_H[3];

          Real Length_Direction_Rc[3]
          "cylinder length direction resolved in BCS2";
          Real Length_Direction_Rc_otlw[3]
          "orthogonal projektion of Length_Direction_Rc on L-W-plane in BCS2";

          //angle_LotL - angle between Length_Direction_Rc_otlw and Length-vector rectangle resolved in BCS2
          //angle_LH - angle between Length-vector cylinder and Height-vector rectangle resolved in BCS2
          //angle_LotW - angle between Length_Direction_Rc_otlw and Width-vector rectangle resolved in BCS2

          Real rP_cymp_L;
          Real rP_cymp_W;
        //-----variable used to assign offset of move-point---------------------
        // public
          Real pos_rel_L
          "position cylinder contact point in length direction BCS2";
          Real pos_rel_W
          "position cylinder contact point in width direction BCS2";
          Real o_w;
          Real o_l;
          Real offset_l "offset contact point without limit";
          Real offset_ll
          "offset contact point with limit within +/- half-length of cylinder";
        //----------------------------------------------------------------------

      public
          IdealizedContact.Components.Utilities.variablePrism1 variablePrism_cy1
          "offset from center of cylinder mass to cylinder contact point BCS3"
            annotation (Placement(transformation(extent={{38,52},{54,68}})));
      public
          IdealizedContact.Components.Utilities.variablePrism1 variablePrism_cy
          "offset from center of cylinder mass to center of cylinder face side BCS1a resolved in BCS1"
            annotation (Placement(transformation(extent={{-10,-10},{10,10}},
                rotation=270,
                origin={-60,44})));
      public
          IdealizedContact.Components.Utilities.variablePrism1 variablePrism_rt1
          "offset from center of rectangle mass to center of cylinder face side resolved in BCS2"
            annotation (Placement(transformation(extent={{-52,-28},{-36,-12}})));
      public
          IdealizedContact.Components.Utilities.variablePrism1 variablePrism_rt2
          "offset from center of cylinder face side to contact point cylinder resolved in BCS2a"
            annotation (Placement(transformation(extent={{20,-28},{36,-12}})));

          IdealizedContact.Components.Utilities.variableRevol1 variableRevol_1
          "revolution from BCS2 to BCS2a in center point of cylinder face side resolved in BCS2"
            annotation (Placement(transformation(extent={{-28,-28},{-12,-12}})));
          IdealizedContact.Components.Utilities.variableRevol1 variableRevol_2
          "revolution from BCS2 to BCS2a in center point of cylinder face side resolved in BCS2"
            annotation (Placement(transformation(extent={{-4,-28},{12,-12}})));
          IdealizedContact.Components.VectorCalculations.angleBetweenTwoVectorsBlock
            angle_LotW
          "angle between Length_Direction_Rc_otlw and Length-vector rectangle resolved in BCS2"
            annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
          IdealizedContact.Components.VectorCalculations.angleBetweenTwoVectorsBlock
            angle_LH
          "angle_LH - angle between Length-vector cylinder and Height-vector rectangle resolved in BCS2"
            annotation (Placement(transformation(extent={{-20,80},{0,100}})));
          IdealizedContact.Components.VectorCalculations.angleBetweenTwoVectorsBlock
            angle_LotL
          "angle_LotW - angle between Length_Direction_Rc_otlw and Width-vector rectangle resolved in BCS2"
            annotation (Placement(transformation(extent={{20,80},{40,100}})));
          Modelica.Blocks.Routing.DeMultiplex4 deMultiplex2(
            n1=3,
            n2=3,
            n3=3,
            n4=3) annotation (Placement(transformation(extent={{-96,14},{-84,26}})));
          Modelica.Blocks.Routing.DeMultiplex4 deMultiplex3(
            n1=3,
            n2=3,
            n3=3,
            n4=3) annotation (Placement(transformation(extent={{-96,-26},{-84,
                    -14}})));
      public
          IdealizedContact.Components.Utilities.variablePrism1 variablePrism_mpr
          "from center of rectangle to contact point rectangle"
            annotation (Placement(transformation(extent={{32,-68},{48,-52}})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b1
          "contact point on recangle surface BCS4 based BCS2"
            annotation (Placement(transformation(extent={{146,-72},{170,-48}})));
          Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP_cc_mpcy(
              resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "position contact point cylinder resolved in BCS2"
            annotation (Placement(transformation(
                extent={{-6,-6},{6,6}},
                rotation=0,
                origin={-6,-40})));
          Modelica.Mechanics.MultiBody.Parts.PointMass contact_point_rectangle(
            m=0,
            animation=Animation,
            sphereColor=Color_contact_point_rectangle,
            sphereDiameter=2*radiusContactPoint)
            annotation (Placement(transformation(extent={{146,-42},{158,-30}})));
          Modelica.Blocks.Continuous.Filter filter(
            analogFilter=Modelica.Blocks.Types.AnalogFilter.Bessel,
            filterType=Modelica.Blocks.Types.FilterType.LowPass,
            order=2,
            f_cut=f) annotation (Placement(transformation(extent={{-60,68},{-40,88}})));
          Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP_ctc_BCS1a(
              resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "relativ position cylinder contact point resolved in BCS1a"
            annotation (Placement(transformation(
                extent={{-6,-6},{6,6}},
                rotation=0,
                origin={-8,26})));
          Modelica.Blocks.Interfaces.RealOutput pos_ctc_BCS1a[3]
          "relativ position cylinder contact point resolved in BCS1a (from rP_p_lc)"
            annotation (Placement(transformation(extent={{-8,-8},{8,8}},
                rotation=270,
                origin={54,-108})));
         Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP_cm_l(
             resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "relativ position cylindercontact point left/right resolved in BCS2"
           annotation (Placement(transformation(
               extent={{-6,-6},{6,6}},
               rotation=90,
               origin={104,-24})));
          Modelica.Mechanics.MultiBody.Parts.PointMass contact_point_cylinder(
            m=0,
            animation=Animation,
            sphereColor=Color_contact_point_cylinder,
            sphereDiameter=2*radiusContactPoint)
            annotation (Placement(transformation(extent={{140,80},{152,92}})));
           IdealizedContact.Components.Utilities.variablePrism2 variablePrism
            annotation (Placement(transformation(extent={{10,-10},{-10,10}},
                rotation=180,
                origin={124,60})));
          Modelica.Mechanics.Translational.Sources.Position pos_offset(
            useSupport=true,
            f_crit=f,
            exact=exact)
                        annotation (Placement(transformation(
                extent={{7,-7},{-7,7}},
                rotation=180,
                origin={119,33})));
        //         Real test,test2;
        equation
          R_l=deMultiplex2.y4;
          Length_Direction_c=deMultiplex2.y1;
          Length_Direction_R=deMultiplex3.y1;
          Width_Direction_R=deMultiplex3.y2;
          Height_Direction_R=deMultiplex3.y3;
          L_W_H=deMultiplex3.y4;

        //----------coordinate tranformation-----------------------------------------------------------------
          tansformRelativeVector.r_in=Length_Direction_c
          "input for Transformation cylinder Length-vector from BCS-cylinder to BCS-rectangle";
          Length_Direction_Rc=tansformRelativeVector.r_out;
        //---------------------------------------------------------------------------------------------------

        //----------orthogonal projektion--------------------------------------------------------------------
          Length_Direction_Rc_otlw = IdealizedContact.Components.VectorCalculations.orthogonalProjection(
                    Length_Direction_Rc,
                    Length_Direction_R,
                    Width_Direction_R);
        //----------------------------------------------------------------------------------------------------

        //----------rotation angle between vectors---------------------------------------------------------------------------------------
          angle_LotL.vector1=Length_Direction_Rc_otlw;
          angle_LotL.vector2=Length_Direction_R;

          angle_LotW.vector1=Length_Direction_Rc_otlw;
          angle_LotW.vector2=Width_Direction_R;

          angle_LH.vector1=Length_Direction_Rc;
          angle_LH.vector2=Height_Direction_R;

        //-------------------------------------------------------------------------------------------------------------------------------

        //----------offset from center of cylinder mass to center of cylinder face side BCS1a resolved in BCS1----------------------
          variablePrism_cy.s_ref=q*R_l[2];
          variablePrism_cy.n=-Length_Direction_c
          "offset center of cylinder mass to center of top/bottom surface along length-direction";
        //--------------------------------------------------------------------------------------------------------------------

        //----------*********************************************
          //rP_p_lc_L=rP_p_lc.r_rel*Length_Direction_R;
          //rP_p_lc_W=rP_p_lc.r_rel*Width_Direction_R;
          //rP_p_lc_H=rP_p_lc.r_rel*Height_Direction_R;

        //----------*********************************************

        //----------offset from center of rectangle mass to center of cylinder face side resolved in BCS2----------
          variablePrism_rt1.s_ref=sqrt(rP_p_lc.r_rel[1]^2+rP_p_lc.r_rel[2]^2+rP_p_lc.r_rel[3]^2);
          variablePrism_rt1.n=rP_p_lc.r_rel;
        //---------------------------------------------------------------------------------------------------------

        //----------revolution from BCS2 to BCS2a in center point of cylinder face side resolved in BCS2----------
          //variableRevol_1.phi_ref=(pi/2-angle_LotW.angle);
          variableRevol_1.phi_ref=if not exact then (pi/2-filter.y) else (pi/2-angle_LotW.angle);
          variableRevol_1.n=Height_Direction_R;

          variableRevol_2.phi_ref=(pi/2-angle_LH.angle);
          variableRevol_2.n=Width_Direction_R;
        //-------------------------------------------------------------------------------------------------------

        //----------offset from center of cylinder face side to contact point cylinder resolved in BCS2a-----------
          variablePrism_rt2.s_ref=R_l[1];
          variablePrism_rt2.n=-Height_Direction_R;
        //---------------------------------------------------------------------------------------------------------

        //----------transformation coordinate system in contact point cylinder from BCS2a to BCS1 (offset from center of cylinder mass to cylinder contact point)----------
          variablePrism_cy1.s_ref=sqrt(rP_cc_mpr.r_rel[1]^2+rP_cc_mpr.r_rel[2]^2+rP_cc_mpr.r_rel[3]^2);
          variablePrism_cy1.n=rP_cc_mpr.r_rel;
        //-----------------------------------------------------------------------------------------------------------------------------------------------------------------

        //----------from contact point cylinder to contact point rectangle(offset from center of rectangle to contact point on rectangle surface)-------------------------------------

         rP_cymp_L=smooth(2,if abs(rP_cc_mpcy.r_rel*Length_Direction_R)>L_W_H[1]/2 then L_W_H[1]/2 else abs(rP_cc_mpcy.r_rel*Length_Direction_R));
         rP_cymp_W=smooth(2,if abs(rP_cc_mpcy.r_rel*Width_Direction_R)>L_W_H[2]/2 then L_W_H[2]/2 else abs(rP_cc_mpcy.r_rel*Width_Direction_R));
         variablePrism_mpr.s_ref=sqrt(rP_cymp_L^2+rP_cymp_W^2);
        // variablePrism_mpr.n=rP_cc_mpcy.r_rel*Length_Direction_R*Length_Direction_R+rP_cc_mpcy.r_rel*Width_Direction_R*Width_Direction_R;
         variablePrism_mpr.n=smooth(2,sign(rP_cc_mpcy.r_rel*Length_Direction_R)*rP_cymp_L*Length_Direction_R + sign(rP_cc_mpcy.r_rel*Width_Direction_R)*rP_cymp_W*Width_Direction_R);
        //----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

        //----------offset contact point cylinder----------------------------------------------------------------------------------------------------
          pos_rel_L=rP_cm_l.r_rel*Length_Direction_R;
          pos_rel_W=rP_cm_l.r_rel*Width_Direction_R;

          o_w=smooth(2,((abs(pos_rel_W)-L_W_H[2]/2)*(sign(abs(pos_rel_W)-L_W_H[2]/2)+1)/2)/(abs(cos((pi/2-angles[1])*sign(abs(pi/2-angles[1])-pi/2)))*cos(pi/2-angles[3])));
        //   test=(pi/2-angles[2]);
        //   test2=sign(abs(pi/2-angles[2])-pi/2);
          o_l=smooth(2,((abs(pos_rel_L)-L_W_H[1]/2)*(sign(abs(pos_rel_L)-L_W_H[1]/2)+1)/2)/(abs(cos((pi/2-angles[2])*sign(abs(pi/2-angles[2])-pi/2)))*cos(pi/2-angles[3])));

          offset_l=smooth(2,max(o_w,o_l));
          offset_ll = smooth(2,if offset_l>2*R_l[2] then 2*R_l[2] else offset_l);

          pos_offset.s_ref=q*offset_ll;
          variablePrism.n=Length_Direction_c;
        //-------------------------------------------------------------------------------------------------------------------------------------------

        //----------connection to output--------------------------------------------------------
          pos_rel_c_l=rP_p_lc.r_rel;
          pos_ctc_BCS1a = rP_ctc_BCS1a.r_rel;
          //w_rel=aAV.w_rel;
          if angle_LotL.angle<10*Modelica.Constants.eps or (angle_LotL.angle>pi-10*Modelica.Constants.eps and angle_LotL.angle<10*Modelica.Constants.eps+pi) then
            angles[1]=0;
          else
            angles[1]=angle_LotL.angle;
          end if;
          if angle_LotW.angle<10*Modelica.Constants.eps or (angle_LotW.angle>pi-10*Modelica.Constants.eps and angle_LotW.angle<10*Modelica.Constants.eps+pi) then
            angles[2]=0;
          else
            angles[2]=angle_LotW.angle;
          end if;
          angles[3]=angle_LH.angle;
        //--------------------------------------------------------------------------------------

          connect(rP_p_lc.frame_a, frame_a1) annotation (Line(
              points={{-60,0},{-60,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));

          connect(tansformRelativeVector.frame_b, frame_a2) annotation (Line(
              points={{-76,6},{-76,60},{-102,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(tansformRelativeVector.frame_a, frame_a1) annotation (Line(
              points={{-76,-6},{-76,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_cc_mpr.frame_a, frame_a2) annotation (Line(
              points={{36,8},{36,60},{-102,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variablePrism_cy.frame_a, frame_a2) annotation (Line(
              points={{-60,54},{-60,60},{-102,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variablePrism_rt1.frame_a, frame_a1) annotation (Line(
              points={{-52,-20},{-60,-20},{-60,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variablePrism_rt2.frame_b, rP_cc_mpr.frame_b) annotation (Line(
              points={{36,-20},{36,-4}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variableRevol_2.frame_b, variablePrism_rt2.frame_a) annotation (Line(
              points={{12,-20},{20,-20}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variableRevol_1.frame_b, variableRevol_2.frame_a) annotation (Line(
              points={{-12,-20},{-4,-20}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variableRevol_1.frame_a, variablePrism_rt1.frame_b) annotation (Line(
              points={{-28,-20},{-36,-20}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variablePrism_cy.frame_b, rP_p_lc.frame_b) annotation (Line(
              points={{-60,34},{-60,12}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(deMultiplex2.u, vector_cylinder) annotation (Line(
              points={{-97.2,20},{-108,20}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(deMultiplex3.u, vector_rectangle) annotation (Line(
              points={{-97.2,-20},{-108,-20}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(variablePrism_mpr.frame_a, frame_a1) annotation (Line(
              points={{32,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variablePrism_mpr.frame_b, frame_b1) annotation (Line(
              points={{48,-60},{158,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_cc_mpcy.frame_b, variablePrism_cy1.frame_b) annotation (Line(
              points={{0,-40},{62,-40},{62,60},{54,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_cc_mpcy.frame_a, frame_a1) annotation (Line(
              points={{-12,-40},{-60,-40},{-60,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(contact_point_rectangle.frame_a, frame_b1)
                                                            annotation (Line(
              points={{152,-36},{152,-60},{158,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(filter.u, angle_LotW.angle) annotation (Line(
              points={{-62,78},{-70,78},{-70,95},{-80,95}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(variablePrism_cy1.frame_a, frame_a2) annotation (Line(
              points={{38,60},{-102,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_ctc_BCS1a.frame_a, variablePrism_cy.frame_b) annotation (Line(
              points={{-14,26},{-60,26},{-60,34}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_ctc_BCS1a.frame_b, variablePrism_cy1.frame_b) annotation (Line(
              points={{-2,26},{62,26},{62,60},{54,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(pos_offset.support,variablePrism. support) annotation (Line(
              points={{119,40},{120,40},{120,54}},
              color={0,0,0},
              pattern=LinePattern.None,
              smooth=Smooth.None));
          connect(variablePrism.axis,pos_offset. flange) annotation (Line(
              points={{132,54},{132,33},{126,33}},
              color={0,127,0},
              smooth=Smooth.None));
          connect(contact_point_cylinder.frame_a,variablePrism. frame_b)
            annotation (Line(
              points={{146,86},{146,60},{134,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_cm_l.frame_a, frame_a1) annotation (Line(
              points={{104,-30},{104,-86},{-76,-86},{-76,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variablePrism.frame_a, rP_cm_l.frame_b) annotation (Line(
              points={{114,60},{104,60},{104,-18}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variablePrism_cy1.frame_b, rP_cm_l.frame_b) annotation (Line(
              points={{54,60},{104,60},{104,-18}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variablePrism.frame_b, frame_b2) annotation (Line(
              points={{134,60},{158,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                extent={{-100,-100},{160,100}}),
                              graphics), Icon(coordinateSystem(extent={{-100,-100},{160,100}}),
                                              graphics));
        end MovePointCylinderToRectangle;

        model ForceCylinderToRectangle
          import SI = Modelica.SIunits;

        // parameter Boolean exact=true;
         parameter SI.Frequency f=10000000;
         parameter SI.TranslationalSpringConstant c=100000;
         parameter SI.TranslationalDampingConstant d=100000;
         parameter Real n1 = 1.5;
         parameter Real n2 = n1;
         parameter SI.CoefficientOfFriction mue_r=0.0001
          "rolling friction coefficient";
         parameter Real gamma1=1;
         parameter Real gamma2=1;
         parameter Real gamma3=1;
         parameter Real gamma4=1;
         parameter Real gamma5=1;
         parameter Real gamma6=1;
         parameter SI.Distance t_max=0.0001 "maximal penetration";
         parameter Real q=1 "1=left   -1=right";

      protected
         constant Real pi=Modelica.Constants.pi;
         final parameter Modelica.Mechanics.MultiBody.Types.Axis y_direction={0,1,0}
          "cartesian coordinate system in y direction -- direction of gravity";
         final parameter Modelica.Mechanics.MultiBody.Types.Axis x_direction={1,0,0}
          "cartesian coordinate system in x direction";
         final parameter Modelica.Mechanics.MultiBody.Types.Axis z_direction=cross(x_direction, y_direction);

        // BCS2 - body coordinate system resolved in center of rectangle
        // BCS1 - body coordinate system resolved in center of cylinder mass
        // BCS2a - coordinate system resolved in BCS2 and in x direction(length direction cylinder) has the same orientation as BCS1
        // BCS1a - coordinate system resolved in center of cylinder face side based on BCS1
        // BCS3 - coordinate system resolved in cylinder contact point based in BCS1
        // BCS4 - coordinate system resolved in rectangle contact point based in BCS2
         Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP_p_cpl(
             resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "relative position offset contact point cylinder resolved in BCS2"
           annotation (Placement(transformation(extent={{-6,-6},{6,6}},
               rotation=0,
               origin={-54,-42})));

         Modelica.Mechanics.MultiBody.Forces.Force f_l(resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a,
             animation=false)
          "force resolved in contact point on rectangle surface BCS4"
           annotation (Placement(transformation(
               extent={{-6,-6},{6,6}},
               rotation=0,
               origin={-54,-20})));

          Modelica.Blocks.Routing.DeMultiplex4 deMultiplex2(
            n1=3,
            n2=3,
            n3=3,
            n4=3) annotation (Placement(transformation(extent={{-94,-60},{-82,-48}})));
          Modelica.Blocks.Routing.DeMultiplex4 deMultiplex3(
            n1=3,
            n2=3,
            n3=3,
            n4=3) annotation (Placement(transformation(extent={{-94,-100},{-82,-88}})));
         IdealizedContact.Components.VectorCalculations.RelativeVelocities_ relativeVelocities_
            annotation (Placement(transformation(extent={{6,2},{-14,22}})));

          Real L_W_H[3] "length, width, height of rectangle";
          Real Length_Direction_R[3] "length direction rectangle";
          Real Width_Direction_R[3] "width direction rectangle";
          Real Height_Direction_R[3] "height direction rectangle";
          Real R_l[3] "radius and half-length cylinder";
          Real Length_Direction_C[3] "length direction cylinder";

        //-----variable used to assign offset of move-point---------------------
        //   Real pos_rel_L "position cylinder contact point in length direction BCS2";
        //   Real pos_rel_W "position cylinder contact point in width direction BCS2";
        //   Real o_w;
        //   Real o_l;
        //   Real offset_l "offset contact point without limit";
        //   Real offset_ll "offset contact point with limit within +/- half-length of cylinder";
        //----------------------------------------------------------------------
        //-----variable for contact detection-----------------------------------
      public
          Real pos_l_rel
          "position offset contact point cylinder in length direction BCS2";
          Real pos_w_rel
          "position offset contact point cylinder in width direction BCS2";
          Real pos_h_rel
          "position offset contact point cylinder in height direction BCS2";

        //----------------------------------------------------------------------

          Real v_rel_ct_BCS2[3]
          "relative velocity contact points resolved in BCS2";

          Real f_n "normal force in height direction BCS2";
          Real f_fl "friction in length direction BCS2";
          Real f_fw "friction in width direction BCS2";

      public
         Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_a1
          "contact point cylinder BCS3 based on BCS1"
           annotation (Placement(transformation(extent={{-12,-12},{12,12}},
               rotation=90,
               origin={12,102})));
         Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a3
          "center of rectangle BCS2"
           annotation (Placement(transformation(extent={{-12,-12},{12,12}},
               rotation=90,
               origin={12,-102})));
          Modelica.Blocks.Interfaces.BooleanOutput contact
            annotation (Placement(transformation(extent={{96,-12},{116,8}})));
          Modelica.Blocks.Interfaces.RealInput vector_rectangle[12]
          "length/width-direction and L_W_H"
            annotation (Placement(transformation(extent={{-8,-8},{8,8}},
                rotation=0,
                origin={-108,-94})));
          Modelica.Blocks.Interfaces.RealInput vector_cylinder[12]
          "length_direction and radius and half_length"
            annotation (Placement(transformation(extent={{-8,-8},{8,8}},
                rotation=0,
                origin={-108,-54})));

          Real f_normal[3] "normal force resolved in BCS2";
          Real f_tangential[3] "friction resolved in BCS2";
          Real penetration "penetration of contact surfaces at contact point";
          Real v_rel[3] "relative velocities at contact point";
        //----------------------------------------------------------------------

         Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_a2
          "contact point on recangle surface BCS4 based on BCS2"
           annotation (Placement(transformation(extent={{-12,-12},{12,12}},
               rotation=90,
               origin={-64,102})));

         Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a4
          "center of cylinder"
           annotation (Placement(transformation(extent={{-12,-12},{12,12}},
               rotation=90,
               origin={-46,-100})));

        equation
          Length_Direction_R=deMultiplex3.y1;
          Width_Direction_R=deMultiplex3.y2;
          Height_Direction_R=deMultiplex3.y3;
          L_W_H=deMultiplex3.y4;
          Length_Direction_C=deMultiplex2.y1;
          R_l=deMultiplex2.y4;

        //----------contact specification------------------------------------------------------------------------------------------------------------
          pos_l_rel=rP_p_cpl.r_rel*Length_Direction_R;
          pos_w_rel=rP_p_cpl.r_rel*Width_Direction_R;
          pos_h_rel=rP_p_cpl.r_rel*Height_Direction_R;
          contact = ((pos_h_rel <= 0) and (pos_h_rel >= -t_max)) and ((abs(pos_l_rel)<=0.0001) and ((abs(pos_w_rel)<=0.0001)));
        //-------------------------------------------------------------------------------------------------------------------------------------------

        //----------relative velocity resolved in BCS2-------------------------------------

          v_rel_ct_BCS2 = relativeVelocities_.v_rel;

        //--------------------------------------------------------------------------------

        //----------force resolved in BCS4----------------------------------------------------------------------------------------------------
          if (contact) then
            //normal force
            f_n = sign(pos_h_rel)*(c*abs(pos_h_rel)^n1)+d*abs(pos_h_rel)^n2*der(pos_h_rel);
            f_normal = -f_n*Height_Direction_R;

            //friction force
            //mue=gamma1*(tanh(gamma2*v_rel)-tanh(gamma3*v_rel))+gamma4*tanh(gamma5*v_rel)+gamma6*v_rel
            f_fl = (gamma1*(tanh(gamma2*v_rel_ct_BCS2*Length_Direction_R)-tanh(gamma3*v_rel_ct_BCS2*Length_Direction_R))+gamma4*tanh(gamma5*v_rel_ct_BCS2*Length_Direction_R)+gamma6*v_rel_ct_BCS2*Length_Direction_R)*abs(f_n);
            f_fw = (gamma1*(tanh(gamma2*v_rel_ct_BCS2*Width_Direction_R)-tanh(gamma3*v_rel_ct_BCS2*Width_Direction_R))+gamma4*tanh(gamma5*v_rel_ct_BCS2*Width_Direction_R)+gamma6*v_rel_ct_BCS2*Width_Direction_R)*abs(f_n);
            f_tangential = - f_fl*Length_Direction_R - f_fw*Width_Direction_R;
            penetration=abs(pos_h_rel);
            v_rel=v_rel_ct_BCS2;
          else
            f_n=0;
            f_fl=0;
            f_fw=0;
            f_normal = zeros(3);
            f_tangential = zeros(3);
            penetration=0;
            v_rel=zeros(3);
          end if;

          f_l.force=f_normal+f_tangential;

        //-----------------------------------------------------------------------------------------------------------------------------------
         connect(frame_a3, frame_a3) annotation (Line(
             points={{12,-102},{12,-102}},
             color={95,95,95},
             thickness=0.5,
             smooth=Smooth.None));
          connect(vector_cylinder, deMultiplex2.u) annotation (Line(
              points={{-108,-54},{-95.2,-54}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(vector_rectangle, deMultiplex3.u) annotation (Line(
              points={{-108,-94},{-95.2,-94}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(f_l.frame_a, frame_a2) annotation (Line(
              points={{-60,-20},{-64,-20},{-64,102}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_p_cpl.frame_a, f_l.frame_a) annotation (Line(
              points={{-60,-42},{-64,-42},{-64,-20},{-60,-20}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_p_cpl.frame_b, f_l.frame_b) annotation (Line(
              points={{-48,-42},{-40,-42},{-40,-20},{-48,-20}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(frame_a1, frame_a1)
            annotation (Line(
              points={{12,102},{12,102}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(frame_a2, frame_a2)
            annotation (Line(
              points={{-64,102},{-64,102}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(frame_a2, relativeVelocities_.frame1cp) annotation (Line(
              points={{-64,102},{-64,92},{-8.8,92},{-8.8,21.8}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(frame_a4, relativeVelocities_.frame2) annotation (Line(
              points={{-46,-100},{-46,-86},{2,-86},{2,2.2},{1.8,2.2}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(frame_a3, relativeVelocities_.frame1) annotation (Line(
              points={{12,-102},{12,30},{1.6,30},{1.6,22}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(frame_a1, relativeVelocities_.frame2cp) annotation (Line(
              points={{12,102},{10,102},{10,64},{26,64},{26,-20},{-8.6,-20},{-8.6,2.2}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(f_l.frame_b, relativeVelocities_.frame2cp) annotation (Line(
              points={{-48,-20},{-8.6,-20},{-8.6,2.2}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
         annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
                             graphics));
        end ForceCylinderToRectangle;

        model MovePointCylinderToCircle

          parameter Boolean exact=true;
          parameter Modelica.SIunits.Frequency f=100000;
          parameter Real q=1 "1=left   -1=right";
          final parameter Modelica.Mechanics.MultiBody.Types.Axis y_direction={0,1,0}
          "cartesian coordinate system in y direction -- direction of gravity";
          final parameter Modelica.Mechanics.MultiBody.Types.Axis x_direction={1,0,0};
          final parameter Modelica.Mechanics.MultiBody.Types.Axis z_direction=cross(x_direction, y_direction);

          constant Real pi=Modelica.Constants.pi;

        // BCS2 - body coordinate system resolved in center of circle
        // BCS1 - body coordinate system resolved in center of cylinder mass
        // BCS3 - coordinate system resolved in BCS2 and in x direction(length direction cylinder) has the same orientation as BCS1

          Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP_p_lc(
              resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "relativ position center of cylinder top/bottom surface resolved in center of circle"
            annotation (Placement(transformation(
                extent={{-6,-6},{6,6}},
                rotation=90,
                origin={-32,0})));
          Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP_cc_mpr(
              resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "position move point right resolved in frame center of cylinder mass"
            annotation (Placement(transformation(
                extent={{-6,-6},{6,6}},
                rotation=270,
                origin={50,0})));
          Modelica.Mechanics.MultiBody.Sensors.TansformRelativeVector
            tansformRelativeVector(frame_r_in=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_b,
              frame_r_out=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "Transformation cylinder Length-Vektor from BCS-cylinder to BCS-rectangle"
            annotation (Placement(transformation(extent={{-6,-6},{6,6}},
                rotation=90,
                origin={-72,0})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a2
          "center of cylinder mass BCS1"
            annotation (Placement(transformation(extent={{-112,50},{-92,70}})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b2
          "contact point cylinder BCS3 based on BCS1"
            annotation (Placement(transformation(extent={{92,50},{112,70}})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a1
          "center of circle BCS2" annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=0,
                origin={-102,-60})));
          Modelica.Blocks.Interfaces.RealOutput w_rel[3]
          "relative angular velocity contact point cylinder resolved in BCS1a (from aAV)"
            annotation (Placement(transformation(
                extent={{-8,-8},{8,8}},
                rotation=270,
                origin={-40,-108})));
          Modelica.Blocks.Interfaces.RealOutput pos_rel_c_l[3]
          "Relative position vector resolved in frame defined by resolveInFrame (from rP_p_lc)"
            annotation (Placement(transformation(extent={{-8,-8},{8,8}},
                rotation=270,
                origin={0,-108})));
          Modelica.Blocks.Interfaces.RealInput vector_cylinder[12]
          "length_direction and radius and half_length"
            annotation (Placement(transformation(extent={{-8,-8},{8,8}},
                rotation=0,
                origin={-108,20})));
          Modelica.Blocks.Interfaces.RealInput vector_circle[12]
            annotation (Placement(transformation(extent={{-8,-8},{8,8}},
                rotation=0,
                origin={-108,-20})));
          Modelica.Blocks.Interfaces.RealOutput angles[3] "angle_LL angle_LW"
                                                              annotation (Placement(
                transformation(
                extent={{-8,-8},{8,8}},
                rotation=270,
                origin={-80,-108})));

          Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP_c_cymp(
              resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "relativ position center of cylinder top/bottom surface resolved in center of rectangle surface"
            annotation (Placement(transformation(
                extent={{-6,-6},{6,6}},
                rotation=0,
                origin={2,-82})));
      protected
          Real Length_Direction_cy[3] "length direction cylinder";
          Real R_l[3] "radius and half-length cylinder";

          Real Dl_Direction_c[3] "diameter length direction circle";
          Real Dw_Direction_c[3] "diameter width direction circle";
          Real V_Direction_c[3] "vertical directiob circle";

          Real Length_Direction_Cyc[3]
          "cylinder length direction resolved in BCS circle";
          Real Length_Direction_Cyc_otlw[3]
          "orthogonal projektion of Length Direction cylinder on L-W-plane in BCS2";
          Real pos_rel_cymp[3]
          "relative position contact point cylinder resolved in BCS2";
          Real pos_rel_cymp_otlw[3]
          "orthogonal projektion of vector pos_rel_cymp on L-W-plane in BCS2";
          Real pos_cr_cy[3]
          "relative pocition center of cylinder mass resolved in BCS2";
          Real pos_cr_cy_otlw[3]
          "orthogonalprojektion of vector pos_cr_cy on L-W plane in BCS2";

          //Real angle_cyL_mp
            //"angles between cylinder length direction and relative position cylinder movepoint resolved in BCS circle";

          //angle_LV - angle between Length_Direction_Cyc and vertical-vector circle resolved in BCS circle
          //angle_LotDW - angle between Length_Direction_Cyc_otlw and circle diameter vector DW resolved in BCS circle

      public
          IdealizedContact.Components.VectorCalculations.angleBetweenTwoVectorsBlock
            angle_LV
          "angle between Length Direction cylinder and vertical-vector circle resolved in BCS2"
            annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
          IdealizedContact.Components.VectorCalculations.angleBetweenTwoVectorsBlock
            angle_LotDW
          "angle between the othogonal projection of Length Direction Cylinder on circle and circle diameter vector DW resolved in BCS2"
            annotation (Placement(transformation(extent={{-60,80},{-40,100}})));
      public
          IdealizedContact.Components.Utilities.variablePrism1 variablePrism_cy
          "offset from center of cylinder mass to center of cylinder face side BCS1a resolved in BCS1"
            annotation (Placement(transformation(extent={{-10,-10},{10,10}},
                rotation=270,
                origin={-32,40})));
          Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP_cr_cy(
              resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "relativ position center of cylinder top/bottom surface resolved in center of circle"
            annotation (Placement(transformation(
                extent={{-6,-6},{6,6}},
                rotation=90,
                origin={-52,0})));
          IdealizedContact.Components.Utilities.variablePrism1 variablePrism_cy1
          "offset from center of cylinder mass to cylinder contact point BCS3"
            annotation (Placement(transformation(extent={{62,52},{78,68}})));
          IdealizedContact.Components.Utilities.variablePrism1 variablePrism_rt2
            annotation (Placement(transformation(extent={{30,-66},{42,-54}})));
          IdealizedContact.Components.Utilities.variableRevol1 variableRevol_2
            annotation (Placement(transformation(extent={{10,-66},{22,-54}})));
          IdealizedContact.Components.Utilities.variableRevol1 variableRevol_1
            annotation (Placement(transformation(extent={{-12,-66},{0,-54}})));
          IdealizedContact.Components.Utilities.variablePrism1 variablePrism_rt1
            annotation (Placement(transformation(extent={{-32,-66},{-20,-54}})));
          IdealizedContact.Components.VectorCalculations.angleBetweenTwoVectorsBlock
            angle_cyL_mp(t=0)
          "angle between orthogonal projektion of vector pos_rel_cymp on L-W-plane in BCS2 and orthogonal projektion of Length_Direction_Cyc on L-W-plane in BCS2"
            annotation (Placement(transformation(extent={{20,80},{40,100}})));
          Modelica.Blocks.Routing.DeMultiplex4 deMultiplex2(
            n1=3,
            n2=3,
            n3=3,
            n4=3) annotation (Placement(transformation(extent={{-96,14},{-84,26}})));
          Modelica.Blocks.Routing.DeMultiplex4 deMultiplex3(
            n1=3,
            n2=3,
            n3=3,
            n4=3) annotation (Placement(transformation(extent={{-96,-26},{-84,-14}})));
          Modelica.Blocks.Continuous.Filter filter(
            analogFilter=Modelica.Blocks.Types.AnalogFilter.Bessel,
            filterType=Modelica.Blocks.Types.FilterType.LowPass,
            order=2,
            f_cut=f) annotation (Placement(transformation(extent={{-20,80},{0,100}})));
          Modelica.Mechanics.MultiBody.Sensors.RelativeAngularVelocity aAV(
              resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "relative angular velocity contact point cylinder resolved in BCS1a"
            annotation (Placement(transformation(
                extent={{-6,-6},{6,6}},
                rotation=0,
                origin={86,16})));
          Modelica.Blocks.Interfaces.RealOutput pos_ctc_BCS1a[3]
          "relativ position cylinder contact point resolved in BCS1a (from rP_p_lc)"
            annotation (Placement(transformation(extent={{-8,-8},{8,8}},
                rotation=270,
                origin={40,-108})));
          Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP_ctc_BCS1a(
              resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "relativ position cylinder contact point resolved in BCS1a"
            annotation (Placement(transformation(
                extent={{-6,-6},{6,6}},
                rotation=0,
                origin={4,24})));
        equation

          R_l=deMultiplex2.y4;
          Length_Direction_cy=deMultiplex2.y1;
          V_Direction_c=deMultiplex3.y1;
          Dw_Direction_c=deMultiplex3.y2;
          Dl_Direction_c=deMultiplex3.y3;

        //-----------vector transformation----------------------------------------------------------------
          tansformRelativeVector.r_in=Length_Direction_cy
          "input for vector Transformation";
          Length_Direction_Cyc=tansformRelativeVector.r_out;
        //------------------------------------------------------------------------------------------------

        //-----------orthogonal projektion----------------------------------------------------------------
          pos_cr_cy=rP_cr_cy.r_rel;
          pos_cr_cy_otlw =
            IdealizedContact.Components.VectorCalculations.orthogonalProjection(
                    pos_cr_cy,
                    Dl_Direction_c,
                    Dw_Direction_c);

          Length_Direction_Cyc_otlw =
            IdealizedContact.Components.VectorCalculations.orthogonalProjection(
                    Length_Direction_Cyc,
                    Dl_Direction_c,
                    Dw_Direction_c);

          pos_rel_cymp=rP_c_cymp.r_rel;
          pos_rel_cymp_otlw =
            IdealizedContact.Components.VectorCalculations.orthogonalProjection(
                    pos_rel_cymp,
                    Dl_Direction_c,
                    Dw_Direction_c);
        //------------------------------------------------------------------------------------------------

        //-----------angles between vectors---------------------------------------------------------------
          angle_LV.vector1=Length_Direction_Cyc;
          angle_LV.vector2=V_Direction_c;

          angle_LotDW.vector1=Length_Direction_Cyc_otlw;
          angle_LotDW.vector2=Dw_Direction_c;

          angle_cyL_mp.vector1 = smooth(2, if pos_cr_cy_otlw[1]^2+pos_cr_cy_otlw[2]^2+pos_cr_cy_otlw[3]^2>Modelica.Constants.eps then pos_rel_cymp_otlw else Modelica.Constants.eps*pos_rel_cymp_otlw);
          //angle_cyL_mp.vector1 = smooth(2, if pos_rel_cymp_otlw[1]^2+pos_rel_cymp_otlw[2]^2+pos_rel_cymp_otlw[3]^2>Modelica.Constants.eps then pos_rel_cymp_otlw else Modelica.Constants.eps*pos_rel_cymp_otlw);
          angle_cyL_mp.vector2=Length_Direction_Cyc_otlw;

        //------------------------------------------------------------------------------------------------

        //----------offset from center of cylinder mass to center of cylinder face side resolved in BCS1----------
          variablePrism_cy.s_ref=q*R_l[2];
          variablePrism_cy.n=-Length_Direction_cy
          "offset center of cylinder mass to center of top/bottom surface along length-direction";
        //--------------------------------------------------------------------------------------------------------

        //----------offset from center of circle mass to center of cylinder face side resolved in BCS2------------
          //pos_rt1.s_ref=sqrt(rP_p_lc.r_rel[1]^2+rP_p_lc.r_rel[2]^2+rP_p_lc.r_rel[3]^2);
          variablePrism_rt1.s_ref=sqrt(rP_p_lc.r_rel[1]^2+rP_p_lc.r_rel[2]^2+rP_p_lc.r_rel[3]^2);
          variablePrism_rt1.n=rP_p_lc.r_rel;
        //--------------------------------------------------------------------------------------------------------

        //----------revolution from BCS2 in center of cylinder face side to BCS3 resolved in BCS2-----------------
          //angle_1.phi_ref=(pi/2-angle_LotDW.angle);
          variableRevol_1.phi_ref=(pi/2-filter.y);
          variableRevol_1.n=V_Direction_c;

          //angle_2.phi_ref=(pi/2-angle_LV.angle);
          variableRevol_2.phi_ref=(pi/2-angle_LV.angle);
          variableRevol_2.n=Dw_Direction_c;
        //--------------------------------------------------------------------------------------------------------

        //----------offset from center of cylinder face side to move point cylinder resolved in BCS3--------------
          //pos_rt2.s_ref=R_l[1];
          variablePrism_rt2.s_ref=R_l[1];
          variablePrism_rt2.n=-V_Direction_c;
        //--------------------------------------------------------------------------------------------------------

        //----------transformation coordinate system of move point cylinder from BCS3 to BCS1---------------------
          //pos_cy1.s_ref=sqrt(rP_cc_mpr.r_rel[1]^2+rP_cc_mpr.r_rel[2]^2+rP_cc_mpr.r_rel[3]^2);
          variablePrism_cy1.s_ref=sqrt(rP_cc_mpr.r_rel[1]^2+rP_cc_mpr.r_rel[2]^2+rP_cc_mpr.r_rel[3]^2);
          variablePrism_cy1.n=rP_cc_mpr.r_rel;
        //--------------------------------------------------------------------------------------------------------

        //-----------connection to output-------------------------------------------------
          pos_rel_c_l=rP_p_lc.r_rel;
          pos_ctc_BCS1a = rP_ctc_BCS1a.r_rel;
          w_rel=aAV.w_rel;
          angles[1]=angle_cyL_mp.angle;
          angles[2]=angle_LotDW.angle;
          angles[3]=angle_LV.angle;
        //--------------------------------------------------------------------------------
          connect(rP_p_lc.frame_a,frame_a1)  annotation (Line(
              points={{-32,-6},{-32,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(tansformRelativeVector.frame_b,frame_a2)  annotation (Line(
              points={{-72,6},{-72,60},{-102,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(tansformRelativeVector.frame_a,frame_a1)  annotation (Line(
              points={{-72,-6},{-72,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_c_cymp.frame_a, frame_a1) annotation (Line(
              points={{-4,-82},{-32,-82},{-32,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_cc_mpr.frame_a, frame_a2) annotation (Line(
              points={{50,6},{50,60},{-102,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variablePrism_cy.frame_a, frame_a2) annotation (Line(
              points={{-32,50},{-32,60},{-102,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variablePrism_cy.frame_b, rP_p_lc.frame_b) annotation (Line(
              points={{-32,30},{-32,6}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_cr_cy.frame_a, frame_a1) annotation (Line(
              points={{-52,-6},{-52,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_cr_cy.frame_b, frame_a2) annotation (Line(
              points={{-52,6},{-52,60},{-102,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variablePrism_cy1.frame_b, frame_b2) annotation (Line(
              points={{78,60},{102,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variablePrism_cy1.frame_a, frame_a2) annotation (Line(
              points={{62,60},{-102,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variableRevol_2.frame_b, variablePrism_rt2.frame_a) annotation (Line(
              points={{22,-60},{30,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variableRevol_1.frame_b, variableRevol_2.frame_a) annotation (Line(
              points={{0,-60},{10,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variablePrism_rt1.frame_b, variableRevol_1.frame_a) annotation (Line(
              points={{-20,-60},{-12,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variablePrism_rt1.frame_a, frame_a1) annotation (Line(
              points={{-32,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_cc_mpr.frame_b, variablePrism_rt2.frame_b) annotation (Line(
              points={{50,-6},{50,-60},{42,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variablePrism_rt2.frame_b, rP_c_cymp.frame_b) annotation (Line(
              points={{42,-60},{50,-60},{50,-82},{8,-82}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(deMultiplex2.u, vector_cylinder) annotation (Line(
              points={{-97.2,20},{-108,20}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(deMultiplex3.u, vector_circle) annotation (Line(
              points={{-97.2,-20},{-108,-20}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(filter.u, angle_LotDW.angle) annotation (Line(
              points={{-22,90},{-34,90},{-34,95},{-40,95}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(aAV.frame_b, variablePrism_cy1.frame_b)  annotation (Line(
              points={{92,16},{92,60},{78,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(aAV.frame_a, variablePrism_cy.frame_b)  annotation (Line(
              points={{80,16},{-32,16},{-32,30}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_ctc_BCS1a.frame_a, variablePrism_cy.frame_b) annotation (Line(
              points={{-2,24},{-32,24},{-32,30}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_ctc_BCS1a.frame_b, variablePrism_cy1.frame_b) annotation (Line(
              points={{10,24},{78,24},{78,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          annotation (Diagram(graphics));
        end MovePointCylinderToCircle;

        model ForceCylinderToCircle
          import SI = Modelica.SIunits;
         parameter Boolean exact=true;
         parameter SI.Frequency f=10000000;
         parameter SI.TranslationalSpringConstant c=100000;
         parameter SI.TranslationalDampingConstant d=100000;
          parameter Real n1 = 1.5;
          parameter Real n2 = n1;
          parameter SI.CoefficientOfFriction mue_r=0.0001
          "rolling friction coefficient";
          parameter Real gamma1=1;
          parameter Real gamma2=1;
          parameter Real gamma3=1;
          parameter Real gamma4=1;
          parameter Real gamma5=1;
          parameter Real gamma6=1;
         parameter SI.Distance t_max=0.0001 "maximal depth of impression";
         parameter Real q=1 "1=left   -1=right";
         constant Real pi=Modelica.Constants.pi;
         final parameter Modelica.Mechanics.MultiBody.Types.Axis y_direction={0,1,0}
          "cartesian coordinate system in y direction -- direction of gravity";
         final parameter Modelica.Mechanics.MultiBody.Types.Axis x_direction={1,0,0}
          "cartesian coordinate system in x direction";
         final parameter Modelica.Mechanics.MultiBody.Types.Axis z_direction=cross(x_direction, y_direction);

          parameter Boolean Animation=true;
          parameter Modelica.SIunits.Radius radiusContactPoint=0.005;
          parameter Modelica.Mechanics.MultiBody.Types.Color
            Color_contact_point_cylinder =                                                {0,180,0};
          parameter Modelica.Mechanics.MultiBody.Types.Color
            Color_contact_point_circle =                                                {255,0,255};
        // BCS2 - body coordinate system resolved in center of circle
        // BCS1 - body coordinate system resolved in center of cylinder mass
        // BCS3 - coordinate system resolved in BCS2 and in x direction(length direction cylinder) has the same orientation as BCS1
        // BCS2a - coordinate system resolved in BCS2 and in x direction(length direction cylinder) has the same orientation as BCS1
        // BCS1a - coordinate system resolved in center of cylinder face side based on BCS1

         Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP_cm_l(
             resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "relativ position cylinder move point resolved in BCS2"
           annotation (Placement(transformation(
               extent={{-6,-6},{6,6}},
               rotation=90,
               origin={0,-40})));
         Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP_p_cpl(
             resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "relative position contact point resolved in BCS2"
           annotation (Placement(transformation(extent={{-6,-6},{6,6}},
               rotation=90,
               origin={60,-40})));
         Modelica.Mechanics.MultiBody.Sensors.AbsoluteAngles aA(sequence={1,2,3})
          "absolut rotation angles of frame center of planar surface yd via 'sequence'"
           annotation (Placement(transformation(extent={{22,-108},{34,-96}})));
         Modelica.Mechanics.MultiBody.Forces.Force f_l(resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a,
             animation=false) "force resolved in BCS2"
           annotation (Placement(transformation(
               extent={{-6,-6},{6,6}},
               rotation=90,
               origin={80,-40})));
         Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a1
          "cylinder contact point resolved in BCS1"
           annotation (Placement(transformation(extent={{-12,-12},{12,12}},
               rotation=90,
               origin={0,102})));
         Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a3
          "frame center of circle BCS2"
           annotation (Placement(transformation(extent={{-12,-12},{12,12}},
               rotation=90,
               origin={0,-102})));
         Modelica.Blocks.Interfaces.RealInput w_rel[3]
          "Absolute angular velocity center of cylinder mass resolved in world frame"
           annotation (Placement(transformation(extent={{-112,12},{-100,24}})));
         Modelica.Blocks.Interfaces.RealInput pos_rel_c_L[3]
          "Relative position center of cylinder left side resolved BCS circle yd"
           annotation (Placement(transformation(extent={{-6,-6},{6,6}},
               rotation=0,
               origin={-106,58})));
      public
         Modelica.Blocks.Interfaces.BooleanOutput contact annotation (Placement(
               transformation(
               extent={{-7,-7},{7,7}},
               rotation=0,
               origin={107,61})));
         Modelica.Blocks.Interfaces.RealInput angles[3]
          "angle_cyL_mp(angles between cylinder length direction and relative position cylinder movepoint resolved in BCS circle) & angle_LotDW & angle_LH"
           annotation (Placement(transformation(extent={{-112,-28},{-100,-16}})));
          Modelica.Blocks.Interfaces.RealInput vector_circle[12]
            annotation (Placement(transformation(extent={{-8,-8},{8,8}},
                rotation=0,
                origin={-108,-94})));
          Modelica.Blocks.Interfaces.RealInput vector_cylinder[12]
          "length_direction and radius and half_length"
            annotation (Placement(transformation(extent={{-8,-8},{8,8}},
                rotation=0,
                origin={-108,-54})));
          Modelica.Mechanics.MultiBody.Parts.PointMass contact_point_cylinder(
            m=0,
            animation=Animation,
            sphereColor=Color_contact_point_cylinder,
            sphereDiameter=2*radiusContactPoint)
            annotation (Placement(transformation(extent={{72,-12},{84,0}})));

          Real r[3] "radius circle";
          Real Dl_Direction_c[3] "diameter length direction circle";
          Real Dw_Direction_c[3] "diameter width direction circle";
          Real V_Direction_c[3] "vertical direction circle";
          Real R_l[3] "radius and half-length cylinder";
          Real Length_Direction_cy[3] "length direction cylinder";

        //----------------------------------------------------------------------
        // variable used to assign offset of move-point
        //----------------------------------------------------------------------
         Real dl_rel_mp
          "relative position move point cylinder in dl-direction resolved in BCS2";
         Real dw_rel_mp
          "relative position move point cylinder in dw-direction resolved in BCS2";
         Real pos_lw
          "distance between contact cylinder and center of circle resolved in BCS2";
         Real offset_l "offset contact point without limit";
         Real offset_ll
          "offset contact point with limit within +/- half-length of cylinder";

        //----------------------------------------------------------------------
        // variable for contact detection
        //----------------------------------------------------------------------
         Real dl_rel_op
          "relative position offset contact point cylinder in dl-direction resolved in BCS2";
         Real dw_rel_op
          "relative position offset contact point cylinder in dw-direction resolved in BCS2";
         Real dv_rel_op
          "relative position offset contact point cylinder in v-direction resolved in BCS2";

        //----------------------------------------------------------------------
        // variable to calculate contact force
        //----------------------------------------------------------------------
        //  Real dl_rel_cs
        //     "relative position center of cylinder face side in dl-direction resolved in BCS2";
        //  Real dw_rel_cs
        //     "relative position center of cylinder face side in dw-direction resolved in BCS2";
        //  Real dv_rel_cs
        //     "relative position center of cylinder face side in v-direction resolved in BCS2";
        //  Real v_rel[3] "relative velocity contact point resolved in BCS2";
        //  Real v_r[3]
        //     "rotational velocity only around length direction cylinder resolved in BCS2";
          Real r_ctc_BCS1a[3]
          "position contact point cylinder resolved in BCS1a";
          Real v_cf_BCS2[3]
          "velocity center of cylinder face side resolved in BCS2";
          Real v_ctc_BCS2[3] "velocity contact point cylinder resolved in BCS2";
          Real T_BCS12[3,3]
          "Transmation matrix from orientation objekt to rotate BCS1a into BCS4(BCS2)";
          Real v_rel_ct_BCS2[3]
          "relative velocity contact points resolved in BCS2";

         Real angles_absl_p[3] "absolute angles between BCS2 and ICS";

         Real f_n "normal force in v-direction BCS2";
         Real f_dl "friction in dl-direction BCS2";
         Real f_dw "friction in dw-direction BCS2";

         Real f_normal[3] "normal force resolved in BCS2";
         Real f_tangential[3] "friction resolved in BCS2";

          IdealizedContact.Components.VectorCalculations.cosineRulesBlock cosineRules
            annotation (Placement(transformation(extent={{-60,80},{-40,100}})));
          IdealizedContact.Components.Utilities.variablePrism2  variablePrism
            annotation (Placement(transformation(extent={{20,-30},{40,-10}})));
          Modelica.Mechanics.Translational.Sources.Position pos_offset(
            useSupport=true,
            f_crit=f,
            exact=exact)
                        annotation (Placement(transformation(
                extent={{-7,-7},{7,7}},
                rotation=0,
                origin={27,-1})));
          Modelica.Blocks.Routing.DeMultiplex4 deMultiplex2(
            n1=3,
            n2=3,
            n3=3,
            n4=3) annotation (Placement(transformation(extent={{-94,-60},{-82,-48}})));
          Modelica.Blocks.Routing.DeMultiplex4 deMultiplex3(
            n1=3,
            n2=3,
            n3=3,
            n4=3) annotation (Placement(transformation(extent={{-94,-100},{-82,-88}})));
         Modelica.Blocks.Interfaces.RealInput pos_ctc_BCS1a[3]
          "relativ position cylinder contact point resolved in BCS1a (from rP_p_lc)"
           annotation (Placement(transformation(extent={{-6,-6},{6,6}},
               rotation=0,
               origin={-106,88})));
        equation
          V_Direction_c=deMultiplex3.y1;
          Dw_Direction_c=deMultiplex3.y2;
          Dl_Direction_c=deMultiplex3.y3;
          r=deMultiplex3.y4;
          Length_Direction_cy=deMultiplex2.y1;
          R_l=deMultiplex2.y4;

          r_ctc_BCS1a = pos_ctc_BCS1a;
          v_cf_BCS2 = der(pos_rel_c_L);
          T_BCS12 = Modelica.Mechanics.MultiBody.Frames.to_T(Modelica.Mechanics.MultiBody.Frames.relativeRotation(frame_a1.R, frame_a3.R));
        //----------cosine rules----------
          //cosineRules.a = r[1];
          cosineRules.a = pos_lw;
          cosineRules.b = r[1];
          cosineRules.beta = angles[1];
          //cosineRules.beta = 0;
        //--------------------------------

        //----------offset of contact point cylinder-------------------------------------------
          dl_rel_mp = rP_cm_l.r_rel*Dl_Direction_c;
          dw_rel_mp = rP_cm_l.r_rel*Dw_Direction_c;
          pos_lw=sqrt((dl_rel_mp)^2+(dw_rel_mp)^2);

          offset_l = smooth(2, if pos_lw>r[1] then cosineRules.c*cos(pi/2 - angles[3]) else 0);

          offset_ll = smooth(2, if offset_l>2*R_l[2] then 2*R_l[2] else offset_l);

          pos_offset.s_ref=q*offset_ll;
          variablePrism.n=Length_Direction_cy;
        //--------------------------------------------------------------------------------------

        //----------contact specification----------------------------------------------------------------------------
          dl_rel_op=rP_p_cpl.r_rel*Dl_Direction_c;
          dv_rel_op=rP_p_cpl.r_rel*V_Direction_c;
          dw_rel_op=rP_p_cpl.r_rel*Dw_Direction_c;
          contact = (dv_rel_op <= 0) and (dv_rel_op >= -t_max) and (sqrt((dl_rel_op)^2+(dw_rel_op)^2)<=r[1]+0.001);
        //-----------------------------------------------------------------------------------------------------------

        //----------relative velocity resolved in BCS2---------------------------------------------------------------
        //   dl_rel_cs =  pos_rel_c_L*Dl_Direction_c;
        //   dw_rel_cs =  pos_rel_c_L*Dw_Direction_c;
        //   dv_rel_cs =  pos_rel_c_L*V_Direction_c;

        //   v_r[1]=w_rel*Dw_Direction_c*R_l[1]
        //     "rotation velocity around Dw-direction in Dl-direction resolved in BCS2";
        //   v_r[2]=0 "rotation velocity around v-direction BCS2 is neglected";
        //   v_r[3]=w_rel*Dl_Direction_c*R_l[1]
        //     "rotation velocity around Dl-direction in Dw-direction resolved in BCS2";
        //
        //   v_rel[1]=der(dl_rel_cs)-(v_r[1]) "relative velocity in Dl-direction BCS2";
        //   v_rel[2]=0 "v_rel in V-direction is neglected";
        //   v_rel[3]=der(dw_rel_cs)-(v_r[3]) "relative velocity in Dw-direction BCS2";

           v_ctc_BCS2 = v_cf_BCS2 + T_BCS12*cross(w_rel, r_ctc_BCS1a);
           v_rel_ct_BCS2 = zeros(3) - v_ctc_BCS2;
           angles_absl_p=aA.angles;
        //-----------------------------------------------------------------------------------------------------------

        //----------contact force------------------------------------------------------------------------------------
          //f_n = c*(dv_rel_op)+d*der(dv_rel_op);
          f_n = sign(dv_rel_op)*(c*abs(dv_rel_op)^n1)+d*abs(dv_rel_op)^n2*der(dv_rel_op);

          //mue=gamma1*(tanh(gamma2*v_rel)-tanh(gamma3*v_rel))+gamma4*tanh(gamma5*v_rel)+gamma6*v_rel
        //  f_dl = (gamma1*(tanh(gamma2*v_rel[1])-tanh(gamma3*v_rel[1]))+gamma4*tanh(gamma5*v_rel[1])+gamma6*v_rel[1])*(f_n)*cos(abs(angles_absl_p[3])) + mue_r*tanh(v_rel[1]*gamma2)*(f_n)*cos(abs(angles_absl_p[3]));
        //  f_dw = (gamma1*(tanh(gamma2*v_rel[3])-tanh(gamma3*v_rel[3]))+gamma4*tanh(gamma5*v_rel[3])+gamma6*v_rel[3])*(f_n)*cos(abs(angles_absl_p[1])) + mue_r*tanh(v_rel[3]*gamma2)*(f_n)*cos(abs(angles_absl_p[1]));
          f_dl = (gamma1*(tanh(gamma2*v_rel_ct_BCS2[1])-tanh(gamma3*v_rel_ct_BCS2[1]))+gamma4*tanh(gamma5*v_rel_ct_BCS2[1])+gamma6*v_rel_ct_BCS2[1])*abs(f_n)*cos(abs(angles_absl_p[3])) + mue_r*tanh(v_rel_ct_BCS2[1]*gamma2)*abs(f_n)*cos(abs(angles_absl_p[3]));
          f_dw = (gamma1*(tanh(gamma2*v_rel_ct_BCS2[3])-tanh(gamma3*v_rel_ct_BCS2[3]))+gamma4*tanh(gamma5*v_rel_ct_BCS2[3])+gamma6*v_rel_ct_BCS2[3])*abs(f_n)*cos(abs(angles_absl_p[1])) + mue_r*tanh(v_rel_ct_BCS2[3]*gamma2)*abs(f_n)*cos(abs(angles_absl_p[1]));

          if (contact) then
            f_normal = -f_n*V_Direction_c;
            f_tangential = f_dl*Dl_Direction_c +f_dw*Dw_Direction_c;
          else
            f_normal = zeros(3);
            f_tangential = zeros(3);
          end if;

           f_l.force=f_normal+f_tangential;

         connect(aA.frame_a,frame_a3)  annotation (Line(
             points={{22,-102},{0,-102}},
             color={95,95,95},
             thickness=0.5,
             smooth=Smooth.None));
         connect(frame_a3,frame_a3)  annotation (Line(
             points={{0,-102},{0,-102}},
             color={95,95,95},
             thickness=0.5,
             smooth=Smooth.None));
          connect(rP_p_cpl.frame_a,frame_a3)  annotation (Line(
              points={{60,-46},{60,-60},{0,-60},{0,-102}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(f_l.frame_a,frame_a3)  annotation (Line(
              points={{80,-46},{80,-60},{0,-60},{0,-102}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_cm_l.frame_a, frame_a3) annotation (Line(
              points={{-3.67394e-016,-46},{0,-46},{0,-102}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_cm_l.frame_b, frame_a1) annotation (Line(
              points={{3.67394e-016,-34},{0,-34},{0,102}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(contact_point_cylinder.frame_a, f_l.frame_b)
                                                   annotation (Line(
              points={{78,-6},{80,-6},{80,-34}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(pos_offset.support,variablePrism. support) annotation (Line(
              points={{27,-8},{26,-8},{26,-14}},
              color={0,0,0},
              pattern=LinePattern.None,
              smooth=Smooth.None));
          connect(pos_offset.flange, variablePrism.axis) annotation (Line(
              points={{34,-1},{36,-1},{36,-14},{38,-14}},
              color={0,127,0},
              smooth=Smooth.None));
          connect(variablePrism.frame_b, rP_p_cpl.frame_b) annotation (Line(
              points={{40,-20},{60,-20},{60,-34}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(f_l.frame_b, variablePrism.frame_b) annotation (Line(
              points={{80,-34},{80,-20},{40,-20}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variablePrism.frame_a, frame_a1) annotation (Line(
              points={{20,-20},{0,-20},{0,102}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(deMultiplex2.u, vector_cylinder) annotation (Line(
              points={{-95.2,-54},{-108,-54}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(deMultiplex3.u, vector_circle) annotation (Line(
              points={{-95.2,-94},{-108,-94}},
              color={0,0,127},
              smooth=Smooth.None));
          annotation (Diagram(coordinateSystem(preserveAspectRatio=true,  extent={{-100,
                    -100},{100,100}}),
                              graphics));
        end ForceCylinderToCircle;

        model MovePointCylinderToCylinderLine
          import VC =
           IdealizedContact.Components.VectorCalculations;

          parameter Modelica.SIunits.Frequency f=100000;
          parameter Real q=1 "1=left   -1=right";
          final parameter Modelica.Mechanics.MultiBody.Types.Axis y_direction={0,1,0}
          "cartesian coordinate system in y direction -- direction of gravity";
          final parameter Modelica.Mechanics.MultiBody.Types.Axis x_direction={1,0,0};
          final parameter Modelica.Mechanics.MultiBody.Types.Axis z_direction=cross(x_direction, y_direction);
          constant Real pi=Modelica.Constants.pi;

          parameter Boolean animation=true;
          parameter Modelica.SIunits.Radius radiusContactPoint=0.005;
          parameter Modelica.Mechanics.MultiBody.Types.Color
            Color_contact_point_cylinder1 =                                                {0,180,0};
          parameter Modelica.Mechanics.MultiBody.Types.Color
            Color_contact_point_cylinder2 =                                                {255,0,255};

        // BCS1: body coordinate system resolved in center of cylinder1
        // BCS2: body coordinate system resolved in center of cylinder2

          Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a1
          "center of mass cylinder1 BCS1"
                                  annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=0,
                origin={-102,60})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a2
          "center of mass cylinder2 BCS2"
                                  annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=0,
                origin={-102,-60})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b2
          "contact point cylinder2 BCS4 based on BCS2"
            annotation (Placement(transformation(extent={{92,-70},{112,-50}})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b1
          "contact point cylinder1 BCS3 based on BCS1"
            annotation (Placement(transformation(extent={{92,50},{112,70}})));
          Modelica.Blocks.Interfaces.RealInput vector_cylinder2[12]
          "length_direction and radius and half_length"
            annotation (Placement(transformation(extent={{-8,-8},{8,8}},
                rotation=0,
                origin={-108,-20})));
          Modelica.Blocks.Interfaces.RealInput vector_cylinder1[12]
          "length_direction and radius and half_length"
            annotation (Placement(transformation(extent={{-8,-8},{8,8}},
                rotation=0,
                origin={-108,20})));
          Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP_c2_c1(resolveInFrame=
               Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "relativ position center of cylinder1 resolved in BCS cylinder2"
            annotation (Placement(transformation(
                extent={{-6,-6},{6,6}},
                rotation=90,
                origin={-68,0})));
          Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP_c1_c2(resolveInFrame=
               Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "relativ position center of cylinder2 resolved in BCS cylinder1"
            annotation (Placement(transformation(
                extent={{-6,-6},{6,6}},
                rotation=270,
                origin={-50,0})));

         Real Length_Direction_cy1[3] "default (1,0,0)";
         Real Dw_Direction_cy1[3] "default (0,0,1)";
         Real Dh_Direction_cy1[3] "default (0,1,0)";
         Real R_l_cy1[3] "radius and half-length cylinder";

         Real Length_Direction_cy2[3] "default (1,0,0)";
         Real Dw_Direction_cy2[3] "default (0,0,1)";
         Real Dh_Direction_cy2[3] "default (0,1,0)";
         Real R_l_cy2[3] "radius and half-length cylinder";

         Real pos_cy1_otwh[3]
          "orthogonalprojektion of position vector center of cylinder1 on W-H plane BCS2";
         Real pos_cy2_otwh[3]
          "orthogonalprojektion of position vector center of cylinder2 on W-H plane BCS1";

        //-------------------------------------------------------------------------------
         Real m;
         Real n;
        //------------------------------------------------------------------------------

      public
          IdealizedContact.Components.Utilities.variablePrism1 variablePrism_l_cy1
          "offset from point on cylinder1 surface along L-direction to face side resolved in BCS1"
            annotation (Placement(transformation(extent={{-26,14},{-10,30}})));
          IdealizedContact.Components.Utilities.variablePrism1 variablePrism_l_cy2
          "offset from point on cylinder2 surface along L-direction to face side resolved in BCS2"
            annotation (Placement(transformation(extent={{-8,-8},{8,8}},
                rotation=180,
                origin={4,-20})));
          IdealizedContact.Components.Utilities.variablePrism1 variablePrism_1
          "offset from center of mass to cylinder1 surface along unit vector uv_pos_cy2_otwh resolved in BCS1"
            annotation (Placement(transformation(extent={{-60,52},{-44,68}})));
          IdealizedContact.Components.Utilities.variablePrism1 variablePrism_2
          "offset from center of mass to cylinder2 surface along unit vector uv_pos_cy1_otwh resolved in BCS2"
            annotation (Placement(transformation(extent={{-60,-68},{-44,-52}})));
          Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP2_cy1(resolveInFrame=
                Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
            annotation (Placement(transformation(
                extent={{-6,-6},{6,6}},
                rotation=180,
                origin={6,22})));
          Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP1_cy2(resolveInFrame=
                Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
            annotation (Placement(transformation(
                extent={{-6,-6},{6,6}},
                rotation=0,
                origin={-20,-20})));
          Modelica.Blocks.Routing.DeMultiplex4 deMultiplex1(
            n1=3,
            n2=3,
            n3=3,
            n4=3) annotation (Placement(transformation(extent={{-92,14},{-80,26}})));
          Modelica.Blocks.Routing.DeMultiplex4 deMultiplex2(
            n1=3,
            n2=3,
            n3=3,
            n4=3) annotation (Placement(transformation(extent={{-92,-26},{-80,-14}})));
          Modelica.Mechanics.MultiBody.Sensors.TansformAbsoluteVector
            tansformVectorCylinder1(frame_r_in=Modelica.Mechanics.MultiBody.Types.ResolveInFrameA.frame_a,
              frame_r_out=Modelica.Mechanics.MultiBody.Types.ResolveInFrameA.world)
          "Transformation length-direction cylinder1 from BCS1 to ICS"
            annotation (Placement(transformation(
                extent={{-6,-6},{6,6}},
                rotation=90,
                origin={-86,76})));
          Modelica.Mechanics.MultiBody.Sensors.TansformAbsoluteVector
            tansformVectorCylinder2(frame_r_in=Modelica.Mechanics.MultiBody.Types.ResolveInFrameA.frame_a,
              frame_r_out=Modelica.Mechanics.MultiBody.Types.ResolveInFrameA.world)
          "Transformation length-direction cylinder2 from BCS2 to ICS"
            annotation (Placement(transformation(
                extent={{-6,-6},{6,6}},
                rotation=90,
                origin={-86,-44})));
         IdealizedContact.Components.SpecialVisualizers.PointMassVarAnimation                              move_point_cylinder7(
          m=0,
          animation=animation,
          sphereColor=Color_contact_point_cylinder2,
          sphereDiameter=2*radiusContactPoint)
          "contact point cylinder2 after second correction"
          annotation (Placement(transformation(extent={{80,-120},{100,-100}})));
         IdealizedContact.Components.SpecialVisualizers.PointMassVarAnimation                              move_point_cylinder8(
          m=0,
          sphereColor=Color_contact_point_cylinder1,
          animation=animation,
          sphereDiameter=2*radiusContactPoint)
          "contact point cylinder1 after second correction"
          annotation (Placement(transformation(extent={{80,100},{100,120}})));
           IdealizedContact.Components.Utilities.variablePrism2
            variablePrism_ll_cy1 "to contact point on cylidner1"
            annotation (Placement(transformation(extent={{40,50},{60,70}})));
           IdealizedContact.Components.Utilities.variablePrism2
            variablePrism_ll_cy2 "to contact point cylinder2"
            annotation (Placement(transformation(extent={{40,-70},{60,-50}})));
          Modelica.Mechanics.Translational.Sources.Position position1(
            useSupport=true,
            exact=false,
            f_crit=f) annotation (Placement(transformation(extent={{36,74},{56,94}})));
          Modelica.Mechanics.Translational.Sources.Position position2(
            useSupport=true,
            exact=false,
            f_crit=f) annotation (Placement(transformation(extent={{38,-50},{58,-30}})));
          Modelica.Blocks.Interfaces.BooleanInput enabled
          "Connector of Boolean input signal"   annotation (Placement(
                transformation(
                extent={{-20,-20},{20,20}},
                rotation=90,
                origin={0,-122})));
        equation
         R_l_cy1 = deMultiplex1.y4;
         Length_Direction_cy1 = deMultiplex1.y1;
         Dw_Direction_cy1 = deMultiplex1.y2;
         Dh_Direction_cy1 = deMultiplex1.y3;
         tansformVectorCylinder1.r_in = Length_Direction_cy1*2*R_l_cy1[2]
          "length vector cy1 with norm=length resolved in BCS cy1";

         R_l_cy2 = deMultiplex2.y4;
         Length_Direction_cy2 = deMultiplex2.y1;
         Dw_Direction_cy2 = deMultiplex2.y2;
         Dh_Direction_cy2 = deMultiplex2.y3;
         tansformVectorCylinder2.r_in = Length_Direction_cy2*2*R_l_cy2[2]
          "length vector cy2 with norm=length resolved in BXS cy2";

        //----------orthogonalprojektion position vector---------------------------------------------------------------------------------
          pos_cy1_otwh = VC.orthogonalProjection(
                    rP_c2_c1.r_rel,
                    Dw_Direction_cy2,
                    Dh_Direction_cy2);
          pos_cy2_otwh = VC.orthogonalProjection(
                    rP_c1_c2.r_rel,
                    Dw_Direction_cy1,
                    Dh_Direction_cy1);

        //-------------------------------------------------------------------------------------------------------------------------------

        //----------offset from center of mass to cylinder1 surface along unit vector uv_pos_cy2_otwh resolved in BCS1--------------------------------------------------------------
         variablePrism_1.s_ref = R_l_cy1[1];
         variablePrism_1.n = pos_cy2_otwh;

        //--------------------------------------------------------------------------------------------------------------------------------------------------------------------------

        //----------offset from center of mass to cylinder2 surface along unit vector uv_pos_cy1_otwh resolved in BCS2--------------------------------------------------------------
         variablePrism_2.s_ref = R_l_cy2[1];
         variablePrism_2.n = pos_cy1_otwh;

        //--------------------------------------------------------------------------------------------------------------------------------------------------------------------------

        //----------offset on cylinder1 surface along L-direction to face side resolved in BCS1----------------------
         m=1;
         n=0;

         variablePrism_l_cy1.s_ref = q*R_l_cy1[2];
         variablePrism_l_cy1.n = Length_Direction_cy1;

        //-----------------------------------------------------------------------------------------------------------

        //----------offset on cylinder2 surface along L-direction to face side resolved in BCS2----------------------
         //pos_l_cy2.s_ref=q*R_l_cy2[2];
         variablePrism_l_cy2.s_ref = q*R_l_cy2[2];
         variablePrism_l_cy2.n = Length_Direction_cy2;

        //-----------------------------------------------------------------------------------------------------------

        //-------------------------------------------------------------
         position2.s_ref = smooth(2, if abs(rP2_cy1.r_rel*Length_Direction_cy2)>R_l_cy2[2] then R_l_cy2[2]*sign(rP2_cy1.r_rel*Length_Direction_cy2) else rP2_cy1.r_rel*Length_Direction_cy2);
         variablePrism_ll_cy2.n = Length_Direction_cy2;
        //-------------------------------------------------------------

        //-------------------------------------------------------------

         position1.s_ref = smooth(2, if abs(rP1_cy2.r_rel*Length_Direction_cy1)>R_l_cy1[2] then R_l_cy1[2]*sign(rP1_cy2.r_rel*Length_Direction_cy1) else rP1_cy2.r_rel*Length_Direction_cy1);
         variablePrism_ll_cy1.n = Length_Direction_cy1;
        //-------------------------------------------------------------

        move_point_cylinder8.disableAnimation= not enabled;
        move_point_cylinder7.disableAnimation= not enabled;
          connect(rP_c2_c1.frame_b, frame_a1) annotation (Line(
              points={{-68,6},{-68,60},{-102,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_c2_c1.frame_a, frame_a2) annotation (Line(
              points={{-68,-6},{-68,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_c1_c2.frame_a, frame_a1) annotation (Line(
              points={{-50,6},{-50,20},{-68,20},{-68,60},{-102,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_c1_c2.frame_b, frame_a2) annotation (Line(
              points={{-50,-6},{-50,-20},{-68,-20},{-68,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variablePrism_1.frame_a, frame_a1) annotation (Line(
              points={{-60,60},{-102,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variablePrism_2.frame_a, frame_a2) annotation (Line(
              points={{-60,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP2_cy1.frame_b, variablePrism_l_cy1.frame_b) annotation (Line(
              points={{0,22},{-10,22}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP1_cy2.frame_b, variablePrism_l_cy2.frame_b) annotation (Line(
              points={{-14,-20},{-4,-20}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP1_cy2.frame_a, variablePrism_1.frame_b) annotation (Line(
              points={{-26,-20},{-34,-20},{-34,60},{-44,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variablePrism_l_cy1.frame_a, variablePrism_1.frame_b) annotation (
              Line(
              points={{-26,22},{-34,22},{-34,60},{-44,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(deMultiplex1.u, vector_cylinder1) annotation (Line(
              points={{-93.2,20},{-108,20}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(deMultiplex2.u, vector_cylinder2) annotation (Line(
              points={{-93.2,-20},{-108,-20}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(tansformVectorCylinder1.frame_a, frame_a1) annotation (Line(
              points={{-86,70},{-86,60},{-102,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(tansformVectorCylinder2.frame_a, frame_a2) annotation (Line(
              points={{-86,-50},{-86,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));

          connect(variablePrism_l_cy2.frame_a, variablePrism_2.frame_b) annotation (
              Line(
              points={{12,-20},{22,-20},{22,-60},{-44,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));

          connect(move_point_cylinder8.frame_a, frame_b1) annotation (Line(
              points={{90,110},{90,60},{102,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(move_point_cylinder7.frame_a, frame_b2) annotation (Line(
              points={{90,-110},{90,-60},{102,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variablePrism_ll_cy1.frame_b, frame_b1) annotation (Line(
              points={{60,60},{102,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variablePrism_ll_cy1.frame_a, variablePrism_1.frame_b) annotation (
              Line(
              points={{40,60},{-44,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variablePrism_ll_cy2.frame_b, frame_b2) annotation (Line(
              points={{60,-60},{102,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variablePrism_ll_cy2.frame_a, variablePrism_2.frame_b) annotation (
              Line(
              points={{40,-60},{-44,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variablePrism_l_cy2.frame_a, rP2_cy1.frame_a) annotation (Line(
              points={{12,-20},{22,-20},{22,22},{12,22}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(position2.support, variablePrism_ll_cy2.support) annotation (Line(
              points={{48,-50},{48,-54},{46,-54}},
              color={0,0,0},
              pattern=LinePattern.None,
              smooth=Smooth.None));
          connect(position2.flange, variablePrism_ll_cy2.axis) annotation (Line(
              points={{58,-40},{60,-40},{60,-54},{58,-54}},
              color={0,127,0},
              smooth=Smooth.None));
          connect(position1.flange, variablePrism_ll_cy1.axis) annotation (Line(
              points={{56,84},{58,84},{58,66}},
              color={0,127,0},
              smooth=Smooth.None));
          connect(position1.support, variablePrism_ll_cy1.support) annotation (Line(
              points={{46,74},{46,66}},
              color={0,0,0},
              pattern=LinePattern.None,
              smooth=Smooth.None));
          annotation (Diagram(coordinateSystem(extent={{-100,-120},{100,140}},
                  preserveAspectRatio=true),
                              graphics), Icon(coordinateSystem(extent={{-100,
                    -120},{100,140}})));
        end MovePointCylinderToCylinderLine;

        model ForceCylinderToCylinderLine
          import SI = Modelica.SIunits;

         parameter SI.Frequency f=10000000;
         parameter SI.TranslationalSpringConstant c=100000;
         parameter SI.TranslationalDampingConstant d=100000;
          parameter Real n1 = 1.5;
          parameter Real n2 = n1;
          parameter SI.CoefficientOfFriction mue_r=0.0001
          "rolling friction coefficient";
          parameter Real gamma1=1;
          parameter Real gamma2=1;
          parameter Real gamma3=1;
          parameter Real gamma4=1;
          parameter Real gamma5=1;
          parameter Real gamma6=1;
         parameter SI.Distance t_max=0.0001 "maximal depth of impression";

         //parameter Real q=1 "1=left   -1=right";
         constant Real pi=Modelica.Constants.pi;
         final parameter Modelica.Mechanics.MultiBody.Types.Axis y_direction={0,1,0}
          "cartesian coordinate system in y direction -- direction of gravity";
         final parameter Modelica.Mechanics.MultiBody.Types.Axis x_direction={1,0,0}
          "cartesian coordinate system in x direction";
         final parameter Modelica.Mechanics.MultiBody.Types.Axis z_direction=cross(x_direction, y_direction);

        // BCS1: body coordinate system resolved in center of cylinder1
        // BCS2: body coordinate system resolved in center of cylinder2
        // BCS3: body coordinate system resolved in contact point cylinder1 with the same orientation as BCS1
        // BCS4: body coordinate system resolved in contact point cylinder2 with the same orientation as BCS2

          Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a1
          "center of mass cylinder1 in BCS3"
                                  annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=0,
                origin={-102,60})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a2
          "center of mass cylinder2 in BCS3"
                                  annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=0,
                origin={-102,-60})));
          Modelica.Blocks.Interfaces.RealInput vector_cylinder2[12]
          "length_direction and radius and half_length"
            annotation (Placement(transformation(extent={{-8,-8},{8,8}},
                rotation=0,
                origin={-108,-20})));
          Modelica.Blocks.Interfaces.RealInput vector_cylinder1[12]
          "length_direction and radius and half_length"
            annotation (Placement(transformation(extent={{-8,-8},{8,8}},
                rotation=0,
                origin={-108,20})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a3
          "contact point cylinder2 BCS4 based on BCS2"
                                  annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=90,
                origin={-20,102})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a4
          "contact point cylinder1 BCS3 based on BCS1"
                                  annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=90,
                origin={40,102})));
         Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP_mp12(resolveInFrame=
                Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "relativ position cylinder1 contact point resolved in BCS4"
           annotation (Placement(transformation(
               extent={{-6,-6},{6,6}},
               rotation=0,
               origin={10,70})));

         Real Length_Direction_cy1[3]
          "length direction cylinder1 default (1,0,0)";
         Real Dw_Direction_cy1[3]
          "diameter width direction cylinder1 default (0,0,1)";
         Real Dh_Direction_cy1[3]
          "diameter height direction cylinder1 default (0,1,0)";
         Real R_l_cy1[3] "radius and half-length cylinder1";

         Real Length_Direction_cy2[3]
          "length direction cylinder2 default (1,0,0)";
         Real Dw_Direction_cy2[3]
          "diameter width direction cylinder2 default (0,0,1)";
         Real Dh_Direction_cy2[3]
          "diameter height direction cylinder2 default (0,1,0)";
         Real R_l_cy2[3] "radius and half-length cylinder1";

           Modelica.Blocks.Interfaces.BooleanOutput contact
            annotation (Placement(transformation(extent={{96,-12},{116,8}})));

          Real w_rel_cc;
          Real h_rel_cc;
          Real l_rel_cc;

         Real l_rel_mp12;
         Real h_rel_mp12
          "relative position contact point cylinder1 in length direction BCS4";
         Real w_rel_mp12
          "relative position contact point cylinder1 in width direction BCS4";

         Real f_nh_mp
          "normal force to cylinder1 resolved in BCS2 height direction";
         Real f_nw_mp
          "normal force to cylinder1 resolved in BCS2 width direction";
         Real f_n_mp;

        //  Real w_l
        //     "absolut angular velocity center of cylinder1 around length direction resolved in BCS2";
        //  Real v_r
        //     "circumferential velocity cylinder1 around length direction resolved in BCS2";
        //
        //  Real v_rel_l "relative velocity cylinder1 in length direction BCS2";
        //  Real v_rel_w "relative velocity cylinder1 in width direction BCS2";
        //  Real v_rel_h "relative velocity cylinder1 in height direction BCS2";

         Real r_ct1_BCS1[3] "position contact point cylinder1 resolved in BCS1";
         Real r_ct2_BCS2[3] "position contact point cylinder2 resolved in BCS2";
         Real v_cm1_BCS2[3]
          "velocity center of mass cylinder1 resolved in BCS2 (velocity center of mass cylinder2 resolved in BCS2 is zero)";
         Real v_ct1_BCS2[3] "velocity contact point1 resolved in BCS2";
         Real v_ct2_BCS2[3] "velocity contact point2 resolved in BCS2";
         Real T_BCS12[3,3]
          "Transformation matrix from orientation objekt to rotate BCS1 into BCS2";
         Real v_rel_ct_BCS2[3]
          "relative velocity contact points resolved in BCS2";

         Real f_fw_mp "friction to cylinder1 resolved in BCS2 width direction";
         Real f_fh_mp "friction to cylinder1 resolved in BCS2 height direction";
         Real f_fl_mp;

         Real f_normal_mp[3] "normal force to cylinder1 resolved in BCS2";
         Real f_tangential_mp[3] "friction to cyilnder1 resolved in BCS2";

          Modelica.Mechanics.MultiBody.Sensors.AbsoluteAngularVelocity aAV1(
              resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameA.frame_resolve)
          "angular velocity contact point cylinder1 resolved in BCS1"
            annotation (Placement(transformation(extent={{-6,-6},{6,6}},
                rotation=270,
                origin={40,60})));
         Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP_c12( resolveInFrame=
                Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "relativ position center of mass cylinder1 resolved in BCS2"
           annotation (Placement(transformation(
               extent={{-6,-6},{6,6}},
               rotation=90,
               origin={-68,0})));
      public
          Modelica.Mechanics.MultiBody.Forces.Force force(resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a,
              animation=false) "Force resolved in BCS2"
            annotation (Placement(transformation(
                extent={{-6,-6},{6,6}},
                rotation=0,
                origin={10,88})));
          Modelica.Blocks.Routing.DeMultiplex4 deMultiplex1(
            n1=3,
            n2=3,
            n3=3,
            n4=3) annotation (Placement(transformation(extent={{-90,14},{-78,26}})));
          Modelica.Blocks.Routing.DeMultiplex4 deMultiplex2(
            n1=3,
            n2=3,
            n3=3,
            n4=3) annotation (Placement(transformation(extent={{-90,-26},{-78,-14}})));
          Modelica.Blocks.Interfaces.BooleanInput enabled
          "Connector of Boolean input signal"   annotation (Placement(transformation(
                extent={{-20,-20},{20,20}},
                rotation=90,
                origin={-32,-108})));
          Modelica.Mechanics.MultiBody.Sensors.AbsoluteAngularVelocity aAV2(
              resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameA.frame_resolve)
          "angular velocity contact point cylinder1 resolved in BCS1"
            annotation (Placement(transformation(extent={{-6,-6},{6,6}},
                rotation=270,
                origin={-20,-60})));
         Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP_ct1_BCS1(
              resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "relativ position contact point cylinder1 resolved in BCS1"
           annotation (Placement(transformation(
               extent={{-6,-6},{6,6}},
               rotation=0,
               origin={54,26})));
         Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP_ct2_BCS2(
              resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "relativ position contact point cylinder2 resolved in BCS2"
           annotation (Placement(transformation(
               extent={{-6,-6},{6,6}},
               rotation=0,
               origin={-44,-36})));
        equation
           R_l_cy1=deMultiplex1.y4;
           Length_Direction_cy1=deMultiplex1.y1;
           Dw_Direction_cy1=deMultiplex1.y2;
           Dh_Direction_cy1=deMultiplex1.y3;

           R_l_cy2=deMultiplex2.y4;
           Length_Direction_cy2=deMultiplex2.y1;
           Dw_Direction_cy2=deMultiplex2.y2;
           Dh_Direction_cy2=deMultiplex2.y3;

            w_rel_cc = rP_c12.r_rel*Dw_Direction_cy2;
            h_rel_cc = rP_c12.r_rel*Dh_Direction_cy2;
            l_rel_cc = rP_c12.r_rel*Length_Direction_cy2;

           l_rel_mp12 = rP_mp12.r_rel*Length_Direction_cy2;
           h_rel_mp12 = rP_mp12.r_rel*Dh_Direction_cy2;
           w_rel_mp12 = rP_mp12.r_rel*Dw_Direction_cy2;

          r_ct1_BCS1 = rP_ct1_BCS1.r_rel;
          r_ct2_BCS2 = rP_ct2_BCS2.r_rel;
          v_cm1_BCS2 = der(rP_c12.r_rel);
          T_BCS12 = Modelica.Mechanics.MultiBody.Frames.to_T(Modelica.Mechanics.MultiBody.Frames.relativeRotation(frame_a4.R, frame_a3.R));

        //----------contact condition-----------------------------------------------------------------------------------------------------------------------------------
           contact = sqrt(w_rel_cc^2+h_rel_cc^2)<=R_l_cy1[1]+R_l_cy2[1] and sqrt(w_rel_cc^2+h_rel_cc^2)>R_l_cy1[1]+R_l_cy2[1]-t_max and abs(l_rel_mp12)<t_max;
        //--------------------------------------------------------------------------------------------------------------------------------------------------------------

        //----------relative velocity resolved in BCS2-----------------------------
        //    w_l = aAV.w*Length_Direction_cy2;
        //    v_r = w_l*R_l_cy1[1];
        //    v_rel_h=der(h_rel_cc)-v_r;
        //    v_rel_w=der(w_rel_cc)-v_r;
        //    v_rel_l=der(l_rel_cc);
              v_ct1_BCS2 = v_cm1_BCS2 + T_BCS12*cross(aAV1.w,r_ct1_BCS1);
              v_ct2_BCS2 = cross(aAV2.w,r_ct2_BCS2);
              v_rel_ct_BCS2 = v_ct2_BCS2 - v_ct1_BCS2;
        //------------------------------------------------------------------------

        //----------force resolved in BCS4------------------------------------------------------------------------------------------------------------------------------
           f_nh_mp = sign(h_rel_mp12)*(c*abs(h_rel_mp12)^n1) + d*abs(h_rel_mp12)^n2*der(h_rel_mp12);
           f_nw_mp = sign(w_rel_mp12)*(c*abs(w_rel_mp12)^n1) + d*abs(w_rel_mp12)^n2*der(w_rel_mp12);
           f_n_mp = sqrt(f_nh_mp^2+f_nw_mp^2);

            //mue=gamma1*(tanh(gamma2*v_rel)-tanh(gamma3*v_rel))+gamma4*tanh(gamma5*v_rel)+gamma6*v_rel
        //    f_fw_mp = (gamma1*(tanh(gamma2*v_rel_w)-tanh(gamma3*v_rel_w))+gamma4*tanh(gamma5*v_rel_w)+gamma6*v_rel_w)*(-f_nh_mp) + mue_r*tanh(v_rel_w*gamma2)*(f_nh_mp);
        //    f_fh_mp = (gamma1*(tanh(gamma2*v_rel_h)-tanh(gamma3*v_rel_h))+gamma4*tanh(gamma5*v_rel_h)+gamma6*v_rel_h)*(-f_nw_mp) + mue_r*tanh(v_rel_h*gamma2)*(f_nw_mp);
        //    f_fl_mp = (gamma1*(tanh(gamma2*v_rel_l)-tanh(gamma3*v_rel_l))+gamma4*tanh(gamma5*v_rel_l)+gamma6*v_rel_l)*(-f_n_mp);
           f_fw_mp = (gamma1*(tanh(gamma2*v_rel_ct_BCS2*Dw_Direction_cy2)-tanh(gamma3*v_rel_ct_BCS2*Dw_Direction_cy2))+gamma4*tanh(gamma5*v_rel_ct_BCS2*Dw_Direction_cy2)+gamma6*v_rel_ct_BCS2*Dw_Direction_cy2)*abs(f_nh_mp) + mue_r*tanh(v_rel_ct_BCS2*Dw_Direction_cy2*gamma2)*abs(f_nh_mp);
           f_fh_mp = (gamma1*(tanh(gamma2*v_rel_ct_BCS2*Dh_Direction_cy2)-tanh(gamma3*v_rel_ct_BCS2*Dh_Direction_cy2))+gamma4*tanh(gamma5*v_rel_ct_BCS2*Dh_Direction_cy2)+gamma6*v_rel_ct_BCS2*Dh_Direction_cy2)*abs(f_nw_mp) + mue_r*tanh(v_rel_ct_BCS2*Dh_Direction_cy2*gamma2)*abs(f_nw_mp);
           f_fl_mp = (gamma1*(tanh(gamma2*v_rel_ct_BCS2*Length_Direction_cy2)-tanh(gamma3*v_rel_ct_BCS2*Length_Direction_cy2))+gamma4*tanh(gamma5*v_rel_ct_BCS2*Length_Direction_cy2)+gamma6*v_rel_ct_BCS2*Length_Direction_cy2)*abs(f_n_mp);

           if (contact) and enabled then
             f_normal_mp = -f_nh_mp*Dh_Direction_cy2 - f_nw_mp*Dw_Direction_cy2;
             f_tangential_mp = f_fw_mp*Dw_Direction_cy2 + f_fh_mp*Dh_Direction_cy2 + f_fl_mp*Length_Direction_cy2;
           else
             f_normal_mp=zeros(3);
             f_tangential_mp=zeros(3);
           end if;

           force.force=f_normal_mp+f_tangential_mp;
        //---------------------------------------------------------------------------------------------------------------------------------------------------------------

          connect(rP_mp12.frame_a, frame_a3)    annotation (Line(
              points={{4,70},{-20,70},{-20,102}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_mp12.frame_b, frame_a4)    annotation (Line(
              points={{16,70},{40,70},{40,102}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_c12.frame_a, frame_a2) annotation (Line(
              points={{-68,-6},{-68,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_c12.frame_b, frame_a1) annotation (Line(
              points={{-68,6},{-68,60},{-102,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(force.frame_a, frame_a3) annotation (Line(
              points={{4,88},{-20,88},{-20,102}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(force.frame_b, frame_a4) annotation (Line(
              points={{16,88},{40,88},{40,102}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(deMultiplex1.u, vector_cylinder1) annotation (Line(
              points={{-91.2,20},{-108,20}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(deMultiplex2.u, vector_cylinder2) annotation (Line(
              points={{-91.2,-20},{-108,-20}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(aAV1.frame_a, frame_a4) annotation (Line(
              points={{40,66},{40,102}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(aAV1.frame_resolve, frame_a1) annotation (Line(
              points={{33.94,60},{-102,60}},
              color={95,95,95},
              pattern=LinePattern.Dot,
              smooth=Smooth.None));
          connect(aAV2.frame_resolve, frame_a2) annotation (Line(
              points={{-26.06,-60},{-102,-60}},
              color={95,95,95},
              pattern=LinePattern.Dot,
              smooth=Smooth.None));
          connect(aAV2.frame_a, frame_a3) annotation (Line(
              points={{-20,-54},{-20,102}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_ct2_BCS2.frame_a, frame_a2) annotation (Line(
              points={{-50,-36},{-50,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_ct2_BCS2.frame_b, frame_a3) annotation (Line(
              points={{-38,-36},{-20,-36},{-20,102}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_ct1_BCS1.frame_a, frame_a1) annotation (Line(
              points={{48,26},{-68,26},{-68,60},{-102,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_ct1_BCS1.frame_b, frame_a4) annotation (Line(
              points={{60,26},{62,26},{62,102},{40,102}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          annotation (Diagram(graphics));
        end ForceCylinderToCylinderLine;

        model MovePointCylinderToCylinderPoint
        "Contact point detection between cylinders which are not parallel to each other"
          import VC =
           IdealizedContact.Components.VectorCalculations;

          parameter Modelica.SIunits.Frequency f=100000;
          parameter Real q=1 "1=left   -1=right";
          final parameter Modelica.Mechanics.MultiBody.Types.Axis y_direction={0,1,0}
          "cartesian coordinate system in y direction -- direction of gravity";
          final parameter Modelica.Mechanics.MultiBody.Types.Axis x_direction={1,0,0};
          final parameter Modelica.Mechanics.MultiBody.Types.Axis z_direction=cross(x_direction, y_direction);
          constant Real pi=Modelica.Constants.pi;

          parameter Boolean animation=true;
          parameter Modelica.SIunits.Radius radiusContactPoint=0.005;
          parameter Modelica.Mechanics.MultiBody.Types.Color
             Color_contact_point_cylinder1 =                                                {0,180,0};
          parameter Modelica.Mechanics.MultiBody.Types.Color
             Color_contact_point_cylinder2 =                                                {255,0,255};

        // BCS1: body coordinate system resolved in center of cylinder1
        // BCS2: body coordinate system resolved in center of cylinder2
          Modelica.Blocks.Routing.DeMultiplex4 deMultiplex1(
            n1=3,
            n2=3,
            n3=3,
            n4=3) annotation (Placement(transformation(extent={{-344,10},{-332,
                    22}})));
          Modelica.Blocks.Routing.DeMultiplex4 deMultiplex2(
            n1=3,
            n2=3,
            n3=3,
            n4=3) annotation (Placement(transformation(extent={{-344,-32},{-332,-20}})));
          Modelica.Mechanics.MultiBody.Sensors.TansformAbsoluteVector tansformVectorCy1(
              frame_r_in=Modelica.Mechanics.MultiBody.Types.ResolveInFrameA.frame_a,
              frame_r_out=Modelica.Mechanics.MultiBody.Types.ResolveInFrameA.world)
          "Transformation length-direction cylinder1 from BCS1 to ICS"
            annotation (Placement(transformation(
                extent={{-8,-8},{8,8}},
                rotation=0,
                origin={-80,60})));
          Modelica.Mechanics.MultiBody.Sensors.TansformAbsoluteVector tansformVectorCy2(
              frame_r_in=Modelica.Mechanics.MultiBody.Types.ResolveInFrameA.frame_a,
              frame_r_out=Modelica.Mechanics.MultiBody.Types.ResolveInFrameA.world)
          "Transformation length-direction cylinder2 from BCS2 to ICS"
            annotation (Placement(transformation(
                extent={{-8,-8},{8,8}},
                rotation=0,
                origin={-80,-60})));
          Modelica.Mechanics.MultiBody.Sensors.AbsolutePosition absP_bt_cy1(
              resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameA.world)
          "absolute position of cy1 bottom resolved in ICS"   annotation (
              Placement(transformation(extent={{-60,60},{-44,76}})));
          Modelica.Mechanics.MultiBody.Sensors.AbsolutePosition absP_bt_cy2(
              resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameA.world)
          "absolute position of cy2 bottom resolved in ICS"   annotation (
              Placement(transformation(extent={{-60,-68},{-44,-52}})));
           IdealizedContact.Components.Utilities.variablePrism1
            bt_ins_cy1
          "frame moved from bottom to intersection point cy1 resolved in BCS1"
            annotation (Placement(transformation(extent={{-40,80},{-20,100}})));
           IdealizedContact.Components.Utilities.variablePrism1
            bt_ins_cy2
          "frame moved from bottom to intersection point cy2 resolved in BCS2"
            annotation (Placement(transformation(extent={{-40,-96},{-20,-76}})));

          IdealizedContact.Components.VectorCalculations.intersectionOfTwoLinesBlock
                                       intersectionCylinderBlock(f=f)
            annotation (Placement(transformation(extent={{66,78},{86,98}})));
         IdealizedContact.Components.SpecialVisualizers.PointMassVarAnimation                              pointMass(
          m=0,
          animation=animation,
          sphereColor=Color_contact_point_cylinder1,
          sphereDiameter=2*radiusContactPoint) annotation (Placement(transformation(extent={{50,20},{70,40}})));
         IdealizedContact.Components.SpecialVisualizers.PointMassVarAnimation                              pointMass1(
          m=0,
          animation=animation,
          sphereColor=Color_contact_point_cylinder2,
          sphereDiameter=2*radiusContactPoint) annotation (Placement(transformation(extent={{50,-42},{70,-22}})));
          Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP_ins1_ins2(
              resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "relativ position intersection point of cy2 resolved in intersection point of cy1 "
            annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={-20,0})));
          Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP_ins2_ins1(
              resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "relativ position intersection point of cy1 resolved in intersection point of cy2 "
            annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=90,
                origin={-48,0})));

          IdealizedContact.Components.VectorCalculations.orthogonalProjectionBlock
                                       orthogonalProjectionBlock[2]
            annotation (Placement(transformation(extent={{100,80},{120,100}})));
           IdealizedContact.Components.Utilities.variablePrism1 cm_auxp1_cy1
          "frame moved from center of mass to auxiliay point1 cylinder1"
            annotation (Placement(transformation(extent={{-88,118},{-68,138}})));
           IdealizedContact.Components.Utilities.variablePrism1
            auxp1_auxcp1_cy1
          "frame moved from auxiliary point1 cylinder1 to possible contact point auxcp1 cylinder1"
            annotation (Placement(transformation(extent={{-40,118},{-20,138}})));
           IdealizedContact.Components.Utilities.variablePrism1 cm_auxp1_cy2
          "frame moved from center of mass to auxiliay point1 cylinder2"
            annotation (Placement(transformation(extent={{-86,-138},{-66,-118}})));
           IdealizedContact.Components.Utilities.variablePrism1
            auxp1_auxcp1_cy2
          "frame moved from auxiliary point1 cylinder2 to possible contact point auxcp1 cylinder2"
            annotation (Placement(transformation(extent={{-40,-138},{-20,-118}})));
          Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP_ins1_c2(
              resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "relativ position insection point1 cylinder1 resolved in BCS2 cylinder2"
            annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=90,
                origin={-138,0})));
          Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP_ins2_c1(
              resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "relativ position insection point cylinder2 resolved in BCS1 cylinder1"
            annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={-172,0})));
          Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP_auxp1cy2_auxp1cy1(
              resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "relativ position auxiliary point1 cylinder2 resolved in auxiliary point1 cylinder1"
            annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={-232,0})));
          Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP_auxp1cy1_auxp1cy2(
              resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "relativ position auxiliary point1 cylinder1 resolved in auxiliary point1 cylinder2"
            annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=90,
                origin={-200,0})));

          IdealizedContact.Components.VectorCalculations.LimiterBlockReferenceIn
                                     limiterBlockReferenceIn[4](f={f,f,f,f})
            annotation (Placement(transformation(extent={{142,80},{162,100}})));
          Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP_auxcp1cy1_c2(
              resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "relativ position auxiliary contact point1 cylinder1 resolved in BCS2 cylinder2"
            annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=90,
                origin={-266,0})));
          Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP_auxcp1cy2_c1(
              resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "relativ position auxiliary contact point1 cylinder2 resolved in BCS1 cylinder1"
            annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={-300,0})));
           IdealizedContact.Components.Utilities.variablePrism1 cm_auxp2_cy1
          "frame moved from center of mass to auxiliay point2 cylinder1"
            annotation (Placement(transformation(extent={{-88,150},{-68,170}})));
           IdealizedContact.Components.Utilities.variablePrism1
            auxp2_cp_cy1
          "frame moved from auxiliary point2 cylinder1 to contact point cp cylinder1"
            annotation (Placement(transformation(extent={{-40,150},{-20,170}})));
           IdealizedContact.Components.Utilities.variablePrism1 cm_auxp2_cy2
          "frame moved from center of mass to auxiliay point2 cylinder2"
            annotation (Placement(transformation(extent={{-86,-174},{-66,-154}})));
           IdealizedContact.Components.Utilities.variablePrism1
            auxp2_cp_cy2
          "frame moved from auxiliary point2 cylinder2 to contact point cp cylinder2"
            annotation (Placement(transformation(extent={{-40,-174},{-20,-154}})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a1
          "center of mass cylinder1 BCS1"
                                  annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=0,
                origin={-102,60}), iconTransformation(extent={{-374,128},{-354,
                    148}})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a2
          "center of mass cylinder2 BCS2"
                                  annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=0,
                origin={-102,-60}), iconTransformation(extent={{-364,-150},{
                    -344,-130}})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b2
          "contact point cylinder2"
            annotation (Placement(transformation(extent={{188,-150},{208,-130}}),
                iconTransformation(extent={{188,-150},{208,-130}})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b1
          "contact point cylinder1"
            annotation (Placement(transformation(extent={{190,114},{210,134}}),
                iconTransformation(extent={{190,114},{210,134}})));
          Modelica.Blocks.Interfaces.RealInput vector_cylinder2[12]
          "length_direction and radius and half_length"
            annotation (Placement(transformation(extent={{-8,-8},{8,8}},
                rotation=0,
                origin={-368,-24})));
          Modelica.Blocks.Interfaces.RealInput vector_cylinder1[12]
          "length_direction and radius and half_length"
            annotation (Placement(transformation(extent={{-8,-8},{8,8}},
                rotation=0,
                origin={-368,16})));

         Real Length_Direction_cy1[3] "default (1,0,0) resolved in BCS1";
         Real Dw_Direction_cy1[3] "default (0,0,1) resolved in BCS1";
         Real Dh_Direction_cy1[3] "default (0,1,0) resolved in BCS1";
         Real R_l_cy1[3] "radius and half-length cylinder";

         Real Length_Direction_cy2[3] "default (1,0,0) resolved in BCS2";
         Real Dw_Direction_cy2[3] "default (0,0,1) resolved in BCS2";
         Real Dh_Direction_cy2[3] "default (0,1,0) resolved in BCS2";
         Real R_l_cy2[3] "radius and half-length cylinder";

        //  Real pos_cy1_otwh[3]
        //     "orthogonalprojektion of position vector center of cylinder1 on W-H plane BCS2";
        //  Real pos_cy2_otwh[3]
        //     "orthogonalprojektion of position vector center of cylinder2 on W-H plane BCS1";

        //-----------------------------------------------------------------------------
        //  Real m;
        //  Real n;
         Real bt_cy1_ICS[3] "bottom cy1 resolved in ICS";
         Real L_cy1_ICS[3] "length vector cy1 resolved in ICS norm=length";
         Real bt_cy2_ICS[3] "bottom cy2 resolved in ICS";
         Real L_cy2_ICS[3] "length vector cy2 resolved in ICS norm=length";
         Real t[2]
          "intersection point on axis of cy1 and cy2 limited from bottom to top";
        //-----------------------------------------------------------------------------
           IdealizedContact.Components.Utilities.variablePrism1
            cm_bt_cy1
          "frame moved from center of mass cy1 to bottom resolved in BCS1"
            annotation (Placement(transformation(extent={{-86,80},{-66,100}})));
           IdealizedContact.Components.Utilities.variablePrism1
            cm_bt_cy2
          "frame moved from center of mass cy2 to bottom resolved in BCS2"
            annotation (Placement(transformation(extent={{-86,-96},{-66,-76}})));
          Modelica.Blocks.Interfaces.BooleanInput enabled
          "Connector of Boolean input signal"   annotation (Placement(
                transformation(
                extent={{-20,-20},{20,20}},
                rotation=90,
                origin={-158,-188})));
        equation
          R_l_cy1 = deMultiplex1.y4;
          Length_Direction_cy1 = deMultiplex1.y1;
          Dw_Direction_cy1 = deMultiplex1.y2;
          Dh_Direction_cy1 = deMultiplex1.y3;

          tansformVectorCy1.r_in = Length_Direction_cy1*2*R_l_cy1[2]
          "Transformation length vector cy1 with norm=length from BCS1 to ICS";

          R_l_cy2 = deMultiplex2.y4;
          Length_Direction_cy2 = deMultiplex2.y1;
          Dw_Direction_cy2 = deMultiplex2.y2;
          Dh_Direction_cy2 = deMultiplex2.y3;

          tansformVectorCy2.r_in = Length_Direction_cy2*2*R_l_cy2[2]
          "Transformation length vector cy2 with norm=length from BCS2 to ICS";

        ////----------offset from center of mass(cm) to bottom center(bt)----------------
          //frame moved from center of mass to bottom cylinder1 resolved in BCS1
          cm_bt_cy1.n = -Length_Direction_cy1;
          cm_bt_cy1.s_ref = R_l_cy1[2];
          //frame moved from center of mass to bottom cylinder2 resolved in BCS1
          cm_bt_cy2.n = -Length_Direction_cy2;
          cm_bt_cy2.s_ref = R_l_cy2[2];
        ////-----------------------------------------------------------------------------

        ////----------intersection points cylinder1 and cylinder2------------------------
          bt_cy1_ICS = absP_bt_cy1.r;
          L_cy1_ICS = tansformVectorCy1.r_out;
          bt_cy2_ICS = absP_bt_cy2.r;
          L_cy2_ICS = tansformVectorCy2.r_out;
          intersectionCylinderBlock.c = bt_cy1_ICS
          "input for intersection: bottom of cy1";
          intersectionCylinderBlock.s = L_cy1_ICS
          "input for intersection: orientation of bottom cy1 in length direction";
          intersectionCylinderBlock.d = bt_cy2_ICS
          "input for intersection: bottom of cy2";
          intersectionCylinderBlock.w = L_cy2_ICS
          "inout for intersection: orientation of bottom cy2 in length diection";
          t = intersectionCylinderBlock.t
          "position intersection point on axis of cylinder1 and cylinder2";
        ////-----------------------------------------------------------------------------

        ////----------offset from bottom to intersection point---------------------------
          //frame moved from bottom cylinder1 to intersection point on cylinder1 axis resolved in BCS1
          bt_ins_cy1.n = Length_Direction_cy1;
          bt_ins_cy1.s_ref = smooth(2, 2*R_l_cy1[2]*t[1])
          "is smooth necessary?";
          //frame moved from bottom cylinder1 to intersection point on cylinder1 axis resolved in BCS1
          bt_ins_cy2.n = Length_Direction_cy1;
          bt_ins_cy2.s_ref = smooth(2, 2*R_l_cy2[2]*t[2]);
        ////-----------------------------------------------------------------------------

        ////----------first correction auxiliary point1----------------------------------
          //limit the position of intersection point1 on cylinder1 axis between -halfLength and +halfLength
          limiterBlockReferenceIn[1].uMax = R_l_cy1[2]
          "upper limit of auxiliary point on aixs of cy1";
          limiterBlockReferenceIn[1].uMin = -R_l_cy1[2]
          "lower limit of auxiliary point on aixs of cy1";
          limiterBlockReferenceIn[1].u = rP_ins2_c1.r_rel*Length_Direction_cy1;

          //limit the position of intersection point1 on cylinder2 axis between -halfLength and +hlfLength
          limiterBlockReferenceIn[2].uMax = R_l_cy2[2]
          "upper limit of auxiliary point on aixs of cy2";
          limiterBlockReferenceIn[2].uMin = -R_l_cy2[2]
          "lower limit of auxiliary point on aixs of cy2";
          limiterBlockReferenceIn[2].u = rP_ins1_c2.r_rel*Length_Direction_cy2;

          //frame moved from center of mass to auxiliay point1 cylinder1 resolved in BCS1
          cm_auxp1_cy1.n = Length_Direction_cy1;
          cm_auxp1_cy1.s_ref = limiterBlockReferenceIn[1].y;
          //frame moved from center of mass to auxiliay point1 cylinder2 resolved in BCS2
          cm_auxp1_cy2.n = Length_Direction_cy2;
          cm_auxp1_cy2.s_ref = limiterBlockReferenceIn[2].y;

          //orthogonal Projection of vector rP_auxp1cy2_auxp1cy1.r_rel on Dw-Dh plane cylinder1
          orthogonalProjectionBlock[1].vector_in = rP_auxp1cy2_auxp1cy1.r_rel;
          orthogonalProjectionBlock[1].u = Dw_Direction_cy1;
          orthogonalProjectionBlock[1].v = Dh_Direction_cy1;
          //orthogonal Projection of vector rP_auxp1cy1_auxp1cy2.r_rel on Dw-Dh plane cylinder2
          orthogonalProjectionBlock[2].vector_in = rP_auxp1cy1_auxp1cy2.r_rel;
          orthogonalProjectionBlock[2].u = Dw_Direction_cy2;
          orthogonalProjectionBlock[2].v = Dh_Direction_cy2;

          //frame moved from auxiliary point1 cylinder1 to possible contact point auxcp1 cylinder1
          auxp1_auxcp1_cy1.n = orthogonalProjectionBlock[1].vector_out;
          auxp1_auxcp1_cy1.s_ref = R_l_cy1[1];
          //frame moved from auxiliary point1 cylinder2 to possible contact point auxcp1 cylinder2
          auxp1_auxcp1_cy2.n = orthogonalProjectionBlock[2].vector_out;
          auxp1_auxcp1_cy2.s_ref = R_l_cy2[1];
        ////-----------------------------------------------------------------------------

        ////----------second correction auxiliary point2---------------------------------
          //limit the position of auxiliary point2 on cylinder1 axis between -halfLength and +halfLength
          limiterBlockReferenceIn[3].uMax = R_l_cy1[2];
          limiterBlockReferenceIn[3].uMin = -R_l_cy1[2];
          limiterBlockReferenceIn[3].u = rP_auxcp1cy2_c1.r_rel*Length_Direction_cy1;
          //limit the position of auxiliary point2 on cylinder2 axis between -halfLength and +halfLength
          limiterBlockReferenceIn[4].uMax = R_l_cy2[2];
          limiterBlockReferenceIn[4].uMin = -R_l_cy2[2];
          limiterBlockReferenceIn[4].u = rP_auxcp1cy1_c2.r_rel*Length_Direction_cy2;

          //frame moved from center of mass to auxiliay point2 cylinder1
          cm_auxp2_cy1.n = Length_Direction_cy1;
          cm_auxp2_cy1.s_ref = limiterBlockReferenceIn[3].y;
          //frame moved from center of mass to auxiliay point2 cylinder2
          cm_auxp2_cy2.n = Length_Direction_cy2;
          cm_auxp2_cy2.s_ref = limiterBlockReferenceIn[4].y;

          //frame moved from auxiliary point2 cylinder1 to contact point cp cylinder1
          auxp2_cp_cy1.n = (rP_auxcp1cy2_c1.r_rel*Dw_Direction_cy1)*Dw_Direction_cy1 + (rP_auxcp1cy2_c1.r_rel*Dh_Direction_cy1)*Dh_Direction_cy1;
          auxp2_cp_cy1.s_ref = R_l_cy1[1];
          //frame moved from auxiliary point2 cylinder2 to contact point cp cylinder2
          auxp2_cp_cy2.n = (rP_auxcp1cy1_c2.r_rel*Dw_Direction_cy2)*Dw_Direction_cy2 + (rP_auxcp1cy1_c2.r_rel*Dh_Direction_cy2)*Dh_Direction_cy2;
          auxp2_cp_cy2.s_ref = R_l_cy2[1];
        ////------------------------------------------------------------------------------

          pointMass.disableAnimation=not enabled;
          pointMass1.disableAnimation=not enabled;

          connect(deMultiplex1.u,vector_cylinder1)  annotation (Line(
              points={{-345.2,16},{-368,16}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(deMultiplex2.u,vector_cylinder2)  annotation (Line(
              points={{-345.2,-26},{-356,-26},{-356,-24},{-368,-24}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(tansformVectorCy1.frame_a,frame_a1)        annotation (Line(
              points={{-88,60},{-102,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(tansformVectorCy2.frame_a,frame_a2)        annotation (Line(
              points={{-88,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_ins1_ins2.frame_a,bt_ins_cy1. frame_b) annotation (Line(
              points={{-20,10},{-20,50},{-20,50},{-20,90}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_ins1_ins2.frame_b,bt_ins_cy2. frame_b) annotation (Line(
              points={{-20,-10},{-20,-48},{-20,-48},{-20,-86}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_ins2_ins1.frame_b,bt_ins_cy1. frame_b) annotation (Line(
              points={{-48,10},{-20,10},{-20,90}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_ins2_ins1.frame_a,bt_ins_cy2. frame_b) annotation (Line(
              points={{-48,-10},{-20,-10},{-20,-86}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(cm_auxp1_cy1.frame_b,auxp1_auxcp1_cy1. frame_a)    annotation (Line(
              points={{-68,128},{-40,128}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(cm_auxp1_cy2.frame_b,auxp1_auxcp1_cy2. frame_a)    annotation (Line(
              points={{-66,-128},{-40,-128}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(cm_auxp1_cy2.frame_a,frame_a2)  annotation (Line(
              points={{-86,-128},{-102,-128},{-102,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(cm_auxp1_cy1.frame_a,frame_a1)  annotation (Line(
              points={{-88,128},{-102,128},{-102,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_ins1_c2.frame_a,frame_a2)  annotation (Line(
              points={{-138,-10},{-138,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_ins2_c1.frame_a,frame_a1)  annotation (Line(
              points={{-172,10},{-172,60},{-102,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_auxp1cy1_auxp1cy2.frame_b,cm_auxp1_cy1. frame_b) annotation (Line(
              points={{-200,10},{-200,140},{-68,140},{-68,128}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_auxp1cy1_auxp1cy2.frame_a,cm_auxp1_cy2. frame_b) annotation (Line(
              points={{-200,-10},{-200,-144},{-66,-144},{-66,-128}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_auxp1cy2_auxp1cy1.frame_a,rP_auxp1cy1_auxp1cy2. frame_b)
            annotation (Line(
              points={{-232,10},{-200,10}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_auxp1cy2_auxp1cy1.frame_b,rP_auxp1cy1_auxp1cy2. frame_a)
            annotation (Line(
              points={{-232,-10},{-200,-10}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_ins1_c2.frame_b,bt_ins_cy1. frame_b) annotation (Line(
              points={{-138,10},{-138,112},{-20,112},{-20,90}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_ins2_c1.frame_b,bt_ins_cy2. frame_b) annotation (Line(
              points={{-172,-10},{-172,-108},{-20,-108},{-20,-86}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_auxcp1cy1_c2.frame_b,auxp1_auxcp1_cy1. frame_b)    annotation (
              Line(
              points={{-266,10},{-266,140},{-20,140},{-20,128}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_auxcp1cy1_c2.frame_a,frame_a2)  annotation (Line(
              points={{-266,-10},{-266,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_auxcp1cy2_c1.frame_a,frame_a1)  annotation (Line(
              points={{-300,10},{-300,60},{-102,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_auxcp1cy2_c1.frame_b,auxp1_auxcp1_cy2. frame_b)    annotation (
              Line(
              points={{-300,-10},{-300,-144},{-20,-144},{-20,-128}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(auxp2_cp_cy1.frame_a,cm_auxp2_cy1. frame_b)        annotation (Line(
              points={{-40,160},{-68,160}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(cm_auxp2_cy1.frame_a,frame_a1)  annotation (Line(
              points={{-88,160},{-102,160},{-102,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(auxp2_cp_cy2.frame_a,cm_auxp2_cy2. frame_b)        annotation (Line(
              points={{-40,-164},{-66,-164}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(cm_auxp2_cy2.frame_a,frame_a2)  annotation (Line(
              points={{-86,-164},{-102,-164},{-102,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(frame_b1,auxp2_cp_cy1. frame_b)        annotation (Line(
              points={{200,124},{20,124},{20,160},{-20,160}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(frame_b2,auxp2_cp_cy2. frame_b)        annotation (Line(
              points={{198,-140},{20,-140},{20,-164},{-20,-164}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(cm_bt_cy1.frame_b, bt_ins_cy1.frame_a) annotation (Line(
              points={{-66,90},{-40,90}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(cm_bt_cy1.frame_a, frame_a1) annotation (Line(
              points={{-86,90},{-102,90},{-102,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(absP_bt_cy1.frame_a, cm_bt_cy1.frame_b) annotation (Line(
              points={{-60,68},{-60,90},{-66,90}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(pointMass.frame_a, frame_b1) annotation (Line(
              points={{60,30},{60,124},{200,124}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(cm_bt_cy2.frame_b, bt_ins_cy2.frame_a) annotation (Line(
              points={{-66,-86},{-40,-86}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(cm_bt_cy2.frame_a, frame_a2) annotation (Line(
              points={{-86,-86},{-102,-86},{-102,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(absP_bt_cy2.frame_a, cm_bt_cy2.frame_b) annotation (Line(
              points={{-60,-60},{-60,-86},{-66,-86}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(pointMass1.frame_a, frame_b2) annotation (Line(
              points={{60,-32},{60,-140},{198,-140}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          annotation (Diagram(coordinateSystem(extent={{-360,-180},{200,180}},
                  preserveAspectRatio=false),
                              graphics), Icon(coordinateSystem(extent={{-360,
                    -180},{200,180}}, preserveAspectRatio=false), graphics));
        end MovePointCylinderToCylinderPoint;

        model ForceCylinderToCylinderPoint
        "Force Calculation between contact points for Block MovePointCylinderToCylinderP "
          import SI = Modelica.SIunits;

          parameter SI.Frequency f=10000000;
          parameter SI.TranslationalSpringConstant c=100000;
          parameter SI.TranslationalDampingConstant d=100000;
          parameter Real n1 = 1.5;
          parameter Real n2 = n1;
          parameter SI.CoefficientOfFriction mue_r=0.0001
          "rolling friction coefficient";
          parameter Real gamma1=1;
          parameter Real gamma2=1;
          parameter Real gamma3=1;
          parameter Real gamma4=1;
          parameter Real gamma5=1;
          parameter Real gamma6=1;
          parameter SI.Distance t_max=0.0001 "maximal depth of impression";

          constant Real pi=Modelica.Constants.pi;
          final parameter Modelica.Mechanics.MultiBody.Types.Axis y_direction={0,1,0}
          "cartesian coordinate system in y direction -- direction of gravity";
          final parameter Modelica.Mechanics.MultiBody.Types.Axis x_direction={1,0,0}
          "cartesian coordinate system in x direction";
          final parameter Modelica.Mechanics.MultiBody.Types.Axis z_direction=cross(x_direction, y_direction);

        // BCS1: body coordinate system resolved in center of cylinder1
        // BCS2: body coordinate system resolved in center of cylinder2
        // BCS3: body coordinate system resolved in contact point cylinder1 with the same orientation as BCS1
        // BCS4: body coordinate system resolved in contact point cylinder2 with the same orientation as BCS2

         Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP_mp12(resolveInFrame=
                Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "relativ position cylinder1 contact point resolved in BCS4"
           annotation (Placement(transformation(
               extent={{-6,-6},{6,6}},
               rotation=0,
               origin={10,58})));
          Modelica.Mechanics.MultiBody.Sensors.AbsoluteAngularVelocity aAV1(
              resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameA.frame_resolve)
          "angular velocity contact point cylinder1 resolved in BCS1"
            annotation (Placement(transformation(extent={{-6,-6},{6,6}},
                rotation=270,
                origin={40,38})));
         Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP_c12( resolveInFrame=
                Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "relativ position center of mass cylinder1 resolved in BCS2"
           annotation (Placement(transformation(
               extent={{-6,-6},{6,6}},
               rotation=90,
               origin={-68,0})));
      public
          Modelica.Mechanics.MultiBody.Forces.Force force(resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a,
              animation=false) "Force resolved in BCS4"
            annotation (Placement(transformation(
                extent={{-6,-6},{6,6}},
                rotation=0,
                origin={10,80})));
          Modelica.Blocks.Routing.DeMultiplex4 deMultiplex1(
            n1=3,
            n2=3,
            n3=3,
            n4=3) annotation (Placement(transformation(extent={{-90,14},{-78,26}})));
          Modelica.Blocks.Routing.DeMultiplex4 deMultiplex2(
            n1=3,
            n2=3,
            n3=3,
            n4=3) annotation (Placement(transformation(extent={{-90,-26},{-78,-14}})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a1
          "center of mass cylinder1 in BCS1"
                                  annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=0,
                origin={-102,60})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a2
          "center of mass cylinder2 in BCS2"
                                  annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=0,
                origin={-102,-60})));
          Modelica.Blocks.Interfaces.RealInput vector_cylinder2[12]
          "length_direction and radius and half_length"
            annotation (Placement(transformation(extent={{-8,-8},{8,8}},
                rotation=0,
                origin={-108,-20})));
          Modelica.Blocks.Interfaces.RealInput vector_cylinder1[12]
          "length_direction and radius and half_length"
            annotation (Placement(transformation(extent={{-8,-8},{8,8}},
                rotation=0,
                origin={-108,20})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a3
          "contact point cylinder2 BCS4"
                                  annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=90,
                origin={-20,102})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a4
          "contact point cylinder1 BCS3"
                                  annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=90,
                origin={40,102})));
         Real Length_Direction_cy1[3]
          "length direction cylinder1 default (1,0,0)";
         Real Dw_Direction_cy1[3]
          "diameter width direction cylinder1 default (0,0,1)";
         Real Dh_Direction_cy1[3]
          "diameter height direction cylinder1 default (0,1,0)";
         Real R_l_cy1[3] "radius and half-length cylinder1";

         Real Length_Direction_cy2[3]
          "length direction cylinder2 default (1,0,0)";
         Real Dw_Direction_cy2[3]
          "diameter width direction cylinder2 default (0,0,1)";
         Real Dh_Direction_cy2[3]
          "diameter height direction cylinder2 default (0,1,0)";
         Real R_l_cy2[3] "radius and half-length cylinder1";

         Modelica.Blocks.Interfaces.BooleanOutput contact
            annotation (Placement(transformation(extent={{96,-12},{116,8}})));

         Real w_rel_cc;
         Real h_rel_cc;
         Real l_rel_cc;

         Real l_rel_mp12;
         Real h_rel_mp12
          "relative position contact point cylinder1 in length direction BCS4";
         Real w_rel_mp12
          "relative position contact point cylinder1 in width direction BCS4";

         Real f_nh_mp
          "normal force to cylinder1 resolved in BCS2 height direction";
         Real f_nw_mp
          "normal force to cylinder1 resolved in BCS2 width direction";
         Real f_n_mp;

        //  Real w_l
        //     "absolut angular velocity center of cylinder1 around length direction resolved in BCS2";
        //  Real v_r
        //     "circumferential velocity cylinder1 around length direction resolved in BCS2";
        //
        //  Real v_rel_l "relative velocity cylinder1 in length direction BCS2";
        //  Real v_rel_w "relative velocity cylinder1 in width direction BCS2";
        //  Real v_rel_h "relative velocity cylinder1 in height direction BCS2";

         Real r_ct1_BCS1[3] "position contact point cylinder1 resolved in BCS1";
         Real r_ct2_BCS2[3] "position contact point cylinder2 resolved in BCS2";
         Real v_cm1_BCS2[3]
          "velocity center of mass cylinder1 resolved in BCS2 (velocity center of mass cylinder2 resolved in BCS2 is zero)";
         Real v_ct1_BCS2[3] "velocity contact point1 resolved in BCS2";
         Real v_ct2_BCS2[3] "velocity contact point2 resolved in BCS2";
         Real T_BCS12[3,3]
          "Transmation matrix from orientation objekt to rotate BCS1 into BCS2";
         Real v_rel_ct_BCS2[3]
          "relative velocity contact points resolved in BCS2";

         Real f_fw_mp "friction to cylinder1 resolved in BCS2 width direction";
         Real f_fh_mp "friction to cylinder1 resolved in BCS2 height direction";
         Real f_fl_mp;

         Real f_normal_mp[3] "normal force to cylinder1 resolved in BCS2";
         Real f_tangential_mp[3] "friction to cyilnder1 resolved in BCS2";

          Modelica.Blocks.Interfaces.BooleanInput enabled
          "Connector of Boolean input signal"   annotation (Placement(
                transformation(
                extent={{-20,-20},{20,20}},
                rotation=90,
                origin={2,-100})));
          Modelica.Mechanics.MultiBody.Sensors.AbsoluteAngularVelocity aAV2(
              resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameA.frame_resolve)
          "angular velocity contact point cylinder1 resolved in BCS1"
            annotation (Placement(transformation(extent={{-6,-6},{6,6}},
                rotation=270,
                origin={-20,-60})));
         Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP_ct2_BCS2(
              resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "relativ position contact point cylinder2 resolved in BCS2"
           annotation (Placement(transformation(
               extent={{-6,-6},{6,6}},
               rotation=0,
               origin={-44,-36})));
         Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP_ct1_BCS1(
              resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "relativ position contact point cylinder1 resolved in BCS1"
           annotation (Placement(transformation(
               extent={{-6,-6},{6,6}},
               rotation=0,
               origin={40,12})));
        equation
           R_l_cy1=deMultiplex1.y4;
           Length_Direction_cy1=deMultiplex1.y1;
           Dw_Direction_cy1=deMultiplex1.y2;
           Dh_Direction_cy1=deMultiplex1.y3;

           R_l_cy2=deMultiplex2.y4;
           Length_Direction_cy2=deMultiplex2.y1;
           Dw_Direction_cy2=deMultiplex2.y2;
           Dh_Direction_cy2=deMultiplex2.y3;

           w_rel_cc = rP_c12.r_rel*Dw_Direction_cy2;
           h_rel_cc = rP_c12.r_rel*Dh_Direction_cy2;
           l_rel_cc = rP_c12.r_rel*Length_Direction_cy2;

           l_rel_mp12 = rP_mp12.r_rel*Length_Direction_cy2;
           h_rel_mp12 = rP_mp12.r_rel*Dh_Direction_cy2;
           w_rel_mp12 = rP_mp12.r_rel*Dw_Direction_cy2;

          r_ct1_BCS1 = rP_ct1_BCS1.r_rel;
          r_ct2_BCS2 = rP_ct2_BCS2.r_rel;
          v_cm1_BCS2 = der(rP_c12.r_rel);
          T_BCS12 = Modelica.Mechanics.MultiBody.Frames.to_T(Modelica.Mechanics.MultiBody.Frames.relativeRotation(frame_a4.R, frame_a3.R));

        //----------contact condition--------------------------------------------------------------------------------------------------
           contact = (h_rel_mp12)<0 and (h_rel_mp12)>-t_max and (w_rel_mp12)<0 and (w_rel_mp12)>-t_max and abs(l_rel_mp12)<t_max;
        //-----------------------------------------------------------------------------------------------------------------------------

        //----------relative velocity resolved in BCS2-----------------------------
        //    w_l = aAV.w*Length_Direction_cy2;
        //    v_r = w_l*R_l_cy1[1];
        //    v_rel_h=der(h_rel_cc)-v_r;
        //    v_rel_w=der(w_rel_cc)-v_r;
        //    v_rel_l=der(l_rel_cc);
              v_ct1_BCS2 = v_cm1_BCS2 + T_BCS12*cross(aAV1.w,r_ct1_BCS1);
              v_ct2_BCS2 = cross(aAV2.w,r_ct2_BCS2);
              v_rel_ct_BCS2 = v_ct2_BCS2 - v_ct1_BCS2;
        //------------------------------------------------------------------------

        //----------force resolved in BCS4------------------------------------------------------------------------------------------------------------------------------
           f_nh_mp = sign(h_rel_mp12)*(c*abs(h_rel_mp12)^n1) + d*abs(h_rel_mp12)^n2*der(h_rel_mp12);
           f_nw_mp = sign(w_rel_mp12)*(c*abs(w_rel_mp12)^n1) + d*abs(w_rel_mp12)^n2*der(w_rel_mp12);
           f_n_mp = sqrt(f_nh_mp^2+f_nw_mp^2);

            //mue=gamma1*(tanh(gamma2*v_rel)-tanh(gamma3*v_rel))+gamma4*tanh(gamma5*v_rel)+gamma6*v_rel
        //    f_fw_mp = (gamma1*(tanh(gamma2*v_rel_w)-tanh(gamma3*v_rel_w))+gamma4*tanh(gamma5*v_rel_w)+gamma6*v_rel_w)*(-f_nh_mp) + mue_r*tanh(v_rel_w*gamma2)*(f_nh_mp);
        //    f_fh_mp = (gamma1*(tanh(gamma2*v_rel_h)-tanh(gamma3*v_rel_h))+gamma4*tanh(gamma5*v_rel_h)+gamma6*v_rel_h)*(-f_nw_mp) + mue_r*tanh(v_rel_h*gamma2)*(f_nw_mp);
        //    f_fl_mp = (gamma1*(tanh(gamma2*v_rel_l)-tanh(gamma3*v_rel_l))+gamma4*tanh(gamma5*v_rel_l)+gamma6*v_rel_l)*(-f_n_mp);
           f_fw_mp = (gamma1*(tanh(gamma2*v_rel_ct_BCS2*Dw_Direction_cy2)-tanh(gamma3*v_rel_ct_BCS2*Dw_Direction_cy2))+gamma4*tanh(gamma5*v_rel_ct_BCS2*Dw_Direction_cy2)+gamma6*v_rel_ct_BCS2*Dw_Direction_cy2)*abs(f_nh_mp) + mue_r*tanh(v_rel_ct_BCS2*Dw_Direction_cy2*gamma2)*abs(f_nh_mp);
           f_fh_mp = (gamma1*(tanh(gamma2*v_rel_ct_BCS2*Dh_Direction_cy2)-tanh(gamma3*v_rel_ct_BCS2*Dh_Direction_cy2))+gamma4*tanh(gamma5*v_rel_ct_BCS2*Dh_Direction_cy2)+gamma6*v_rel_ct_BCS2*Dh_Direction_cy2)*abs(f_nw_mp) + mue_r*tanh(v_rel_ct_BCS2*Dh_Direction_cy2*gamma2)*abs(f_nw_mp);
           f_fl_mp = (gamma1*(tanh(gamma2*v_rel_ct_BCS2*Length_Direction_cy2)-tanh(gamma3*v_rel_ct_BCS2*Length_Direction_cy2))+gamma4*tanh(gamma5*v_rel_ct_BCS2*Length_Direction_cy2)+gamma6*v_rel_ct_BCS2*Length_Direction_cy2)*abs(f_n_mp);
           if (contact) and enabled then
             f_normal_mp = -f_nh_mp*Dh_Direction_cy2 - f_nw_mp*Dw_Direction_cy2;
             f_tangential_mp = f_fw_mp*Dw_Direction_cy2 + f_fw_mp*Length_Direction_cy2 + f_fl_mp*Length_Direction_cy2;
           else
             f_normal_mp=zeros(3);
             f_tangential_mp=zeros(3);
           end if;

           force.force=f_normal_mp+f_tangential_mp;
        //--------------------------------------------------------------------------------------------------------------------------------------------------------------
          connect(rP_mp12.frame_a,frame_a3)     annotation (Line(
              points={{4,58},{-20,58},{-20,102}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_mp12.frame_b,frame_a4)     annotation (Line(
              points={{16,58},{40,58},{40,102}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_c12.frame_a,frame_a2)  annotation (Line(
              points={{-68,-6},{-68,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_c12.frame_b,frame_a1)  annotation (Line(
              points={{-68,6},{-68,60},{-102,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(force.frame_a,frame_a3)  annotation (Line(
              points={{4,80},{-20,80},{-20,102}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(force.frame_b,frame_a4)  annotation (Line(
              points={{16,80},{40,80},{40,102}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(deMultiplex1.u,vector_cylinder1)  annotation (Line(
              points={{-91.2,20},{-108,20}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(deMultiplex2.u,vector_cylinder2)  annotation (Line(
              points={{-91.2,-20},{-108,-20}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(aAV1.frame_a, frame_a4)
                                         annotation (Line(
              points={{40,44},{40,102}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(aAV1.frame_resolve, frame_a1)
                                               annotation (Line(
              points={{33.94,38},{-34,38},{-34,60},{-102,60}},
              color={95,95,95},
              pattern=LinePattern.Dot,
              smooth=Smooth.None));
          connect(aAV2.frame_a, frame_a3) annotation (Line(
              points={{-20,-54},{-20,102}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(aAV2.frame_resolve, frame_a2) annotation (Line(
              points={{-26.06,-60},{-102,-60}},
              color={95,95,95},
              pattern=LinePattern.Dot,
              smooth=Smooth.None));
          connect(rP_ct2_BCS2.frame_b, frame_a3) annotation (Line(
              points={{-38,-36},{-20,-36},{-20,102}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_ct2_BCS2.frame_a, frame_a2) annotation (Line(
              points={{-50,-36},{-68,-36},{-68,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_ct1_BCS1.frame_a, frame_a1) annotation (Line(
              points={{34,12},{-34,12},{-34,60},{-102,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_ct1_BCS1.frame_b, frame_a4) annotation (Line(
              points={{46,12},{64,12},{64,102},{40,102}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          annotation (Diagram(coordinateSystem(preserveAspectRatio=true,
                  extent={{-100,-100},{100,100}}), graphics));
        end ForceCylinderToCylinderPoint;
         annotation(preferredView="info");
      end Components;
       annotation(preferredView="info",
                  preferredView="info");
    end LinearContact;

    package PlanarContact "Source package for planar contact area"
      extends Modelica.Icons.SourcesPackage;
      model RectangleToRectangle
        extends IdealizedContact.Components.PartialContactBlock;

    public
        IdealizedContact.ContactBlock.PlanarContact.Components.MovePointRectangleToRectangle
                                                                                             geometry[4](
        q_L={1,-1,-1,1},
        q_W={1,1,-1,-1},
        f={f,f,f,f},
        exact={exact,exact,exact,exact}) annotation (Placement(transformation(extent={{-42,6},{18,66}})));
        IdealizedContact.ContactBlock.PlanarContact.Components.ForceRectangleToRectangle
                                                                                         force[4](
        d={dampingCoefficient,dampingCoefficient,dampingCoefficient,dampingCoefficient},
        n1={N1,N1,N1,N1},
        n2={N2,N2,N2,N2},
        t_max={p_max,p_max,p_max,p_max},
        q_l={-1,1,1,-1},
        q_w={-1,-1,1,1},
        c={springCoefficient,springCoefficient,springCoefficient,springCoefficient},
        f={f,f,f,f},
        Animation={animation,animation,animation,animation},
        exact={exact,exact,exact,exact},
        radiusContactPoint={radiusContactPoint,radiusContactPoint,radiusContactPoint,radiusContactPoint},
        Color_contact_point_rectangle1={colorContactPoints1,colorContactPoints1,colorContactPoints1,colorContactPoints1},
        Color_contact_point_rectangle2={colorContactPoints2,colorContactPoints2,colorContactPoints2,colorContactPoints2},
        gamma1={gamma1,gamma1,gamma1,gamma1},
        gamma2={gamma2,gamma2,gamma2,gamma2},
        gamma3={gamma3,gamma3,gamma3,gamma3},
        gamma4={gamma4,gamma4,gamma4,gamma4},
        gamma5={gamma5,gamma5,gamma5,gamma5},
        gamma6={gamma6,gamma6,gamma6,gamma6}) annotation (Placement(transformation(extent={{-42,-66},{18,-6}})));

      equation
       assert((Modelica.Utilities.Strings.isEqual(surfaceType1,"rectangular") and Modelica.Utilities.Strings.isEqual(surfaceType2,"rectangular")),"Error in contact specification: Contact definition is RectangleToRectangle but other contact surfaces are connected to the contact block.",level=AssertionLevel.error);
       contact=force[1].contact or force[2].contact or force[3].contact or force[4].contact;
      connect(geometry.frame_b1, force.frame_a2)
        annotation (Line(
          points={{6,5.4},{6,-5.4}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(geometry[1].frame_a1, frame_a)
        annotation (Line(
          points={{-42.6,60},{-82,60},{-82,86},{-102,86}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(geometry[2].frame_a1, frame_a)
        annotation (Line(
          points={{-42.6,60},{-82,60},{-82,86},{-102,86}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(geometry[3].frame_a1, frame_a)
        annotation (Line(
          points={{-42.6,60},{-82,60},{-82,86},{-102,86}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(geometry[4].frame_a1, frame_a)
        annotation (Line(
          points={{-42.6,60},{-82,60},{-82,86},{-102,86}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(geometry[1].vector_b, vector_1)
        annotation (Line(
          points={{-44.4,42},{-92,42},{-92,37},{-107,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(geometry[2].vector_b, vector_1)
        annotation (Line(
          points={{-44.4,42},{-92,42},{-92,37},{-107,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(geometry[3].vector_b, vector_1)
        annotation (Line(
          points={{-44.4,42},{-92,42},{-92,37},{-107,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(geometry[4].vector_b, vector_1)
        annotation (Line(
          points={{-44.4,42},{-92,42},{-92,37},{-107,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(force[1].vector_b, vector_1)
        annotation (Line(
          points={{-44.4,-24},{-92,-24},{-92,37},{-107,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(force[2].vector_b, vector_1)
        annotation (Line(
          points={{-44.4,-24},{-92,-24},{-92,37},{-107,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(force[3].vector_b, vector_1)
        annotation (Line(
          points={{-44.4,-24},{-92,-24},{-92,37},{-107,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(force[4].vector_b, vector_1)
        annotation (Line(
          points={{-44.4,-24},{-92,-24},{-92,37},{-107,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(force[1].vector_q, vector_2)
        annotation (Line(
          points={{-44.4,-48},{-80,-48},{-80,-30},{-106,-30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(force[2].vector_q, vector_2)
        annotation (Line(
          points={{-44.4,-48},{-80,-48},{-80,-30},{-106,-30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(force[3].vector_q, vector_2)
        annotation (Line(
          points={{-44.4,-48},{-80,-48},{-80,-30},{-106,-30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(force[4].vector_q, vector_2)
        annotation (Line(
          points={{-44.4,-48},{-80,-48},{-80,-30},{-106,-30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(vector_2, geometry[1].vector_q)
        annotation (Line(
          points={{-106,-30},{-80,-30},{-80,24},{-44.4,24}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(vector_2, geometry[2].vector_q)
        annotation (Line(
          points={{-106,-30},{-80,-30},{-80,24},{-44.4,24}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(vector_2, geometry[3].vector_q)
        annotation (Line(
          points={{-106,-30},{-80,-30},{-80,24},{-44.4,24}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(vector_2, geometry[4].vector_q)
        annotation (Line(
          points={{-106,-30},{-80,-30},{-80,24},{-44.4,24}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(frame_b, geometry[1].frame_a2)
        annotation (Line(
          points={{-102,-74},{-68,-74},{-68,12},{-42.6,12}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(frame_b, geometry[2].frame_a2)
        annotation (Line(
          points={{-102,-74},{-68,-74},{-68,12},{-42.6,12}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(frame_b, geometry[3].frame_a2)
        annotation (Line(
          points={{-102,-74},{-68,-74},{-68,12},{-42.6,12}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(frame_b, geometry[4].frame_a2)
        annotation (Line(
          points={{-102,-74},{-68,-74},{-68,12},{-42.6,12}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(geometry.frame_b2, force.frame_a1)
        annotation (Line(
          points={{-18,5.4},{-18,-5.4}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(force[1].frame_a3, frame_b)
        annotation (Line(
          points={{-42.6,-60},{-68,-60},{-68,-74},{-102,-74}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(force[2].frame_a3, frame_b)
        annotation (Line(
          points={{-42.6,-60},{-68,-60},{-68,-74},{-102,-74}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(force[3].frame_a3, frame_b)
        annotation (Line(
          points={{-42.6,-60},{-68,-60},{-68,-74},{-102,-74}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(force[4].frame_a3, frame_b)
        annotation (Line(
          points={{-42.6,-60},{-68,-60},{-68,-74},{-102,-74}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(geometry.angle, force.angle)
        annotation (Line(
          points={{21,30},{32,30},{32,-29.7},{21.3,-29.7}},
          color={0,0,127},
          smooth=Smooth.None));
        annotation (Diagram(graphics), Icon(graphics={Rectangle(extent={{-100,100},
                    {100,-100}}, lineColor={255,128,0}), Text(
                extent={{-80,10},{84,-10}},
                lineColor={0,0,255},
              textString="%name")}),
          Documentation(info="<!DOCTYPE html><html>
</html>"));
      end RectangleToRectangle;

      model CircleToRectangle
        extends IdealizedContact.Components.PartialContactBlock;

    public
        IdealizedContact.ContactBlock.PlanarContact.Components.MovePointCircleToRectangle
                                                                                          geometry(f=f, exact=exact)
        annotation (Placement(transformation(extent={{-40,12},{20,72}})));
        IdealizedContact.ContactBlock.PlanarContact.Components.ForceCircleToRectangle
                                                                                      force[4](
        d={dampingCoefficient,dampingCoefficient,dampingCoefficient,dampingCoefficient},
        n1={N1,N1,N1,N1},
        n2={N2,N2,N2,N2},
        t_max={p_max,p_max,p_max,p_max},
        q_l={-1,1,1,-1},
        q_w={-1,-1,1,1},
        c={springCoefficient,springCoefficient,springCoefficient,springCoefficient},
        f={f,f,f,f},
        exact={exact,exact,exact,exact},
        radiusContactPoint={radiusContactPoint,radiusContactPoint,radiusContactPoint,radiusContactPoint},
        gamma1={gamma1,gamma1,gamma1,gamma1},
        gamma2={gamma2,gamma2,gamma2,gamma2},
        gamma3={gamma3,gamma3,gamma3,gamma3},
        gamma4={gamma4,gamma4,gamma4,gamma4},
        gamma5={gamma5,gamma5,gamma5,gamma5},
        gamma6={gamma6,gamma6,gamma6,gamma6},
        Color_contact_point_rectangle={colorContactPoints2,colorContactPoints2,colorContactPoints2,colorContactPoints2},
        Color_contact_point_circle={colorContactPoints1,colorContactPoints1,colorContactPoints1,colorContactPoints1},
        Animation={animation,animation,animation,animation}) annotation (Placement(transformation(extent={{-40,-72},{20,-12}})));
      equation
         assert((Modelica.Utilities.Strings.isEqual(surfaceType1,"circular") and Modelica.Utilities.Strings.isEqual(surfaceType2,"rectangular")),"Error in contact specification: Contact definition is CircleToRectangle but other contact surfaces are connected to the contact block.",level=AssertionLevel.error);
       contact=force[1].contact or force[2].contact or force[3].contact or force[4].contact;
      connect(geometry.frame_b2, force.frame_a1)
        annotation (Line(
          points={{20.6,24},{32,24},{32,-24},{20.6,-24}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(geometry.frame_b1, force.frame_a2)
        annotation (Line(
          points={{20.6,60},{40,60},{40,-60},{20.6,-60}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(geometry.frame_a1, frame_a)
        annotation (Line(
          points={{-41.2,60},{-72,60},{-72,86},{-102,86}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(geometry.frame_a2, frame_b)
        annotation (Line(
          points={{-40.6,24},{-60,24},{-60,-74},{-102,-74}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(geometry.vector_circle, vector_1)
        annotation (Line(
          points={{-41.8,48},{-74,48},{-74,37},{-107,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(geometry.vector_rectangle, vector_2)
        annotation (Line(
          points={{-41.8,36},{-78,36},{-78,-30},{-106,-30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(force[1].frame_a4, frame_b)
        annotation (Line(
          points={{-40.6,-60},{-72,-60},{-72,-74},{-102,-74}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(force[2].frame_a4, frame_b)
        annotation (Line(
          points={{-40.6,-60},{-72,-60},{-72,-74},{-102,-74}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(force[3].frame_a4, frame_b)
        annotation (Line(
          points={{-40.6,-60},{-72,-60},{-72,-74},{-102,-74}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(force[4].frame_a4, frame_b)
        annotation (Line(
          points={{-40.6,-60},{-72,-60},{-72,-74},{-102,-74}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(force[1].vector_rectangle, vector_2)
        annotation (Line(
          points={{-41.8,-48},{-78,-48},{-78,-30},{-106,-30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(force[2].vector_rectangle, vector_2)
        annotation (Line(
          points={{-41.8,-48},{-78,-48},{-78,-30},{-106,-30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(force[3].vector_rectangle, vector_2)
        annotation (Line(
          points={{-41.8,-48},{-78,-48},{-78,-30},{-106,-30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(force[4].vector_rectangle, vector_2)
        annotation (Line(
          points={{-41.8,-48},{-78,-48},{-78,-30},{-106,-30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(force[1].vector_circle, vector_1)
        annotation (Line(
          points={{-41.8,-36},{-74,-36},{-74,37},{-107,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(force[2].vector_circle, vector_1)
        annotation (Line(
          points={{-41.8,-36},{-74,-36},{-74,37},{-107,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(force[3].vector_circle, vector_1)
        annotation (Line(
          points={{-41.8,-36},{-74,-36},{-74,37},{-107,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(force[4].vector_circle, vector_1)
        annotation (Line(
          points={{-41.8,-36},{-74,-36},{-74,37},{-107,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(force[1].frame_a3, frame_a)
        annotation (Line(
          points={{-32.8,-24},{-88,-24},{-88,86},{-102,86}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(force[2].frame_a3, frame_a)
        annotation (Line(
          points={{-32.8,-24},{-88,-24},{-88,86},{-102,86}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(force[3].frame_a3, frame_a)
        annotation (Line(
          points={{-32.8,-24},{-88,-24},{-88,86},{-102,86}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
      connect(force[4].frame_a3, frame_a)
        annotation (Line(
          points={{-32.8,-24},{-88,-24},{-88,86},{-102,86}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
        annotation (Icon(graphics={                   Rectangle(extent={{-100,100},
                    {100,-100}}, lineColor={255,128,0}), Text(
                extent={{-80,10},{84,-10}},
                lineColor={0,0,255},
              textString="%name")}),     Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
                                                 graphics));
      end CircleToRectangle;

      package Components
      extends Modelica.Icons.BasesPackage;
        model MovePointRectangleToRectangle

          parameter Boolean exact=true;
          parameter Modelica.SIunits.Frequency f=10000000;
          parameter Real q_L=1;
          parameter Real q_W=1;
          //parameter Real q_H=1;
          final parameter Modelica.Mechanics.MultiBody.Types.Axis y_direction={0,1,0}
          "cartesian coordinate system in y direction -- direction of gravity";
          final parameter Modelica.Mechanics.MultiBody.Types.Axis x_direction={1,0,0}
          "cartesian coordinate system in x direction";
          final parameter Modelica.Mechanics.MultiBody.Types.Axis z_direction=cross(x_direction, y_direction);
        // BCS1 - body coordinate system resolved in center of rectangle1
        // BCS2 - body coordinate system resolved in center of rectangle2
        // BCS3 - body coordinate system resolved in contact point rectangle1 with the same orientation as BCS1
        // BCS4 - body coordinate system resolved in contact point rectangle2 with the same orientation as BCS2

          Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a1
          "frame center of rectangle1 BCS1"
            annotation (Placement(transformation(extent={{-118,64},{-86,96}})));
          Modelica.Blocks.Interfaces.RealInput vector_b[12]
          "L/W-direction and L_W_H"
            annotation (Placement(transformation(extent={{-8,-8},{8,8}},
                rotation=0,
                origin={-108,20})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b1
          "contact point rectangle1 BCS3"
            annotation (Placement(transformation(extent={{-16,-16},{16,16}},
                rotation=90,
                origin={60,-102})));

          Modelica.Blocks.Interfaces.RealInput vector_q[12]
          "Length/Width-direction and L_W_H"
            annotation (Placement(transformation(extent={{-8,-8},{8,8}},
                rotation=0,
                origin={-108,-40})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a2
          "frame center of rectangle2 BCS2"
            annotation (Placement(transformation(extent={{-118,-96},{-86,-64}})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b2
          "contact point rechtangle2 BCS4"
                                     annotation (Placement(transformation(
                extent={{-16,-16},{16,16}},
                rotation=90,
                origin={-20,-102})));
      public
          IdealizedContact.Components.Utilities.variablePrism1 variablePrism_r1
          "from center of rectangle1 to contact point"
            annotation (Placement(transformation(extent={{-34,70},{-14,90}})));
      public
          IdealizedContact.Components.Utilities.variablePrism1 variablePrism_r2
          "from center of rectangle to contact point"
            annotation (Placement(transformation(extent={{-52,-90},{-32,-70}})));

          Real L_direction_1[3] "length direction rectangle1";
          Real W_direction_1[3] "width direction rectangle1";
          Real H_direction_1[3] "height direction rectangle1";
          Real L_W_H_1[3] "length, width, height of rectangle1";
          Real L_direction_2[3] "length direction rectangle2";
          Real W_direction_2[3] "width direction rectangle2";
          Real H_direction_2[3] "height direction rectangle2";
          Real L_W_H_2[3] "length. width, height of rectangle2";

          Real L1_2[3] "length direction rectangle1 resolved in BCS2";
          Real L1_2_otLW2[3]
          "orthogonal projektion of vector L1_2 on L-W plane of BCS2";
          Real s1;
          Real s2;

          Modelica.Blocks.Interfaces.RealOutput angle
            annotation (Placement(transformation(extent={{100,-30},{120,-10}})));
          IdealizedContact.Components.VectorCalculations.angleBetweenTwoVectorsBlock
            angle_LL
            annotation (Placement(transformation(extent={{70,-34},{90,-14}})));
          IdealizedContact.Components.VectorCalculations.orthogonalProjectionBlock
            otprojektion
            annotation (Placement(transformation(extent={{80,80},{100,100}})));
      public
          Modelica.Mechanics.MultiBody.Sensors.TansformRelativeVector
            tansformRelativeVector(frame_r_in=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a,
              frame_r_out=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_b)
            annotation (Placement(transformation(extent={{-6,-6},{6,6}},
                rotation=90,
                origin={-66,-2})));
          Modelica.Blocks.Routing.DeMultiplex4 deMultiplex3(
            n1=3,
            n2=3,
            n3=3,
            n4=3) annotation (Placement(transformation(extent={{-94,14},{-82,26}})));
          Modelica.Blocks.Routing.DeMultiplex4 deMultiplex3_2(
            n1=3,
            n2=3,
            n3=3,
            n4=3) annotation (Placement(transformation(extent={{-94,-46},{-82,-34}})));
        equation

           L_direction_1 = deMultiplex3.y1;
           W_direction_1 = deMultiplex3.y2;
           H_direction_1 = deMultiplex3.y3;
           L_W_H_1 = deMultiplex3.y4;

           L_direction_2 = deMultiplex3_2.y1;
           W_direction_2 = deMultiplex3_2.y2;
           H_direction_2 = deMultiplex3_2.y3;
           L_W_H_2 = deMultiplex3_2.y4;

           tansformRelativeVector.r_in = L_direction_1
          "input for Transformation rectangle1 Length-vector from BCS1 to BCS2";
           L1_2 = tansformRelativeVector.r_out;

           otprojektion.vector_in = L1_2;
           otprojektion.u = L_direction_2;
           otprojektion.v = W_direction_2;
           L1_2_otLW2 = otprojektion.vector_out;

           angle_LL.vector1 = L1_2_otLW2;
           angle_LL.vector2 = L_direction_2;

        //----------offset from center of rectangle1 to contact point resolved in BCS1----------
          s1=0.5*sqrt((L_W_H_1[1])^2+(L_W_H_1[2])^2);
          variablePrism_r1.s_ref = s1;
          variablePrism_r1.n = 1/s1*(q_L*L_direction_1*L_W_H_1[1] + q_W*W_direction_1*L_W_H_1[2]);

        //--------------------------------------------------------------------------------------

        //----------offset from center of rectangle2 to contact point resolved in BCS2----------
          s2=0.5*sqrt((L_W_H_2[1])^2+(L_W_H_2[2])^2);
          variablePrism_r2.s_ref = s2;
          variablePrism_r2.n = 1/s2*(q_L*L_direction_2*L_W_H_2[1] + q_W*W_direction_2*L_W_H_2[2]);

        //--------------------------------------------------------------------------------------

         assert(not (L_W_H_2[1]<L_W_H_1[1] and L_W_H_2[2]<L_W_H_1[2]),"Warning: Rectangle at port 1 is bigger than the rectangle at port 2 in every direction. Please change connection of contact block. Bigger rectangle must be connected to port 2.");

          connect(variablePrism_r1.frame_a, frame_a1)  annotation (Line(
              points={{-34,80},{-102,80}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variablePrism_r2.frame_a, frame_a2)  annotation (Line(
              points={{-52,-80},{-102,-80}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(angle_LL.angle, angle) annotation (Line(
              points={{90,-19},{90,-20},{110,-20}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(tansformRelativeVector.frame_a, frame_a2) annotation (Line(
              points={{-66,-8},{-66,-80},{-102,-80}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(tansformRelativeVector.frame_b, frame_a1) annotation (Line(
              points={{-66,4},{-66,80},{-102,80}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variablePrism_r1.frame_b, frame_b1) annotation (Line(
              points={{-14,80},{60,80},{60,-102}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variablePrism_r2.frame_b, frame_b2) annotation (Line(
              points={{-32,-80},{-20,-80},{-20,-102}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(vector_b, deMultiplex3.u) annotation (Line(
              points={{-108,20},{-95.2,20}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(vector_q, deMultiplex3_2.u) annotation (Line(
              points={{-108,-40},{-95.2,-40}},
              color={0,0,127},
              smooth=Smooth.None));
          annotation (Diagram(graphics));
        end MovePointRectangleToRectangle;

        model ForceRectangleToRectangle

          import SI = Modelica.SIunits;
          parameter Boolean exact=true;
          parameter SI.Frequency f=10000000;
          parameter SI.TranslationalSpringConstant c=600000000;
          parameter SI.TranslationalDampingConstant d=10000;
          parameter Real n1 = 1.5;
          parameter Real n2 = n1;

          parameter Real gamma1=1;
          parameter Real gamma2=1;
          parameter Real gamma3=1;
          parameter Real gamma4=1;
          parameter Real gamma5=1;
          parameter Real gamma6=1;
          parameter SI.Distance t_max=0.0001 "Maximale Eindringtiefe";
          //parameter SI.Velocity v_th=0.001 "v_thres";
          parameter Real q_l=1;
          parameter Real q_w=1;
          constant Real pi=Modelica.Constants.pi;
          final parameter Modelica.Mechanics.MultiBody.Types.Axis y_direction={0,1,0}
          "cartesian coordinate system in y direction -- default gravity direction";
          final parameter Modelica.Mechanics.MultiBody.Types.Axis x_direction={1,0,0}
          "cartesian coordinate system in x direction";
          final parameter Modelica.Mechanics.MultiBody.Types.Axis z_direction=cross(x_direction, y_direction);

          parameter Boolean Animation=true;
          parameter Modelica.SIunits.Radius radiusContactPoint=0.005;
          parameter Modelica.Mechanics.MultiBody.Types.Color
            Color_contact_point_rectangle1 =                                            {0,180,0};
          parameter Modelica.Mechanics.MultiBody.Types.Color
            Color_contact_point_rectangle2 =                                            {255,0,255};

        // BCS1 - body coordinate system resolved in center of rectangle1
        // BCS2 - body coordinate system resolved in center of rectangle2
        // BCS3 - body coordinate system resolved in contact point rectangle1 with the same orientation as BCS1
        // BCS4 - body coordinate system resolved in contact point rectangle2 with the same orientation as BCS2

          Modelica.Blocks.Interfaces.RealInput vector_q[12]
          "Length/Width-direction and L_W_H"
            annotation (Placement(transformation(extent={{-8,-8},{8,8}},
                rotation=0,
                origin={-108,-40})));
          Modelica.Blocks.Interfaces.RealInput vector_b[12]
          "Length/Width-direction and L_W_H"
            annotation (Placement(transformation(extent={{-8,-8},{8,8}},
                rotation=0,
                origin={-108,40})));
          Modelica.Blocks.Interfaces.BooleanOutput contact
            annotation (Placement(transformation(extent={{96,-12},{116,8}})));

          Real L_direction_1[3] "length direction rectangle1";
          Real W_direction_1[3] "width direction rectangle1";
          Real H_direction_1[3] "height direction rectangle1";
          Real L_W_H_1[3] "length, width, height of rectangle1";
          Real L_direction_2[3] "length direction rectangle2";
          Real W_direction_2[3] "width direction rectangle2";
          Real H_direction_2[3] "height direction rectngle2";
          Real L_W_H_2[3] "length, width, height of rectangle2";

          Real phi "angle between L1_2_otLW2 and L_direction2";
          //Real sin_phi "sinus phi";
          //Real cos_phi "cosinus phi";

          Real offset_pl
          "distance between contact point rectangle1 to width edage rectangle2";
          Real offset_pw
          "distance between contact point rectalgne1 to length edge rectangle2";
          Real l_offset
          "offset contact point of rectangle1 in length direction of rectangle1 without limit";
          Real w_offset
          "offset contact point of rectangle1 in width direction of rectangle1 without limit";
          Real offset_bl
          "offset contact point of rectangle1 in length direction of rectangle1 with limit within +/-(L/2) to contact point bl";
          Real offset_bw
          "offset contact point of rectangle1 in width direction of rectangle1 with limit within +/-(W/2) to contact point bw";

          Real f_n_bl "normal force of contact point bl";
          Real f_n_bw "normal force of contact point bw";

          Real f_f_bl_ql
          "friction of contact point bl resolced in length direction rectangle2";
          Real f_f_bl_qw
          "friction of contact point bl resolced in width direction rectangle2";
          Real f_f_bw_ql
          "friction of contact point bw resolced in length direction rectangle2";
          Real f_f_bw_qw
          "friction of contact point bw resolced in width direction rectangle2";

          Boolean contact_bl;
          Boolean contact_bw;

          Real f_normal_bl[3] "normal force of contact point bl";
          Real f_tangential_bl[3] "friction of contact point bl";
          Real f_normal_bw[3] "normal force of contact point bw";
          Real f_tangential_bw[3] "friction of contact point bw";

          Real t_z "used in contact detection";

      public
          Modelica.Mechanics.MultiBody.Forces.Force force_r1(resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a,
              animation=false) "supporting force resolved in frame-a"
            annotation (Placement(transformation(
                extent={{-7,-7},{7,7}},
                rotation=0,
                origin={19,-1})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a1
          "contact point rectangle2 BCS4"
            annotation (Placement(transformation(
                extent={{-12,-12},{12,12}},
                rotation=90,
                origin={-20,102})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a2
          "contact point rectangle1 BCS3"
            annotation (Placement(transformation(
                extent={{-12,-12},{12,12}},
                rotation=90,
                origin={60,102})));
          Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP_l(resolveInFrame=
                Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "relative position offset_x move point box resolved in frame center of planar surface"
            annotation (Placement(transformation(
                extent={{-6,-6},{6,6}},
                rotation=0,
                origin={34,-60})));
          Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP_w(resolveInFrame=
                Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "relative position offset_z move point box resolved in frame center of planar surface"
            annotation (Placement(transformation(
                extent={{-6,-6},{6,6}},
                rotation=0,
                origin={74,-80})));
      public
          Modelica.Mechanics.MultiBody.Forces.Force force_r2(
                                                            resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a,
              animation=false) "supporting force resolved in frame-a"
            annotation (Placement(transformation(
                extent={{-7,-7},{7,7}},
                rotation=0,
                origin={-13,-21})));
          Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP(resolveInFrame=
                Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "Relative position move point square box resolved in frame center of square planar (R 1-2-3-4 & L 1-2-3-4)"
            annotation (Placement(transformation(
                extent={{-6,-6},{6,6}},
                rotation=0,
                origin={-50,80})));
          Modelica.Mechanics.MultiBody.Parts.PointMass offset2_cp1(
            m=0,
            animation=Animation,
            sphereColor=Color_contact_point_rectangle1,
            sphereDiameter=2*radiusContactPoint)
            annotation (Placement(transformation(extent={{90,-28},{104,-14}})));
          Modelica.Mechanics.MultiBody.Parts.PointMass offset1_cp1(
            m=0,
            animation=Animation,
            sphereColor=Color_contact_point_rectangle1,
            sphereDiameter=2*radiusContactPoint)
            annotation (Placement(transformation(extent={{52,-8},{66,6}})));
          Modelica.Mechanics.MultiBody.Parts.PointMass contact_point_rectangle2(
            m=0,
            animation=Animation,
            sphereColor=Color_contact_point_rectangle2,
            sphereDiameter=2*radiusContactPoint)
            annotation (Placement(transformation(extent={{-8,54},{6,68}})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a3
          "frame center of rectangle2"
            annotation (Placement(transformation(extent={{-118,-96},{-86,-64}})));
          Modelica.Blocks.Interfaces.RealInput angle annotation (Placement(
                transformation(
                extent={{-11,-11},{11,11}},
                rotation=180,
                origin={111,21})));

          IdealizedContact.Components.Utilities.variablePrism2  variablePrism_l
                                                  annotation (Placement(transformation(
                extent={{-8,-8},{8,8}},
                rotation=270,
                origin={40,52})));
          IdealizedContact.Components.Utilities.variablePrism2  variablePrism_w
                                                  annotation (Placement(transformation(
                extent={{-8,-8},{8,8}},
                rotation=270,
                origin={80,52})));
          Modelica.Mechanics.Translational.Sources.Position pos_w(useSupport=true,
              f_crit=f,
            exact=exact)
                        annotation (Placement(transformation(
                extent={{-7,-7},{7,7}},
                rotation=270,
                origin={95,51})));
          Modelica.Mechanics.Translational.Sources.Position pos_l(useSupport=true,
              f_crit=f,
            exact=exact)
                        annotation (Placement(transformation(
                extent={{-7,-7},{7,7}},
                rotation=270,
                origin={55,53})));
          Modelica.Blocks.Routing.DeMultiplex4 deMultiplex3_1(
            n1=3,
            n2=3,
            n3=3,
            n4=3) annotation (Placement(transformation(extent={{-92,34},{-80,46}})));
          Modelica.Blocks.Routing.DeMultiplex4 deMultiplex3_2(
            n1=3,
            n2=3,
            n3=3,
            n4=3) annotation (Placement(transformation(extent={{-94,-46},{-82,-34}})));
        equation
           L_direction_1=deMultiplex3_1.y1;
           W_direction_1=deMultiplex3_1.y2;
           H_direction_1=deMultiplex3_1.y3;
           L_W_H_1=deMultiplex3_1.y4;

           L_direction_2=deMultiplex3_2.y1;
           W_direction_2=deMultiplex3_2.y2;
           H_direction_2=deMultiplex3_2.y3;
           L_W_H_2=deMultiplex3_2.y4;

        //----------offset of contact point rectangle1----------------------------------------------------
           phi=angle;

           offset_pl=smooth(2,(abs(rP.r_rel*L_direction_2)-L_W_H_2[1]/2)*(sign(abs(rP.r_rel*L_direction_2)-L_W_H_2[1]/2)+1)/2);
           offset_pw=smooth(2,(abs(rP.r_rel*W_direction_2)-L_W_H_2[2]/2)*(sign(abs(rP.r_rel*W_direction_2)-L_W_H_2[2]/2)+1)/2);

           l_offset=smooth(2,(offset_pl/abs(cos(phi*sign(abs(phi)-pi/2)))+offset_pw/abs(cos((pi/2-phi)*sign(abs(pi/2-phi)-pi/2)))));
           w_offset=smooth(2,(offset_pl/abs(cos((pi/2-phi)*sign(abs(pi/2-phi)-pi/2)))+offset_pw/abs(cos(phi*sign(abs(phi)-pi/2)))));

           offset_bl =smooth(2, if l_offset>=L_W_H_1[1] then L_W_H_1[1] else l_offset);
           offset_bw =smooth(2, if w_offset>=L_W_H_1[2] then L_W_H_1[2] else w_offset);

           pos_l.s_ref=q_l*offset_bl;
           variablePrism_l.n=L_direction_1;

           pos_w.s_ref=q_w*offset_bw;
           variablePrism_w.n=W_direction_1;
        //--------------------------------------------------------------------------------------------------

        //----------contact detection----------------------------------------------------
           t_z = (L_W_H_1[1]+L_W_H_1[2])/20; //?
           contact_bl = ((rP_l.r_rel*H_direction_2)<=0) and (rP_l.r_rel*H_direction_2)>=-t_max and (abs(rP_l.r_rel*L_direction_2)<=L_W_H_2[1]/2+t_z) and (abs(rP_l.r_rel*W_direction_2)<=L_W_H_2[2]/2+t_z)
          "contact move point in L direction of square b based on square q";
           contact_bw = ((rP_w.r_rel*H_direction_2)<=0) and (rP_w.r_rel*H_direction_2)>=-t_max and (abs(rP_w.r_rel*L_direction_2)<=L_W_H_2[1]/2+t_z) and (abs(rP_w.r_rel*W_direction_2)<=L_W_H_2[2]/2+t_z)
          "contact move point in W direction of square b based on square q";
           contact=contact_bl or contact_bw;
        //-----------------------------------------------------------------------------------

           if (contact_bl) then
            //--------------------------------------------------------------
            //normal force
            //--------------------------------------------------------------
            f_n_bl = sign(rP_l.r_rel*H_direction_2)*(c*abs(rP_l.r_rel*H_direction_2)^n1)+ d*abs(rP_l.r_rel*H_direction_2)^n2*der(rP_l.r_rel*H_direction_2);
            f_normal_bl = -f_n_bl*H_direction_2;

            //--------------------------------------------------------------
            //friction
            //--------------------------------------------------------------
            //mue=gamma1*(tanh(gamma2*v_rel)-tanh(gamma3*v_rel))+gamma4*tanh(gamma5*v_rel)+gamma6*v_rel
             f_f_bl_ql = (gamma1*(tanh(gamma2*der(rP_l.r_rel*L_direction_2))-tanh(gamma3*der(rP_l.r_rel*L_direction_2)))+gamma4*tanh(gamma5*der(rP_l.r_rel*L_direction_2))+gamma6*der(rP_l.r_rel*L_direction_2))*(f_n_bl);
             f_f_bl_qw = (gamma1*(tanh(gamma2*der(rP_l.r_rel*W_direction_2))-tanh(gamma3*der(rP_l.r_rel*W_direction_2)))+gamma4*tanh(gamma5*der(rP_l.r_rel*W_direction_2))+gamma6*der(rP_l.r_rel*W_direction_2))*(f_n_bl);
             f_tangential_bl = f_f_bl_ql*L_direction_2 + f_f_bl_qw*W_direction_2;
           else
             f_n_bl = 0;
             f_normal_bl = zeros(3);
             f_f_bl_ql = 0;
             f_f_bl_qw = 0;
             f_tangential_bl = zeros(3);
           end if;

           if (contact_bw) then
            //--------------------------------------------------------------
            //normal force
            //--------------------------------------------------------------
             f_n_bw = sign(rP_w.r_rel*H_direction_2)*(c*abs(rP_w.r_rel*H_direction_2)^n1)+ d*abs(rP_w.r_rel*H_direction_2)^n2*der(rP_w.r_rel*H_direction_2);
             f_normal_bw = -f_n_bw*H_direction_2;

            //--------------------------------------------------------------
            //friction
            //--------------------------------------------------------------
            //mue=gamma1*(tanh(gamma2*v_rel)-tanh(gamma3*v_rel))+gamma4*tanh(gamma5*v_rel)+gamma6*v_rel
             f_f_bw_ql = (gamma1*(tanh(gamma2*der(rP_w.r_rel*L_direction_2))-tanh(gamma3*der(rP_w.r_rel*L_direction_2)))+gamma4*tanh(gamma5*der(rP_w.r_rel*L_direction_2))+gamma6*der(rP_w.r_rel*L_direction_2))*(f_n_bw);
             f_f_bw_qw = (gamma1*(tanh(gamma2*der(rP_w.r_rel*W_direction_2))-tanh(gamma3*der(rP_w.r_rel*W_direction_2)))+gamma4*tanh(gamma5*der(rP_w.r_rel*W_direction_2))+gamma6*der(rP_w.r_rel*W_direction_2))*(f_n_bw);
             f_tangential_bw = f_f_bw_ql*L_direction_2 + f_f_bw_qw*W_direction_2;
           else
             f_n_bw = 0;
             f_normal_bw = zeros(3);
             f_f_bw_ql = 0;
             f_f_bw_qw = 0;
             f_tangential_bw = zeros(3);
           end if;

           force_r1.force=f_normal_bl+ f_tangential_bl;
           force_r2.force=f_normal_bw+ f_tangential_bw;

          connect(rP.frame_b, frame_a2) annotation (Line(
              points={{-44,80},{60,80},{60,102}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(force_r1.frame_a, frame_a1) annotation (Line(
              points={{12,-1},{-20,-1},{-20,102}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(force_r1.frame_b, rP_l.frame_b) annotation (Line(
              points={{26,-1},{40,-1},{40,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(force_r2.frame_a, frame_a1) annotation (Line(
              points={{-20,-21},{-20,102}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(contact_point_rectangle2.frame_a, frame_a1)
                                                annotation (Line(
              points={{-1,61},{-19.5,61},{-19.5,102},{-20,102}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP.frame_a, frame_a3) annotation (Line(
              points={{-56,80},{-56,-80},{-102,-80}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_w.frame_a, frame_a3) annotation (Line(
              points={{68,-80},{-102,-80}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_l.frame_a, frame_a3) annotation (Line(
              points={{28,-60},{28,-80},{-102,-80}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(offset1_cp1.frame_a, force_r1.frame_b) annotation (Line(
              points={{59,-1},{26,-1}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(force_r2.frame_b, offset2_cp1.frame_a) annotation (Line(
              points={{-6,-21},{97,-21}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variablePrism_l.frame_b, force_r1.frame_b)
                                                            annotation (Line(
              points={{40,44},{40,-1},{26,-1}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variablePrism_w.frame_b, force_r2.frame_b)
                                                            annotation (Line(
              points={{80,44},{80,-21},{-6,-21}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variablePrism_w.frame_b, rP_w.frame_b)
                                                        annotation (Line(
              points={{80,44},{80,-80}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variablePrism_l.support, pos_l.support)
                                                         annotation (Line(
              points={{44.8,55.2},{47.4,55.2},{47.4,53},{48,53}},
              color={0,127,0},
              smooth=Smooth.None));
          connect(pos_l.flange, variablePrism_l.axis)
                                                     annotation (Line(
              points={{55,46},{52,46},{52,45.6},{44.8,45.6}},
              color={0,127,0},
              smooth=Smooth.None));
          connect(variablePrism_w.support, pos_w.support)
                                                         annotation (Line(
              points={{84.8,55.2},{87.4,55.2},{87.4,51},{88,51}},
              color={0,127,0},
              smooth=Smooth.None));
          connect(pos_w.flange, variablePrism_w.axis)
                                                     annotation (Line(
              points={{95,44},{90,44},{90,45.6},{84.8,45.6}},
              color={0,127,0},
              smooth=Smooth.None));
          connect(variablePrism_l.frame_a, frame_a2)
                                                    annotation (Line(
              points={{40,60},{40,80},{60,80},{60,102}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variablePrism_w.frame_a, frame_a2)
                                                    annotation (Line(
              points={{80,60},{80,80},{60,80},{60,102}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(deMultiplex3_1.u, vector_b) annotation (Line(
              points={{-93.2,40},{-108,40}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(deMultiplex3_2.u, vector_q) annotation (Line(
              points={{-95.2,-40},{-100.6,-40},{-100.6,-40},{-108,-40}},
              color={0,0,127},
              smooth=Smooth.None));
          annotation (Diagram(graphics), Icon(graphics));
        end ForceRectangleToRectangle;

        model MovePointCircleToRectangle

          parameter Boolean exact=true;
          parameter Modelica.SIunits.Frequency f=10000000;
          final parameter Modelica.Mechanics.MultiBody.Types.Axis y_direction={0,1,0}
          "cartesian coordinate system in y direction -- direction of gravity";
          final parameter Modelica.Mechanics.MultiBody.Types.Axis x_direction={1,0,0}
          "cartesian coordinate system in x direction";
          final parameter Modelica.Mechanics.MultiBody.Types.Axis z_direction=cross(x_direction, y_direction);
          constant Real pi=Modelica.Constants.pi;
        // BCS1 - body coordinate system resolved in center of circle
        // BCS2 - body coordinate system resolved in center of rectangle

          Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a1
          "center of circle"
            annotation (Placement(transformation(extent={{-16,-16},{16,16}},
                rotation=180,
                origin={-104,60})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a2
          "center of rectangle"
            annotation (Placement(transformation(extent={{-118,-76},{-86,-44}})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b1[4]
          "contact point circle"
            annotation (Placement(transformation(extent={{86,44},{118,76}})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b2[4]
          "contact point rectangle"
            annotation (Placement(transformation(extent={{86,-76},{118,-44}})));
          Modelica.Blocks.Interfaces.RealInput vector_rectangle[12]
          "L/W-direction and L_W_H"
            annotation (Placement(transformation(extent={{-6,-6},{6,6}},
                rotation=0,
                origin={-106,-20})));
          Modelica.Blocks.Interfaces.RealInput vector_circle[12]
          "length_direction and radius and half_length"
            annotation (Placement(transformation(extent={{-6,-6},{6,6}},
                rotation=0,
                origin={-106,20})));

          IdealizedContact.ContactBlock.PlanarContact.Components.SubsystemMovePointCircleToRectangle
                                        subsystem_mp_circle_rectangle1[4](
            q_L={1,-1,-1,1},
            q_W={1,1,-1,-1},
            p_L={1,0,-1,0},
            p_W={0,1,0,-1},
            f={f,f,f,f},
            exact={exact,exact,exact,exact})
            annotation (Placement(transformation(extent={{-40,-28},{0,12}})));

        Real Vertical_Direction_c[3] "vertical direction circle BCS1";
        Real Dw_Direction_c[3] "diameter direction circle BCS1";
        Real Length_Direction_R[3] "length direction rectangle BCS2";
        Real Width_Direction_R[3] "width direction rectangle BCS2";
        Real Height_Direction_R[3] "height direction rectangle BCS2";

        Real Dw_BCS2_otlw[3]
          "orthogonal projektion of Dw_direction circle in BCS2 on L-W plane of BCS2";

          IdealizedContact.Components.VectorCalculations.angleBetweenTwoVectorsBlock
            angleWDw(t=0)
          "angle between Vector_Dw_otlwr and Width direction Rectangle"
            annotation (Placement(transformation(extent={{-20,80},{0,100}})));
          Modelica.Mechanics.MultiBody.Sensors.TansformRelativeVector
            tansformRelativeVector1(frame_r_in=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_b,
              frame_r_out=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "Vektor Transformation from BCS-rectangle to BCS-circle"
            annotation (Placement(transformation(extent={{-6,-6},{6,6}},
                rotation=90,
                origin={-60,6})));
          IdealizedContact.Components.Utilities.variableRevol2  variableRevol_1
            annotation (Placement(transformation(extent={{-52,52},{-36,68}})));
          Modelica.Mechanics.Rotational.Sources.Position angle_1(
            useSupport=true,
            exact=exact,
            f_crit=f) annotation (Placement(transformation(extent={{-56,76},{
                    -42,90}})));
          Modelica.Blocks.Routing.DeMultiplex4 deMultiplex2(
            n1=3,
            n2=3,
            n3=3,
            n4=3) annotation (Placement(transformation(extent={{-94,28},{-82,40}})));
          Modelica.Blocks.Routing.DeMultiplex4 deMultiplex3(
            n1=3,
            n2=3,
            n3=3,
            n4=3) annotation (Placement(transformation(extent={{-94,-12},{-82,0}})));
        equation

          Vertical_Direction_c=deMultiplex2.y1 "default {0,1,0}";
          Dw_Direction_c=deMultiplex2.y2 "default {0,0,1}";
          Length_Direction_R=deMultiplex3.y1 "default {1,0,0}";
          Width_Direction_R=deMultiplex3.y2 "default {0,0,1}";
          Height_Direction_R=deMultiplex3.y3;

        //----------gyration coordinate systen from BCS1 to BCS3-------------------------------------------------------------------

          tansformRelativeVector1.r_in = Dw_Direction_c
          "input for Transformation circle Dw direction from BCS1 to BCS2";

          Dw_BCS2_otlw =
            IdealizedContact.Components.VectorCalculations.orthogonalProjection(
                    tansformRelativeVector1.r_out,
                    Length_Direction_R,
                    Width_Direction_R);

          angleWDw.vector1 = Dw_BCS2_otlw;
          angleWDw.vector2 = Width_Direction_R;

          angle_1.phi_ref=smooth(2,angleWDw.angle*(-sign(Dw_BCS2_otlw*Length_Direction_R))+pi/4);

          variableRevol_1.n=Vertical_Direction_c;
          //--------------------------------------------------------------------------------------------------------------------------

        //----------gyration coordinate system from BCS-Circle to BCS-fix point-----------------------------------------------------

        //--------------------------------------------------------------------------------------------------------------------------

          connect(subsystem_mp_circle_rectangle1[1].frame_a2, frame_a2) annotation (
              Line(
              points={{-20,-28.4},{-20,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(subsystem_mp_circle_rectangle1[2].frame_a2, frame_a2) annotation (
              Line(
              points={{-20,-28.4},{-20,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(frame_a2, subsystem_mp_circle_rectangle1[3].frame_a2) annotation (
              Line(
              points={{-102,-60},{-20,-60},{-20,-28.4}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(subsystem_mp_circle_rectangle1[4].frame_a2, frame_a2) annotation (
              Line(
              points={{-20,-28.4},{-20,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(frame_b2, subsystem_mp_circle_rectangle1.frame_b2) annotation (Line(
              points={{102,-60},{20,-60},{20,-16},{0.4,-16}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));

          connect(tansformRelativeVector1.frame_a, frame_a2) annotation (Line(
              points={{-60,0},{-60,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(tansformRelativeVector1.frame_b, frame_a1) annotation (Line(
              points={{-60,12},{-60,60},{-104,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(subsystem_mp_circle_rectangle1.frame_b1, frame_b1) annotation (Line(
              points={{0.4,0},{20,0},{20,60},{102,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(angle_1.support, variableRevol_1.support) annotation (Line(
              points={{-49,76},{-48.8,76},{-48.8,68}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(angle_1.flange, variableRevol_1.axis) annotation (Line(
              points={{-42,83},{-42,68},{-44,68}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(variableRevol_1.frame_a, frame_a1) annotation (Line(
              points={{-52,60},{-104,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variableRevol_1.frame_b, subsystem_mp_circle_rectangle1[1].frame_a1)
            annotation (Line(
              points={{-36,60},{-20,60},{-20,12.4}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variableRevol_1.frame_b, subsystem_mp_circle_rectangle1[2].frame_a1)
            annotation (Line(
              points={{-36,60},{-20,60},{-20,12.4}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variableRevol_1.frame_b, subsystem_mp_circle_rectangle1[3].frame_a1)
            annotation (Line(
              points={{-36,60},{-20,60},{-20,12.4}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variableRevol_1.frame_b, subsystem_mp_circle_rectangle1[4].frame_a1)
            annotation (Line(
              points={{-36,60},{-20,60},{-20,12.4}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(deMultiplex3.u, vector_rectangle) annotation (Line(
              points={{-95.2,-6},{-98,-6},{-98,-20},{-106,-20}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(deMultiplex2.u, vector_circle) annotation (Line(
              points={{-95.2,34},{-98,34},{-98,20},{-106,20}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(vector_circle, subsystem_mp_circle_rectangle1[1].vector_circle)
            annotation (Line(
              points={{-106,20},{-74,20},{-74,-12},{-41.2,-12}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(vector_circle, subsystem_mp_circle_rectangle1[2].vector_circle)
            annotation (Line(
              points={{-106,20},{-74,20},{-74,-12},{-41.2,-12}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(vector_circle, subsystem_mp_circle_rectangle1[3].vector_circle)
            annotation (Line(
              points={{-106,20},{-74,20},{-74,-12},{-41.2,-12}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(vector_circle, subsystem_mp_circle_rectangle1[4].vector_circle)
            annotation (Line(
              points={{-106,20},{-74,20},{-74,-12},{-41.2,-12}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(vector_rectangle, subsystem_mp_circle_rectangle1[1].vector_rectangle)
            annotation (Line(
              points={{-106,-20},{-41.2,-20}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(vector_rectangle, subsystem_mp_circle_rectangle1[2].vector_rectangle)
            annotation (Line(
              points={{-106,-20},{-41.2,-20}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(vector_rectangle, subsystem_mp_circle_rectangle1[3].vector_rectangle)
            annotation (Line(
              points={{-106,-20},{-41.2,-20}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(vector_rectangle, subsystem_mp_circle_rectangle1[4].vector_rectangle)
            annotation (Line(
              points={{-106,-20},{-41.2,-20}},
              color={0,0,127},
              smooth=Smooth.None));
          annotation (Diagram(graphics));
        end MovePointCircleToRectangle;

        model ForceCircleToRectangle

          import SI = Modelica.SIunits;
          parameter Boolean exact=true;
          parameter SI.Frequency f=10000000;
          parameter SI.TranslationalSpringConstant c=10000;
          parameter SI.TranslationalDampingConstant d=10000;
          parameter Real n1 = 1.5;
          parameter Real n2 = n1;

          parameter Real gamma1=1;
          parameter Real gamma2=1;
          parameter Real gamma3=1;
          parameter Real gamma4=1;
          parameter Real gamma5=1;
          parameter Real gamma6=1;
          parameter SI.Distance t_max=0.0001 "Maximale Eindringtiefe";
          parameter Real q_l=1;
          parameter Real q_w=1;
          //parameter Real t_z=0.0001 "in contact detection included";
          //parameter Real t_o=0 "in offset move point included";
          constant Real pi=Modelica.Constants.pi;
          final parameter Modelica.Mechanics.MultiBody.Types.Axis y_direction={0,1,0}
          "cartesian coordinate system in y direction -- default gravity direction";
          final parameter Modelica.Mechanics.MultiBody.Types.Axis x_direction={1,0,0}
          "cartesian coordinate system in x direction";
          final parameter Modelica.Mechanics.MultiBody.Types.Axis z_direction=cross(x_direction, y_direction);

          parameter Boolean Animation=true;
          parameter Modelica.SIunits.Radius radiusContactPoint=0.005;
          parameter Modelica.Mechanics.MultiBody.Types.Color
            Color_contact_point_rectangle =                                                {0,180,0};
          parameter Modelica.Mechanics.MultiBody.Types.Color
            Color_contact_point_circle =                                                {255,0,255};
        // BCS1 - body coordinate system resolved in center of circle
        // BCS2 - body coordinate system resolved in center of rectangle
        // angle_VH - angle between Vertical direction circle and Height direction rectangle resolved in BCS2

          Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a1
          "move point rectangle"
            annotation (Placement(transformation(extent={{-12,-12},{12,12}},
                rotation=180,
                origin={102,60})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a3
          "center of circle "
            annotation (Placement(transformation(extent={{-12,-12},{12,12}},
                rotation=180,
                origin={-76,60})));
          Modelica.Blocks.Interfaces.RealInput vector_circle[12]
          "length_direction and radius and half_length"
            annotation (Placement(transformation(extent={{-6,-6},{6,6}},
                rotation=0,
                origin={-106,20})));
          Modelica.Blocks.Interfaces.RealInput vector_rectangle[12]
          "L/W-direction and L_W_H"
            annotation (Placement(transformation(extent={{-6,-6},{6,6}},
                rotation=0,
                origin={-106,-20})));
            Modelica.Blocks.Interfaces.BooleanOutput contact
            annotation (Placement(transformation(extent={{96,-12},{116,8}})));
      public
          Modelica.Mechanics.MultiBody.Forces.Force force_cr(resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a,
              animation=false) "supporting force resolved in frame-a circle"
            annotation (Placement(transformation(
                extent={{-8,-8},{8,8}},
                rotation=0,
                origin={-46,60})));
          Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP_cr(resolveInFrame=
                Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "Relative position move point rectangle resolved in frame center of circle"
            annotation (Placement(transformation(
                extent={{-6,-6},{6,6}},
                rotation=0,
                origin={-46,80})));

          Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a2
          "contact point circle"
            annotation (Placement(transformation(extent={{-12,-12},{12,12}},
                rotation=180,
                origin={102,-60})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a4
          "center of rectangle"
            annotation (Placement(transformation(extent={{-12,-12},{12,12}},
                rotation=180,
                origin={-102,-60})));
      public
          Modelica.Mechanics.MultiBody.Forces.Force force_rc1(
                                                             resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a,
              animation=false) "supporting force resolved in frame-a rectangle"
            annotation (Placement(transformation(
                extent={{-8,-8},{8,8}},
                rotation=0,
                origin={-30,-24})));
          Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP(resolveInFrame=
                Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "Relative position move point circle resolved in frame center of rectangle"
            annotation (Placement(transformation(
                extent={{-6,-6},{6,6}},
                rotation=0,
                origin={4,-92})));
      public
          Modelica.Mechanics.MultiBody.Forces.Force force_rc2(
                                                             resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a,
              animation=false) "supporting force resolved in frame-a rectangle"
            annotation (Placement(transformation(
                extent={{-8,-8},{8,8}},
                rotation=0,
                origin={-32,-60})));
          Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP_l(resolveInFrame=
                Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "relative position offset_x move point box resolved in frame center of planar surface"
            annotation (Placement(transformation(
                extent={{-6,-6},{6,6}},
                rotation=0,
                origin={-28,6})));
          Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP_w(resolveInFrame=
                Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "relative position offset_z move point box resolved in frame center of planar surface"
            annotation (Placement(transformation(
                extent={{-6,-6},{6,6}},
                rotation=0,
                origin={-32,-80})));
          Modelica.Mechanics.MultiBody.Parts.PointMass fixpoint2(
            m=0,
            animation=Animation,
            sphereColor=Color_contact_point_circle,
            sphereDiameter=2*radiusContactPoint) "fix point circle"
            annotation (Placement(transformation(extent={{-8,-56},{6,-42}})));
          Modelica.Mechanics.MultiBody.Parts.PointMass fixpoint1(
            m=0,
            animation=Animation,
            sphereColor=Color_contact_point_circle,
            sphereDiameter=2*radiusContactPoint) "fix point circle"
            annotation (Placement(transformation(extent={{10,-8},{24,6}})));
          Modelica.Mechanics.MultiBody.Parts.PointMass movepointRechtangle(
            m=0,
            animation=Animation,
            sphereColor=Color_contact_point_rectangle,
            sphereDiameter=2*radiusContactPoint) "move point rectangle"
            annotation (Placement(transformation(extent={{66,74},{82,90}})));
          Real L_direction_R[3] "length direction rectangle BCS2";
          Real W_direction_R[3] "width direction rectangle BCS2";
          Real H_direction_R[3] "height direction rectangle BCS2";
          Real L_W_H_R[3] "length,width,height of rectangle";
          Real V_direction_C[3] "vertical direction circle BCS1";
          Real Dl_direction_C[3] "diameter length direction circle BCS1";
          Real Dw_direction_C[3] "diameter width direction circle BCS1";
          Real R "radius of circle";

          Real f_n_cr;
          Real f_f_l_cr;
          Real f_f_w_cr;
          Boolean contact_cr;
          Real f_normal_cr[3];
          Real f_tangential_cr[3];

          Real offset_pl;
          Real offset_pw;
          Real offset;
          Real offset_bl;
          Real offset_bw;
          Real psi;
          Real t_z;

          Boolean contact_bl;
          Boolean contact_bw;

          Real f_n_bl;
          Real f_n_bw;
          Real f_f_bl_ql;
          Real f_f_bl_qw;
          Real f_f_bw_ql;
          Real f_f_bw_qw;

          Real f_normal_bl[3];
          Real f_tangential_bl[3];
          Real f_normal_bw[3];
          Real f_tangential_bw[3];

          Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP1(
                                                                   resolveInFrame=
                Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "Relative position move point circle resolved in frame center of rectangle"
            annotation (Placement(transformation(
                extent={{-6,-6},{6,6}},
                rotation=90,
                origin={-64,6})));
          IdealizedContact.Components.Utilities.variablePrism2  variablePrism_L
                                                    annotation (Placement(
                transformation(
                extent={{-8,-8},{8,8}},
                rotation=180,
                origin={48,-20})));
          Modelica.Mechanics.Translational.Sources.Position pos_L(useSupport=true,
              f_crit=f,
            exact=exact)
                        annotation (Placement(transformation(
                extent={{-7,-7},{7,7}},
                rotation=180,
                origin={47,-37})));
          IdealizedContact.Components.Utilities.variablePrism2  variablePrism_W
                                                    annotation (Placement(
                transformation(
                extent={{-8,-8},{8,8}},
                rotation=180,
                origin={48,-60})));
          Modelica.Mechanics.Translational.Sources.Position pos_W(
            useSupport=true,
            f_crit=f,
            exact=exact)
                        annotation (Placement(transformation(
                extent={{-7,-7},{7,7}},
                rotation=180,
                origin={49,-75})));
          Modelica.Blocks.Routing.DeMultiplex4 deMultiplex2(
            n1=3,
            n2=3,
            n3=3,
            n4=3) annotation (Placement(transformation(extent={{-92,14},{-80,26}})));
          Modelica.Blocks.Routing.DeMultiplex4 deMultiplex3(
            n1=3,
            n2=3,
            n3=3,
            n4=3) annotation (Placement(transformation(extent={{-92,-26},{-80,-14}})));
        equation
           L_direction_R=deMultiplex3.y1;
           W_direction_R=deMultiplex3.y2;
           H_direction_R=deMultiplex3.y3;
           L_W_H_R=deMultiplex3.y4;

           V_direction_C=deMultiplex2.y1;
           Dw_direction_C=deMultiplex2.y2;
           Dl_direction_C=deMultiplex2.y3;
           R=deMultiplex2.y4[1];

           psi=sqrt(2);

        //--------------------------------------------------------------
        //offset fix point circle
        //--------------------------------------------------------------

           offset_pl=smooth(2,(abs(rP.r_rel*L_direction_R)-L_W_H_R[1]/2)*(sign(abs(rP.r_rel*L_direction_R)-L_W_H_R[1]/2)+1)/2);
           offset_pw=smooth(2,(abs(rP.r_rel*W_direction_R)-L_W_H_R[2]/2)*(sign(abs(rP.r_rel*W_direction_R)-L_W_H_R[2]/2)+1)/2);

           offset=smooth(2,(offset_pl*psi+offset_pw*psi));

           offset_bl = smooth(2,if offset>R*psi then R*psi else offset);
           offset_bw = smooth(2,if offset>R*psi then R*psi else offset);

           pos_L.s_ref=q_l*offset_bl;

           variablePrism_L.n=Dl_direction_C;

           pos_W.s_ref=q_w*offset_bw;

           variablePrism_W.n=Dw_direction_C;

        //--------------------------------------------------------------
        //contact detection
        //--------------------------------------------------------------
           t_z=R/100;
           contact_cr = (abs(rP_cr.r_rel*V_direction_C)>=0) and abs(rP_cr.r_rel*V_direction_C)<=t_max and (sqrt((rP_cr.r_rel*Dl_direction_C)^2+(rP_cr.r_rel*Dw_direction_C)^2)<=R);

           contact_bl = ((rP_l.r_rel*H_direction_R)<=0) and (rP_l.r_rel*H_direction_R)>=-t_max and (abs(rP_l.r_rel*L_direction_R)<=L_W_H_R[1]/2+t_z) and (abs(rP_l.r_rel*W_direction_R)<=L_W_H_R[2]/2+t_z) "and (abs(angle_VH-pi/2)>0.001) 
    contact move point in L direction of square b based on square q";

           contact_bw = ((rP_w.r_rel*H_direction_R)<=0) and (rP_w.r_rel*H_direction_R)>=-t_max and (abs(rP_w.r_rel*L_direction_R)<=L_W_H_R[1]/2+t_z) and (abs(rP_w.r_rel*W_direction_R)<=L_W_H_R[2]/2+t_z) "and (abs(angle_VH-pi/2)>0.001) 
    contact move point in W direction of square b based on square q";
           contact=contact_cr or contact_bl or contact_bw;
        //--------------------------------------------------------------
        //normal force
        //--------------------------------------------------------------

           f_n_cr = sign(rP_cr.r_rel*V_direction_C)*(-c*abs(rP_cr.r_rel*V_direction_C)^n1) - d*abs(rP_cr.r_rel*V_direction_C)^n2*der(rP_cr.r_rel*V_direction_C);
           f_n_bl = sign(rP_l.r_rel*H_direction_R)*(-c*abs(rP_l.r_rel*H_direction_R)^n1) - d*abs(rP_l.r_rel*H_direction_R)^n2*der(rP_l.r_rel*H_direction_R);
           f_n_bw = sign(rP_w.r_rel*H_direction_R)*(-c*abs(rP_w.r_rel*H_direction_R)^n1) - d*abs(rP_w.r_rel*H_direction_R)^n2*der(rP_w.r_rel*H_direction_R);   //ich würde hier auch gerne das vorzeichen umdrehen

        //--------------------------------------------------------------
        //friction
        //--------------------------------------------------------------

        //mue=gamma1*(tanh(gamma2*v_rel)-tanh(gamma3*v_rel))+gamma4*tanh(gamma5*v_rel)+gamma6*v_rel
           f_f_w_cr = -(gamma1*(tanh(gamma2*der(rP_cr.r_rel*Dl_direction_C))-tanh(gamma3*der(rP_cr.r_rel*Dl_direction_C)))+gamma4*tanh(gamma5*der(rP_cr.r_rel*Dl_direction_C))+gamma6*der(rP_cr.r_rel*Dl_direction_C))*(f_n_cr);
           f_f_l_cr = -(gamma1*(tanh(gamma2*der(rP_cr.r_rel*Dw_direction_C))-tanh(gamma3*der(rP_cr.r_rel*Dw_direction_C)))+gamma4*tanh(gamma5*der(rP_cr.r_rel*Dw_direction_C))+gamma6*der(rP_cr.r_rel*Dw_direction_C))*(f_n_cr);

        //mue=gamma1*(tanh(gamma2*v_rel)-tanh(gamma3*v_rel))+gamma4*tanh(gamma5*v_rel)+gamma6*v_rel
           f_f_bl_ql = -(gamma1*(tanh(gamma2*der(rP1.r_rel*L_direction_R))-tanh(gamma3*der(rP1.r_rel*L_direction_R)))+gamma4*tanh(gamma5*der(rP1.r_rel*L_direction_R))+gamma6*der(rP1.r_rel*L_direction_R))*(f_n_bl);
           f_f_bl_qw = -(gamma1*(tanh(gamma2*der(rP1.r_rel*W_direction_R))-tanh(gamma3*der(rP1.r_rel*W_direction_R)))+gamma4*tanh(gamma5*der(rP1.r_rel*W_direction_R))+gamma6*der(rP1.r_rel*W_direction_R))*(f_n_bl);
           f_f_bw_ql = -(gamma1*(tanh(gamma2*der(rP1.r_rel*L_direction_R))-tanh(gamma3*der(rP1.r_rel*L_direction_R)))+gamma4*tanh(gamma5*der(rP1.r_rel*L_direction_R))+gamma6*der(rP1.r_rel*L_direction_R))*(f_n_bw);
           f_f_bw_qw = -(gamma1*(tanh(gamma2*der(rP1.r_rel*W_direction_R))-tanh(gamma3*der(rP1.r_rel*W_direction_R)))+gamma4*tanh(gamma5*der(rP1.r_rel*W_direction_R))+gamma6*der(rP1.r_rel*W_direction_R))*(f_n_bw);

        //---------------------------------------------------------------
        //normal force
        //---------------------------------------------------------------

           if (contact_cr) then
             f_normal_cr = f_n_cr*V_direction_C;
             f_tangential_cr = f_f_w_cr*Dl_direction_C + f_f_l_cr*Dw_direction_C;
           else
             f_normal_cr = zeros(3);
             f_tangential_cr = zeros(3);
           end if;

           if (contact_bl) then
             f_normal_bl = f_n_bl*(sign(f_n_bl)+1)/2*H_direction_R;
             f_tangential_bl = f_f_bl_ql*L_direction_R + f_f_bl_qw*W_direction_R;
           else
             f_normal_bl = zeros(3);
             f_tangential_bl = zeros(3);
           end if;

           if (contact_bw) then
             f_normal_bw = f_n_bw*(sign(f_n_bw)+1)/2*H_direction_R;
             f_tangential_bw = f_f_bw_ql*L_direction_R + f_f_bw_qw*W_direction_R;
           else
             f_normal_bw = zeros(3);
             f_tangential_bw = zeros(3);
           end if;

           force_cr.force=f_normal_cr + f_tangential_cr;
           force_rc1.force=f_normal_bl+ f_tangential_bl;
           force_rc2.force=f_normal_bw+ f_tangential_bw;

           //t1=abs(angle_VH-pi/2);
           //t2=sin(phi+0.01);

          connect(force_cr.frame_b, frame_a1) annotation (Line(
              points={{-38,60},{102,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(force_cr.frame_a, frame_a3) annotation (Line(
              points={{-54,60},{-76,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_cr.frame_a, frame_a3) annotation (Line(
              points={{-52,80},{-54,80},{-54,60},{-76,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(force_rc1.frame_a, frame_a4) annotation (Line(
              points={{-38,-24},{-48,-24},{-48,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP.frame_a, frame_a4)     annotation (Line(
              points={{-2,-92},{-64,-92},{-64,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(force_rc2.frame_a, frame_a4) annotation (Line(
              points={{-40,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_l.frame_a, frame_a4) annotation (Line(
              points={{-34,6},{-48,6},{-48,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_w.frame_a, frame_a4) annotation (Line(
              points={{-38,-80},{-48,-80},{-48,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(movepointRechtangle.frame_a, frame_a1)
                                                annotation (Line(
              points={{74,82},{74,60},{102,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP.frame_b, frame_a2) annotation (Line(
              points={{10,-92},{92,-92},{92,-60},{102,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP1.frame_a, frame_a4) annotation (Line(
              points={{-64,0},{-64,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP1.frame_b, frame_a3) annotation (Line(
              points={{-64,12},{-64,60},{-76,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_cr.frame_b, force_cr.frame_b) annotation (Line(
              points={{-40,80},{-38,80},{-38,60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(pos_L.support, variablePrism_L.support) annotation (Line(
              points={{47,-30},{51.2,-30},{51.2,-24.8}},
              color={0,0,0},
              pattern=LinePattern.None,
              smooth=Smooth.None));
          connect(pos_L.flange, variablePrism_L.axis) annotation (Line(
              points={{40,-37},{40,-24.8},{41.6,-24.8}},
              color={0,127,0},
              smooth=Smooth.None));
          connect(rP_l.frame_b, variablePrism_L.frame_b) annotation (Line(
              points={{-22,6},{-3,6},{-3,-20},{40,-20}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variablePrism_L.frame_a, frame_a2) annotation (Line(
              points={{56,-20},{80,-20},{80,-60},{102,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(force_rc1.frame_b, variablePrism_L.frame_b) annotation (Line(
              points={{-22,-24},{-2,-24},{-2,-20},{40,-20}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(fixpoint1.frame_a, variablePrism_L.frame_b) annotation (Line(
              points={{17,-1},{17,-20.5},{40,-20.5},{40,-20}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(pos_W.support, variablePrism_W.support) annotation (Line(
              points={{49,-68},{51.2,-68},{51.2,-64.8}},
              color={0,0,0},
              pattern=LinePattern.None,
              smooth=Smooth.None));
          connect(variablePrism_W.axis, pos_W.flange) annotation (Line(
              points={{41.6,-64.8},{41.6,-70.4},{42,-70.4},{42,-75}},
              color={0,127,0},
              smooth=Smooth.None));
          connect(variablePrism_W.frame_a, frame_a2) annotation (Line(
              points={{56,-60},{102,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(variablePrism_W.frame_b, force_rc2.frame_b) annotation (Line(
              points={{40,-60},{-24,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(rP_w.frame_b, variablePrism_W.frame_b) annotation (Line(
              points={{-26,-80},{-12,-80},{-12,-60},{40,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(fixpoint2.frame_a, variablePrism_W.frame_b) annotation (Line(
              points={{-1,-49},{-0.5,-49},{-0.5,-60},{40,-60}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(deMultiplex2.u, vector_circle) annotation (Line(
              points={{-93.2,20},{-106,20}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(deMultiplex3.u, vector_rectangle) annotation (Line(
              points={{-93.2,-20},{-106,-20}},
              color={0,0,127},
              smooth=Smooth.None));
          annotation (Diagram(graphics));
        end ForceCircleToRectangle;

        model SubsystemMovePointCircleToRectangle

          parameter Boolean exact=true;
          parameter Modelica.SIunits.Frequency f=10000000;
          parameter Real q_L=1;
          parameter Real q_W=1;
          parameter Real p_L=1;
          parameter Real p_W=1;

          final parameter Modelica.Mechanics.MultiBody.Types.Axis y_direction={0,1,0}
          "cartesian coordinate system in y direction -- direction of gravity";
          final parameter Modelica.Mechanics.MultiBody.Types.Axis x_direction={1,0,0}
          "cartesian coordinate system in x direction";
          final parameter Modelica.Mechanics.MultiBody.Types.Axis z_direction={0,0,1};
        // BCS1 - body coordinate system resolved in center of circle
        // BCS2 - body coordinate system resolved in center of rectangle

          Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b1
          "move point circle resolved in BCS1"
            annotation (Placement(transformation(extent={{86,24},{118,56}})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a2
          "center of rectangle"
            annotation (Placement(transformation(extent={{-16,-16},{16,16}},
                rotation=90,
                origin={0,-102})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b2
          "move point rectangle resolved in BCS2"
            annotation (Placement(transformation(extent={{86,-56},{118,-24}})));
          Modelica.Blocks.Interfaces.RealInput vector_circle[12]
          "length_direction and radius and half_length"
            annotation (Placement(transformation(extent={{-6,-6},{6,6}},
                rotation=0,
                origin={-106,-20})));
          Modelica.Blocks.Interfaces.RealInput vector_rectangle[12]
          "L/W-direction and L_W_H"
            annotation (Placement(transformation(extent={{-6,-6},{6,6}},
                rotation=0,
                origin={-106,-60})));

      protected
          Real R "radius circle";
          Real s1;
          //Real r;
          Real V_direction_c[3] "vertical direction circle BCS1";
          Real Dw_direction_c[3] "diameter width direction circle BCS1";
          Real Dl_direction_c[3] "diameter length direction circle BCS1";

          Real L_direction_R[3] "length direction rectangle BCS2";
          Real W_direction_R[3] "width direction rectangle BCS2";
          Real H_direction_R[3] "height direction rectangle BCS2";
          Real L_W_H_R[3] "length, width, height of rectangle";

      public
          IdealizedContact.Components.Utilities.variablePrism1 pris_r
          "offset from center of rectangle to contact point resolved in BCS2"
            annotation (Placement(transformation(extent={{60,-50},{80,-30}})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a1
          "from center of circle BCS1"
            annotation (Placement(transformation(extent={{-16,-16},{16,16}},
                rotation=270,
                origin={0,102})));
      public
          IdealizedContact.Components.Utilities.variablePrism1 pris_c
          "transformation from BCS3 to BCS1 in contact point"
            annotation (Placement(transformation(extent={{60,30},{80,50}})));
          Modelica.Blocks.Routing.DeMultiplex4 deMultiplex2(
            n1=3,
            n2=3,
            n3=3,
            n4=3) annotation (Placement(transformation(extent={{-86,-26},{-74,-14}})));
          Modelica.Blocks.Routing.DeMultiplex4 deMultiplex3(
            n1=3,
            n2=3,
            n3=3,
            n4=3) annotation (Placement(transformation(extent={{-86,-66},{-74,-54}})));
        equation

          //r=0.5*sqrt(2)*R;
          V_direction_c=deMultiplex2.y1;
          Dw_direction_c=deMultiplex2.y2;
          Dl_direction_c=deMultiplex2.y3;
          R=deMultiplex2.y4[1];

          L_direction_R=deMultiplex3.y1;
          W_direction_R=deMultiplex3.y2;
          H_direction_R=deMultiplex3.y3;
          L_W_H_R=deMultiplex3.y4;

        //----------from center of rectangle to contact point rectangle q_L(+1,-1) & q_W(+1,-1)-------------------------------
          s1=0.5*sqrt((L_W_H_R[1])^2+(L_W_H_R[2])^2);
          pris_r.s_ref = s1;//sqrt((0.5*L_W_H_R[1])^2 + (0.5*L_W_H_R[2])^2);
          pris_r.n = 1/s1*(q_L*L_direction_R*L_W_H_R[1] + q_W*W_direction_R*L_W_H_R[2]);//q_L*L_direction_R + q_W*W_direction_R;
        //--------------------------------------------------------------------------------------------------------------------

        //----------from center of circle to contact point circle p_L(0,+1,-1) & p_W(0,+1,-1)---------------------------------
          //pris_lw.s_ref = R;
          //pris_lw.n = p_L*Dw_direction_c + p_W*Dl_direction_c;
          //pris_c.s_ref = sqrt(rP.r_rel[1]^2 + rP.r_rel[2]^2 + rP.r_rel[3]^2);
          //pris_c.n = rP.r_rel;

          pris_c.s_ref = R;
          pris_c.n = q_L*Dl_direction_c + q_W*Dw_direction_c;
        //--------------------------------------------------------------------------------------------------------------------

        //----------fix point circle q_L(+1,-1) & q_W(+1,-1)------------------------------------------------------------------

        //--------------------------------------------------------------------------------------------------------------------
          connect(pris_r.frame_a, frame_a2) annotation (Line(
              points={{60,-40},{0,-40},{0,-102}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(pris_r.frame_b, frame_b2) annotation (Line(
              points={{80,-40},{102,-40}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(pris_c.frame_a, frame_a1) annotation (Line(
              points={{60,40},{0,40},{0,102}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(pris_c.frame_b, frame_b1) annotation (Line(
              points={{80,40},{102,40}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(deMultiplex2.u, vector_circle) annotation (Line(
              points={{-87.2,-20},{-106,-20}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(vector_rectangle, deMultiplex3.u) annotation (Line(
              points={{-106,-60},{-87.2,-60}},
              color={0,0,127},
              smooth=Smooth.None));
          annotation (Diagram(graphics));
        end SubsystemMovePointCircleToRectangle;
       annotation(preferredView="info");
      end Components;

     annotation(preferredView="info");
    end PlanarContact;

    annotation (Icon(graphics={                   Rectangle(
            extent={{-78,24},{12,-70}},
            lineColor={255,128,0},
            fillColor={255,128,0},
            fillPattern=FillPattern.Solid)}),
              preferredView="info",
      Documentation(info="<!DOCTYPE html><html>
<p>This package includes the contact block and its components.</p>
</html>"));
  end ContactBlock;


  package Components "Components and Utilities"
  extends Modelica.Icons.BasesPackage;
    package VectorCalculations "Package provides custom vector calculations"
      extends Modelica.Icons.InternalPackage;

      function angleBetweenTwoVectors
      "Function to calculate the angle between two given vectors"
      input Real vector1[3] "vector1 (should not be zero)";
      input Real vector2[3] "vector2 (should not be zero)";
      output Real angle "angle between vector1 and vector2";
      constant Real pi=Modelica.Constants.pi;
      algorithm
        angle:=smooth(2,if Modelica.Math.Vectors.norm(vector1)>0 then Modelica.Math.acos((vector1*vector2)/(Modelica.Math.Vectors.norm(vector1)*Modelica.Math.Vectors.norm(vector2))) else pi/2);
        //angle:=Modelica.Math.acos((vector1*vector2)/(Modelica.Math.Vectors.norm(vector1)*Modelica.Math.Vectors.norm(vector2)));

        annotation (Documentation(info="<!DOCTYPE html><html>
<p>Function to calculate the angle between two given vectors. Vector1 and vector2 are three-dimensional Euclidean vectors and should not be zero vector.</p>
</html>"));
      end angleBetweenTwoVectors;

      function orthogonalProjection
      input Real vector_in[3]
        "vector, whose orthogonal projection should be calculated";
      input Real vector_u[3] "vector build a plane";
      input Real vector_v[3] "vector build a plane";
      output Real vector_out[3] "orthogonal projection";

      algorithm
       vector_out :=(vector_in*vector_u)*vector_u + (vector_in*vector_v)*vector_v;

        annotation (Documentation(info="<!DOCTYPE html><html>
<p>Function to calculate the orthogonal projection of vector_in on a plane, which is defined by vector_u and vector_v. The inputs vector_u and vector_v can be perpendicular but cannot be parallel.</p>
</html>"));
      end orthogonalProjection;

      function cosineRules
        input Real a "length of side a of a triangle";
        input Real b "length of side b of a triangle";
        input Real beta "angle between side a and side b";
        output Real c "length of side c of a triangle";
        constant Real pi=Modelica.Constants.pi;

      algorithm
        c:=smooth(2, abs(a*abs(cos(beta*sign(beta-pi/2))) - 0.5*sqrt(abs((2*a*abs(cos(beta*sign(beta-pi/2))))^2 - 4*(a^2 - b^2)))));
        //beta*sign(beta-pi/2) avoid singularity at beta=pi/2

        annotation (Documentation(info="<!DOCTYPE html><html>
<p>Using the cosine rules, the length <i><b>c </b></i>of the side of a triangle is calculated. The two sides <i><b>a</b></i> and <i><b>b</b></i> and the angle beta between them are given.</p>
</html>"));
      end cosineRules;

      function intersectionOfTwoLines
      //-----parameter cylinder1-----
        input Real c[3] "starting point of line 1";
        input Real s[3] "length direction of line 1";
      //-----------------------------

      //-----parameter cylinder2-----
        input Real d[3] "starting point of line 2";
        input Real w[3] "length direction of line 2";
      //-----------------------------

        output Real t[2]
        "position of intersection point on line 1 and 2 resolved in starting point";
    protected
                  Real n[3];

      algorithm
        n:=cross(s, w);
        t[1]:=(cross((d - c), w)*n)/(n*n) "intersection line 1";
        t[2]:=(cross((d - c), s)*n)/(n*n) "intersection line 2";
        annotation (Documentation(info="<!DOCTYPE html><html>
<p>Function to locate the intersection points on two lines in space.</p>
</html>"));
      end intersectionOfTwoLines;

      function vectorNormalization
      "Return normalized vector such that length = 1 and prevent zero-division for zero vector"

        input Real v[:] "Vector";
        constant Real eps = 100*Modelica.Constants.eps
        "if |v| < eps then result = v/eps";
        output Real result[size(v, 1)] "Input vector v normalized to length=1";

      algorithm
        result :=smooth(2, if Modelica.Math.Vectors.length(v) >= eps then v/Modelica.Math.Vectors.length(v) else zeros(size(v, 1)));
        annotation (Inline=true, Documentation(info="<!DOCTYPE html><html>
<p>The function returns the <b>unit vector</b> <code>v/length(v)</code> of vector v. If length(v) is close to zero (more precisely, if length(v) &#60; eps), a zero vector is returned to avoid division by zero. The constant eps is set to 100*Modelica.Constants.eps. The function is based on <a href=\"Modelica://Modelica.Math.Vectors.normalize\">Modelica.Math.Vectors.normalize</a>.</p>
<h4>See also</h4>
<p><a href=\"Modelica://Modelica.Math.Vectors.length\">Modelica.Math.Vectors.length</a></p>
</html>"));
      end vectorNormalization;

      function crossProductMatrix
      "Calculates the cross product of two vectors given as a 3x1 matrix"
      //this function calculates the cross product between two vectors that
      //are given in a 3x1-Matrix form and not only an array of 3.
      input Real a[3,1];
      input Real b[3,1];
      output Real c[3,1];
      algorithm
      c[1,1]:=a[2, 1]*b[3, 1] - a[3, 1]*b[2, 1];
      c[2,1]:=-(a[1, 1]*b[3, 1] - a[3, 1]*b[1, 1]);
      c[3,1]:=a[1, 1]*b[2, 1] - a[2, 1]*b[1, 1];

        annotation (Documentation(info="<!DOCTYPE html><html>
<pre><font style=\"color: #006400; \">This&nbsp;function&nbsp;calculates&nbsp;the&nbsp;cross&nbsp;product&nbsp;between&nbsp;two&nbsp;vectors&nbsp;that are&nbsp;given&nbsp;in&nbsp;a&nbsp;3x1-Matrix&nbsp;form&nbsp;and&nbsp;not&nbsp;in an&nbsp;array&nbsp;of&nbsp;3.</font></pre>
</html>"));
      end crossProductMatrix;

      block angleBetweenTwoVectorsBlock

      Modelica.Blocks.Interfaces.RealInput vector1[3]
        "three-dimensional vector"                    annotation (Placement(transformation(extent={{-120,50},
                  {-80,90}})));
      Modelica.Blocks.Interfaces.RealInput vector2[ 3]
        "three-dimensional unit vector"               annotation (Placement(transformation(extent={{-120,
                  -90},{-80,-50}})));
      Modelica.Blocks.Interfaces.RealOutput angle
        "angle between vector1 and vector2"       annotation (Placement(transformation(extent={{80,30},
                  {120,70}})));
      constant Real pi=Modelica.Constants.pi;
      parameter Real t=pi/2 "output in case of a zero-vector";
    protected
      Real norm1;
      Real norm2;
      equation
        norm1=sqrt(vector1[1]^2+vector1[2]^2+vector1[3]^2);
        norm2=sqrt(vector2[1]^2+vector2[2]^2+vector2[3]^2);
       angle=smooth(2, if norm1*norm2>0.0001 then Modelica.Math.acos((vector1*vector2)/(norm1*norm2)) else t);
        //angle=  Modelica.Math.acos((vector1*vector2));

        annotation (Diagram(graphics), Documentation(info="<!DOCTYPE html><html>
<p>Block to calculate the angle between two given vectors. The vector1 and vector2 are three-dimensional Euclidean vector and should not be zero vector.</p>
</html>"));
      end angleBetweenTwoVectorsBlock;

      block cosineRulesBlock
          constant Real pi=Modelica.Constants.pi;

      Modelica.Blocks.Interfaces.RealInput a "length of side a of a triangle"
                                                      annotation (Placement(transformation(extent={{-120,50},
                  {-80,90}})));
      Modelica.Blocks.Interfaces.RealInput b "length of side b of a triangle"
                                                      annotation (Placement(transformation(extent={{-120,
                  -10},{-80,30}})));
      Modelica.Blocks.Interfaces.RealInput beta
        "angle between side a and side b"             annotation (Placement(transformation(extent={{-120,
                  -70},{-80,-30}})));
      Modelica.Blocks.Interfaces.RealOutput c "length of side c of a triangle"
                                                  annotation (Placement(transformation(extent={{80,-10},
                  {120,30}})));
      equation
          c =smooth(2, abs(a*abs(cos(beta*sign(beta-pi/2))) - 0.5*sqrt(abs((2*a*abs(cos(beta*sign(beta-pi/2))))^2 - 4*(a^2 - b^2)))));
          //c =smooth(2, abs(a*abs(cos(beta*sign(beta-pi/2))) - 0.5*sqrt(abs((2*a*abs(cos(beta*sign(beta-pi/2))))^2 - 4*(a^2 - b^2)))));
          //beta*sign(beta-pi/2) singularitätspunkt bei beta=pi/2 vermeiden
        annotation (Diagram(graphics), Documentation(info="<!DOCTYPE html><html>
<p>According to the cosine rules, the length <i><b>c</b> </i>of the side of a triangle is calculated. The two sides <i><b>a</b></i> and <i><b>b</b></i> and the angle beta between them are given.</p>
</html>"));
      end cosineRulesBlock;

      block orthogonalProjectionBlock

      Modelica.Blocks.Interfaces.RealInput vector_in[3]
        "vector, whose orthogonal projection should be calculated"
                                                      annotation (Placement(transformation(extent={{-120,50},
                  {-80,90}})));
      Modelica.Blocks.Interfaces.RealInput u[3]
        "vector build a plane(should not be zero-vector)"
                                                      annotation (Placement(transformation(extent={{-120,
                  -10},{-80,30}})));
      Modelica.Blocks.Interfaces.RealInput v[3]
        "vector build a plane (should not be zero-vector)"
                                                      annotation (Placement(transformation(extent={{-120,
                  -70},{-80,-30}})));
      Modelica.Blocks.Interfaces.RealOutput vector_out[3]
        "orthogonal projection"                   annotation (Placement(transformation(extent={{80,-10},
                  {120,30}})));
      equation
        vector_out = (vector_in*u)*u + (vector_in*v)*v;
        annotation (Diagram(graphics), Documentation(info="<!DOCTYPE html><html>
<p>Block to calculate the orthogonal projection of vector_in on a plane, which is defined by vector_u and vector_v. The inputs vector_u and vector_v can be perpendicular but cannot be parallel.</p>
</html>"));
      end orthogonalProjectionBlock;

      block intersectionOfTwoLinesBlock
        parameter Real eps = 1000*Modelica.Constants.eps;
        parameter Real inf = Modelica.Constants.inf;
        parameter Modelica.SIunits.Frequency f=100000;
      Modelica.Blocks.Interfaces.RealInput c[3] "start point line 1"
                                                      annotation (Placement(transformation(extent={{-120,70},
                  {-80,110}})));
      Modelica.Blocks.Interfaces.RealInput s[3] "direction line 1"
                                                      annotation (Placement(transformation(extent={{-120,10},
                  {-80,50}})));
      Modelica.Blocks.Interfaces.RealInput d[3] "start point line 2"
                                                 annotation (Placement(transformation(extent={{-120,
                  -50},{-80,-10}})));
      Modelica.Blocks.Interfaces.RealInput w[3] "direction line 2"
                                                 annotation (Placement(transformation(extent={{-120,
                  -110},{-80,-70}})));
        Modelica.Blocks.Interfaces.RealOutput t[2]
        "intesection points on line 1 and 2 resolved in start point"
          annotation (Placement(transformation(extent={{100,-10},{120,10}})));
    protected
        Real n[3];

        LimiterBlock limiterBlock[2](f={f,f})
          annotation (Placement(transformation(extent={{54,-10},{74,10}})));
      equation

        n = cross(s, w);

      //   if Modelica.Math.Vectors.norm(n) >eps then
      //   limiter[1].u = smooth(2, if sqrt(n[1]^2+n[2]^2+n[3]^2) > eps then (cross((d - c), w)*n)/(n*n) else 0.5)
      //     "intersection cylinder1";
      //   limiter[2].u = smooth(2, if sqrt(n[1]^2+n[2]^2+n[3]^2) > eps then (cross((d - c), s)*n)/(n*n) else 0.5)
      //     "intersection cylinder2";
      //   else
      //     limiter[1].u = 0;
      //     limiter[2].u = 0;
      //   end if;

      //   t[1] = smooth(2,limiter[1].y);
      //   t[2] = smooth(2,limiter[2].y);
      //   else
      //     n:=zeros(3);
      //     t[1]:=-5;
      //     t[2]:=-5;
      //   end if;

      if n*n >0 then
       limiterBlock[1].u = (cross((d - c), w)*n)/(n*n);
       limiterBlock[2].u = (cross((d - c), s)*n)/(n*n);
      else
       limiterBlock[1].u = 0.5;
       limiterBlock[2].u = 0.5;
      end if;

        connect(limiterBlock.y, t) annotation (Line(
            points={{75,0},{110,0}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (Diagram(graphics), Documentation(info="<!DOCTYPE html><html>
<p>Block to locate the intersection points on two lines in space with limiter.</p>
</html>"));
      end intersectionOfTwoLinesBlock;

      block LimiterBlockReferenceIn
      "Limit the range of a signal with bessel filter and input signal as reference"
         extends Modelica.Blocks.Interfaces.SISO;
         parameter Modelica.SIunits.Frequency f=100000;

        Modelica.Blocks.Continuous.Filter filter(
          filterType=Modelica.Blocks.Types.FilterType.LowPass,
          analogFilter=Modelica.Blocks.Types.AnalogFilter.Bessel,
          f_cut=f)
          annotation (Placement(transformation(extent={{74,-10},{94,10}})));
        Modelica.Blocks.Interfaces.RealInput uMax
          annotation (Placement(transformation(extent={{-120,40},{-80,80}})));
        Modelica.Blocks.Interfaces.RealInput uMin
          annotation (Placement(transformation(extent={{-120,-80},{-80,-40}})));
      equation

          filter.u = smooth(0, if u> uMax then uMax elseif u<uMin then uMin else u);

        connect(filter.y, y) annotation (Line(
            points={{95,0},{110,0}},
            color={0,0,127},
            smooth=Smooth.None));
         annotation (
          Documentation(info="<!DOCTYPE html><html>
<p>The Limiter block passes its input signal as output signal as long as the input is within the specified upper and lower limits. If this is not the case, the corresponding limit is passed as output. Furthermore, the output of the variable limiter is filtered with the help of a bessel filter (low pass).</p>
</html>"),Icon(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}},
          grid={2,2}), graphics={
          Line(points={{0,-90},{0,68}}, color={192,192,192}),
          Polygon(
            points={{0,90},{-8,68},{8,68},{0,90}},
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
          Line(points={{-90,0},{68,0}}, color={192,192,192}),
          Polygon(
            points={{90,0},{68,-8},{68,8},{90,0}},
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
          Line(points={{-80,-70},{-50,-70},{50,70},{80,70}}, color={0,0,0}),
          Text(
            extent={{-150,-150},{150,-110}},
            lineColor={0,0,0},
            textString="uMax=%uMax"),
          Text(
            extent={{-150,150},{150,110}},
            textString="%name",
            lineColor={0,0,255})}),
          Diagram(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}},
          grid={2,2}), graphics={
          Line(points={{0,-60},{0,50}}, color={192,192,192}),
          Polygon(
            points={{0,60},{-5,50},{5,50},{0,60}},
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
          Line(points={{-60,0},{50,0}}, color={192,192,192}),
          Polygon(
            points={{60,0},{50,-5},{50,5},{60,0}},
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
          Line(points={{-50,-40},{-30,-40},{30,40},{50,40}}, color={0,0,0}),
          Text(
            extent={{46,-6},{68,-18}},
            lineColor={128,128,128},
            textString="u"),
          Text(
            extent={{-30,70},{-5,50}},
            lineColor={128,128,128},
            textString="y"),
          Text(
            extent={{-58,-54},{-28,-42}},
            lineColor={128,128,128},
            textString="uMin"),
          Text(
            extent={{26,40},{66,56}},
            lineColor={128,128,128},
            textString="uMax")}));
      end LimiterBlockReferenceIn;

      block LimiterBlock "Limit the range of a signal with bessel filter"
         extends Modelica.Blocks.Interfaces.SISO;
         parameter Real uMax= 1 "Upper limits of input signals";
         parameter Real uMin= Modelica.Constants.eps
        "Lower limits of input signals";
         parameter Modelica.SIunits.Frequency f=100000;

        Modelica.Blocks.Continuous.Filter filter(
          filterType=Modelica.Blocks.Types.FilterType.LowPass,
          analogFilter=Modelica.Blocks.Types.AnalogFilter.Bessel,
          f_cut=f)
          annotation (Placement(transformation(extent={{74,-10},{94,10}})));
      equation

          filter.u = smooth(0, if u> uMax then uMax elseif u<uMin then uMin else u);

        connect(filter.y, y) annotation (Line(
            points={{95,0},{110,0}},
            color={0,0,127},
            smooth=Smooth.None));
         annotation (
          Documentation(info="<!DOCTYPE html><html>
<p>The Limiter block passes its input signal as output signal as long as the input is within the specified upper and lower limits. If this is not the case, the corresponding limits are passed as output. Furthermore, the output of the variable limiter is filtered with the help of a bessel filter (low pass).</p>
</html>"),Icon(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}},
          grid={2,2}), graphics={
          Line(points={{0,-90},{0,68}}, color={192,192,192}),
          Polygon(
            points={{0,90},{-8,68},{8,68},{0,90}},
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
          Line(points={{-90,0},{68,0}}, color={192,192,192}),
          Polygon(
            points={{90,0},{68,-8},{68,8},{90,0}},
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
          Line(points={{-80,-70},{-50,-70},{50,70},{80,70}}, color={0,0,0}),
          Text(
            extent={{-150,-150},{150,-110}},
            lineColor={0,0,0},
            textString="uMax=%uMax"),
          Text(
            extent={{-150,150},{150,110}},
            textString="%name",
            lineColor={0,0,255})}),
          Diagram(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}},
          grid={2,2}), graphics={
          Line(points={{0,-60},{0,50}}, color={192,192,192}),
          Polygon(
            points={{0,60},{-5,50},{5,50},{0,60}},
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
          Line(points={{-60,0},{50,0}}, color={192,192,192}),
          Polygon(
            points={{60,0},{50,-5},{50,5},{60,0}},
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
          Line(points={{-50,-40},{-30,-40},{30,40},{50,40}}, color={0,0,0}),
          Text(
            extent={{46,-6},{68,-18}},
            lineColor={128,128,128},
            textString="u"),
          Text(
            extent={{-30,70},{-5,50}},
            lineColor={128,128,128},
            textString="y"),
          Text(
            extent={{-58,-54},{-28,-42}},
            lineColor={128,128,128},
            textString="uMin"),
          Text(
            extent={{26,40},{66,56}},
            lineColor={128,128,128},
            textString="uMax")}));
      end LimiterBlock;

      model RelativeVelocities
      "This model calculates the relative velocity between the anticipated contact points (v2-v1), resolved in frame 1"

        Modelica.Blocks.Interfaces.RealOutput vrel[3]
          annotation (Placement(transformation(extent={{-21,-21},{21,21}},
              rotation=0,
              origin={113,-1})));
      //protected
        Real omega_1[3];
        Real omega_2[3];
        Real vu1[3];
        Real vu2[3];
        Real vu2_[3];
        Real vc1[3];
        Real vc2[3];

    public
        Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame1
        "Coordinate system fixed to the center of contact surface 1"
          annotation (Placement(transformation(
              extent={{-16,-16},{16,16}},
              rotation=90,
              origin={-56,100})));
    public
        Modelica.Blocks.Interfaces.RealInput r1[3]
        "position vector from frame_a1 to contact point"   annotation (Placement(
              transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={38,106})));
    public
        Modelica.Blocks.Interfaces.RealInput r2[3]
        "position vector from frame_a2 to contact point"   annotation (Placement(
              transformation(
              extent={{-20,-20},{20,20}},
              rotation=90,
              origin={40,-104})));
        Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame2
        "Coordinate system fixed to the center of contact surface 2"
          annotation (Placement(transformation(
              extent={{-16,-16},{16,16}},
              rotation=90,
              origin={-58,-98})));
        Modelica.Mechanics.MultiBody.Sensors.AbsoluteAngularVelocity
          absoluteAngularVelocity1 annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-78,64})));
        Modelica.Mechanics.MultiBody.Sensors.AbsoluteAngularVelocity
          absoluteAngularVelocity2 annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={-82,-70})));
        Modelica.Mechanics.MultiBody.Sensors.AbsoluteVelocity absoluteVelocity1
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-34,64})));
        Modelica.Mechanics.MultiBody.Sensors.AbsoluteVelocity absoluteVelocity2(resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameA.frame_resolve)
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={-36,-70})));
      equation

        omega_1= absoluteAngularVelocity1.w;
        vc1=absoluteVelocity1.v;
        vu1 = cross(omega_1,r1);

        omega_2= absoluteAngularVelocity2.w;
        vc2=absoluteVelocity2.v;
        vu2_=  cross(omega_2,r2); //vu2 resolved in frame 2
        vu2 = Modelica.Mechanics.MultiBody.Frames.resolveRelative(vu2_,frame2.R,frame1.R);
        vrel= vc2 - vc1 + vu2 - vu1;

        connect(frame1, absoluteAngularVelocity1.frame_a) annotation (Line(
            points={{-56,100},{-56,86},{-78,86},{-78,74}},
            color={95,95,95},
            thickness=0.5,
            smooth=Smooth.None));

        connect(frame2, absoluteAngularVelocity2.frame_a) annotation (Line(
            points={{-58,-98},{-58,-86},{-82,-86},{-82,-80}},
            color={95,95,95},
            thickness=0.5,
            smooth=Smooth.None));
        connect(frame1, absoluteVelocity1.frame_a) annotation (Line(
            points={{-56,100},{-56,86},{-34,86},{-34,74}},
            color={95,95,95},
            thickness=0.5,
            smooth=Smooth.None));
        connect(frame2, absoluteVelocity2.frame_a) annotation (Line(
            points={{-58,-98},{-58,-86},{-36,-86},{-36,-80}},
            color={95,95,95},
            thickness=0.5,
            smooth=Smooth.None));
        connect(absoluteVelocity2.frame_resolve, frame1) annotation (Line(
            points={{-26,-70},{-8,-70},{-8,94},{-54,94},{-54,100},{-56,100}},
            color={95,95,95},
            pattern=LinePattern.Dot,
            smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
                            graphics));
      end RelativeVelocities;

      model RelativeVelocities_
      "This model calculates the relative velocity between the anticipated contact points (v2-v1), resolved in frame 1"

        Modelica.Blocks.Interfaces.RealOutput v_rel[3] annotation (Placement(
              transformation(
              extent={{-21,-21},{21,21}},
              rotation=0,
              origin={113,-1})));
      //protected
        Real omega_1[3];
        Real omega_2[3];
        Real vu1[3];
        Real vu2[3];
        Real vu2_[3];
        Real vc1[3];
        Real vc2[3];

    public
        Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame1
        "Coordinate system fixed to the center of contact surface 1"
          annotation (Placement(transformation(
              extent={{-16,-16},{16,16}},
              rotation=90,
              origin={-56,100})));
        Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame2
        "Coordinate system fixed to the center of contact surface 2"
          annotation (Placement(transformation(
              extent={{-16,-16},{16,16}},
              rotation=90,
              origin={-58,-98})));
        Modelica.Mechanics.MultiBody.Sensors.AbsoluteAngularVelocity
          absoluteAngularVelocity1 annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-78,64})));
        Modelica.Mechanics.MultiBody.Sensors.AbsoluteAngularVelocity
          absoluteAngularVelocity2 annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={-82,-70})));
        Modelica.Mechanics.MultiBody.Sensors.AbsoluteVelocity absoluteVelocity1
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-34,64})));
        Modelica.Mechanics.MultiBody.Sensors.AbsoluteVelocity absoluteVelocity2(resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameA.frame_resolve)
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={-36,-70})));
    public
        Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame1cp
        "Coordinate system fixed to the contact point on contact surface 1"
          annotation (Placement(transformation(
              extent={{-16,-16},{16,16}},
              rotation=90,
              origin={48,98})));
    public
        Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame2cp
        "Coordinate system fixed to the contact point on contact surface 2"
          annotation (Placement(transformation(
              extent={{-16,-16},{16,16}},
              rotation=90,
              origin={46,-98})));
       Modelica.Mechanics.MultiBody.Sensors.RelativePosition r2(resolveInFrame=
              Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
        "relative position offset contact point cylinder resolved in BCS2"
          annotation (Placement(transformation(
              extent={{8,-8},{-8,8}},
              rotation=180,
              origin={8,-86})));
       Modelica.Mechanics.MultiBody.Sensors.RelativePosition r1(resolveInFrame=
              Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
        "relative position offset contact point cylinder resolved in BCS2"
          annotation (Placement(transformation(
              extent={{8,8},{-8,-8}},
              rotation=180,
              origin={14,86})));
      equation

        omega_1= absoluteAngularVelocity1.w;
        vc1=absoluteVelocity1.v;
        vu1 = cross(omega_1,r1.r_rel);

        omega_2= absoluteAngularVelocity2.w;
        vc2=absoluteVelocity2.v;
        vu2_=  cross(omega_2,r2.r_rel); //vu2 resolved in frame 2
        vu2 = Modelica.Mechanics.MultiBody.Frames.resolveRelative(vu2_,frame2.R,frame1.R);
        v_rel= vc2 - vc1 + vu2 - vu1;

        connect(frame1, absoluteAngularVelocity1.frame_a) annotation (Line(
            points={{-56,100},{-56,86},{-78,86},{-78,74}},
            color={95,95,95},
            thickness=0.5,
            smooth=Smooth.None));

        connect(frame2, absoluteAngularVelocity2.frame_a) annotation (Line(
            points={{-58,-98},{-58,-86},{-82,-86},{-82,-80}},
            color={95,95,95},
            thickness=0.5,
            smooth=Smooth.None));
        connect(frame1, absoluteVelocity1.frame_a) annotation (Line(
            points={{-56,100},{-56,86},{-34,86},{-34,74}},
            color={95,95,95},
            thickness=0.5,
            smooth=Smooth.None));
        connect(frame2, absoluteVelocity2.frame_a) annotation (Line(
            points={{-58,-98},{-58,-86},{-36,-86},{-36,-80}},
            color={95,95,95},
            thickness=0.5,
            smooth=Smooth.None));
        connect(absoluteVelocity2.frame_resolve, frame1) annotation (Line(
            points={{-26,-70},{-8,-70},{-8,94},{-54,94},{-54,100},{-56,100}},
            color={95,95,95},
            pattern=LinePattern.Dot,
            smooth=Smooth.None));
        connect(frame2, r2.frame_a) annotation (Line(
            points={{-58,-98},{-58,-86},{1.77636e-015,-86}},
            color={95,95,95},
            thickness=0.5,
            smooth=Smooth.None));
        connect(r2.frame_b, frame2cp) annotation (Line(
            points={{16,-86},{46,-86},{46,-98}},
            color={95,95,95},
            thickness=0.5,
            smooth=Smooth.None));
        connect(r1.frame_a, absoluteVelocity1.frame_a) annotation (Line(
            points={{6,86},{-34,86},{-34,74}},
            color={95,95,95},
            thickness=0.5,
            smooth=Smooth.None));
        connect(r1.frame_b, frame1cp) annotation (Line(
            points={{22,86},{48,86},{48,98}},
            color={95,95,95},
            thickness=0.5,
            smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}),
                            graphics), Icon(coordinateSystem(preserveAspectRatio=false,
                extent={{-100,-100},{100,100}}), graphics={
              Text(
                extent={{-98,78},{-2,64}},
                lineColor={0,0,0},
                textString="Frame1"),
              Text(
                extent={{2,78},{98,62}},
                lineColor={0,0,0},
                textString="Point1"),
              Text(
                extent={{-126,-70},{26,-86}},
                lineColor={0,0,0},
                textString="Frame2"),
              Text(
                extent={{10,-70},{90,-86}},
                lineColor={0,0,0},
                textString="Point2"),
              Rectangle(extent={{-100,100},{100,-100}}, lineColor={0,0,255}),
              Text(
                extent={{-98,20},{90,-30}},
                lineColor={0,0,255},
                textString="%name")}));
      end RelativeVelocities_;
     annotation(preferredView="info");
    end VectorCalculations;

    package Utilities "Utility package"
    extends Modelica.Icons.BasesPackage;

      model variablePrism1
      "Prismatic joint (1 translational degree-of-freedom, 2 potential states, optional axis flange)"

        import SI = Modelica.SIunits;
        extends Modelica.Mechanics.MultiBody.Interfaces.PartialElementaryJoint;
        Real e[3] "Unit vector in direction of prismatic axis n";
        Real eps = 100*Modelica.Constants.eps;

    public
        Modelica.Blocks.Interfaces.RealInput n[3] "direction vector"
                                                  annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=90,
              origin={-70,-100}), iconTransformation(
              extent={{-20,-20},{20,20}},
              rotation=90,
              origin={-66,-60})));
    public
        Modelica.Blocks.Interfaces.RealInput s_ref "relative distance"
                                                  annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=90,
              origin={55,-100}),  iconTransformation(
              extent={{-20,-20},{20,20}},
              rotation=90,
              origin={62,-60})));
      equation
        e= smooth(2,if sqrt(n[1]^2+n[2]^2+n[3]^2) >= eps then n/sqrt(n[1]^2+n[2]^2+n[3]^2) else zeros(3));
        //e= smooth(2,Modelica.Math.Vectors.normalize(n)) "normalize of vector n";
        //e= Contact_library.component.FunctionApplication.vectorNormalize(n) no!!;
        //e= smooth(0,if Modelica.Math.Vectors.length(n) >= eps then n/Modelica.Math.Vectors.length(n) else n/eps) Yes!!;
        //e=n;

        // relationships between kinematic quantities of frame_a and of frame_b
        frame_b.r_0 = frame_a.r_0 + transpose(frame_a.R.T)*(e*s_ref);
        //frame_b.r_0 = frame_a.r_0 + Modelica.Mechanics.MultiBody.Frames.resolve1(frame_a.R, e*s_ref);
        frame_b.R = frame_a.R;

        // Force and torque balance
        zeros(3) = frame_a.f + frame_b.f;
        zeros(3) = frame_a.t + frame_b.t + cross(e*s_ref, frame_b.f);
        annotation (
          Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={
              Rectangle(
                extent={{-100,-50},{-30,41}},
                pattern=LinePattern.None,
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid,
                lineColor={0,0,255}),
              Rectangle(
                extent={{-100,40},{-30,50}},
                pattern=LinePattern.None,
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid,
                lineColor={0,0,255}),
              Rectangle(
                extent={{-30,-30},{100,20}},
                pattern=LinePattern.None,
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid,
                lineColor={0,0,255}),
              Rectangle(
                extent={{-30,20},{100,30}},
                pattern=LinePattern.None,
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid,
                lineColor={0,0,255}),
              Line(points={{-30,-50},{-30,50}}, color={0,0,0}),
              Line(points={{100,-30},{100,21}}, color={0,0,0}),
              Text(
                extent={{60,12},{96,-13}},
                lineColor={128,128,128},
                textString="b"),
              Text(
                extent={{-95,13},{-60,-9}},
                lineColor={128,128,128},
                textString="a"),
              Text(
                visible=useAxisFlange,
                extent={{-150,58},{150,118}},
                textString="%name",
                lineColor={0,0,255}),
              Text(
                extent={{-80,-105},{-53,-77}},
                lineColor={0,0,0},
                textString="n"),
              Rectangle(
                visible=useAxisFlange,
                extent={{84,-24},{94,16}},
                pattern=LinePattern.None,
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid,
                lineColor={0,0,255}),
              Text(
                extent={{17,-101},{107,-80}},
                lineColor={0,0,0},
                textString="s_ref")}),
          Diagram(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics),
          Documentation(info="<!DOCTYPE html><html>
<p>This joint is a modification of the Modelica.Mechanics.MultiBody.Joints.Prismatic joint. The axis of translation can be now be set via the input n. Furthermore, the input s_ref sets the distance between the to frames (compare to useAxisFlange option of the original block).</p>
</html>"));
      end variablePrism1;

      model variableRevol1
      "Revolute joint (1 rotational degree-of-freedom, 2 potential states, optional axis flange)"

        import SI = Modelica.SIunits;

        Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a
        "Coordinate system fixed to the joint with one cut-force and cut-torque"
          annotation (Placement(transformation(extent={{-116,-16},{-84,16}},
                rotation=0)));
        Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b
        "Coordinate system fixed to the joint with one cut-force and cut-torque"
          annotation (Placement(transformation(extent={{84,-16},{116,16}},
                rotation=0)));

    protected
        outer Modelica.Mechanics.MultiBody.World world;
        SI.AngularVelocity w(start=0);
        Real e[3]
        "Unit vector in direction of rotation axis, resolved in frame_a (= same as in frame_b)";
        Modelica.Mechanics.MultiBody.Frames.Orientation R_rel
        "Relative orientation object from frame_a to frame_b or from frame_b to frame_a";

    public
        Modelica.Blocks.Interfaces.RealInput n[3] "axis of rotation"
                                                  annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=90,
              origin={-70,-100}), iconTransformation(
              extent={{-20,-20},{20,20}},
              rotation=90,
              origin={-67,-80})));
    public
        Modelica.Blocks.Interfaces.RealInput phi_ref "rotation angle"
                                                      annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=90,
              origin={57,-100}),  iconTransformation(
              extent={{-20,-20},{20,20}},
              rotation=90,
              origin={61,-80})));
      equation
        e= smooth(2,Modelica.Math.Vectors.normalize(n));
        //e= smooth(0,if Modelica.Math.Vectors.length(n) >= eps then n/Modelica.Math.Vectors.length(n) else n/eps)
          //"normalize of vector n";

        Connections.branch(frame_a.R, frame_b.R);

        assert(cardinality(frame_a) > 0,
          "Connector frame_a of revolute joint is not connected");
        assert(cardinality(frame_b) > 0,
          "Connector frame_b of revolute joint is not connected");

        w = der(phi_ref);

        // relationships between quantities of frame_a and of frame_b
        frame_b.r_0 = frame_a.r_0;

        if Connections.rooted(frame_a.R) then
          R_rel = Modelica.Mechanics.MultiBody.Frames.planarRotation(e, phi_ref, w);
          frame_b.R = Modelica.Mechanics.MultiBody.Frames.absoluteRotation(frame_a.R, R_rel);
          frame_a.f = -Modelica.Mechanics.MultiBody.Frames.resolve1(R_rel, frame_b.f);
          frame_a.t = -Modelica.Mechanics.MultiBody.Frames.resolve1(R_rel, frame_b.t);
        else
          R_rel = Modelica.Mechanics.MultiBody.Frames.planarRotation(-e, phi_ref, w);
          frame_a.R = Modelica.Mechanics.MultiBody.Frames.absoluteRotation(frame_b.R, R_rel);
          frame_b.f = -Modelica.Mechanics.MultiBody.Frames.resolve1(R_rel, frame_a.f);
          frame_b.t = -Modelica.Mechanics.MultiBody.Frames.resolve1(R_rel, frame_a.t);
        end if;

        annotation (
          Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={
              Rectangle(
                extent={{-100,-60},{-30,60}},
                lineColor={0,0,0},
                fillPattern=FillPattern.HorizontalCylinder,
                fillColor={192,192,192}),
              Rectangle(
                extent={{30,-60},{100,60}},
                lineColor={0,0,0},
                fillPattern=FillPattern.HorizontalCylinder,
                fillColor={192,192,192}),
              Rectangle(extent={{-100,59},{-30,-60}}, lineColor={0,0,0}),
              Rectangle(extent={{30,60},{100,-60}}, lineColor={0,0,0}),
              Text(
                extent={{-90,14},{-54,-11}},
                lineColor={128,128,128},
                textString="a"),
              Text(
                extent={{51,11},{87,-14}},
                lineColor={128,128,128},
                textString="b"),
              Rectangle(
                extent={{-30,11},{30,-10}},
                lineColor={0,0,0},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-99,-127},{-42,-96}},
                lineColor={0,0,0},
                textString="n"),
              Text(
                visible=not useAxisFlange,
                extent={{-153,57},{147,117}},
                textString="%name",
                lineColor={0,0,255}),
              Text(
                extent={{34,-129},{91,-98}},
                lineColor={0,0,0},
                textString="phi")}),
          Diagram(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics),
          Documentation(info="<!DOCTYPE html><html>
<p>This joint is a modification of the Modelica.Mechanics.MultiBody.Joints.Revolute joint. The axis of rotation can be now be set via the input n. Furthermore, the input phi_ref sets the angle between the to frames (compare to useAxisFlange option of the original block).</p>
</html>"));
      end variableRevol1;

      model variablePrism2
      "Prismatic joint (1 translational degree-of-freedom, 2 potential states, optional axis flange)"

        import SI = Modelica.SIunits;
        extends Modelica.Mechanics.MultiBody.Interfaces.PartialElementaryJoint;
        Modelica.Mechanics.Translational.Interfaces.Flange_a axis
        "1-dim. translational flange that drives the joint"
          annotation (Placement(transformation(extent={{90,50},{70,70}}, rotation=0)));
        Modelica.Mechanics.Translational.Interfaces.Flange_b support
        "1-dim. translational flange of the drive drive support (assumed to be fixed in the world frame, NOT in the joint)"
          annotation (Placement(transformation(extent={{-30,50},{-50,70}}, rotation=
                 0)));
        constant SI.Position s_offset=0
        "Relative distance offset (distance between frame_a and frame_b = s_offset + s)"
          annotation (Evaluate=false);
        parameter StateSelect stateSelect=StateSelect.never
        "Priority to use distance s and v=der(s) as states"   annotation(Dialog(tab="Advanced"));
        Real e[3] "Unit vector in direction of prismatic axis n";

        SI.Position s(start=0, final stateSelect=stateSelect)
        "Relative distance between frame_a and frame_b"
          annotation (unassignedMessage="
The relative distance s of a prismatic joint cannot be determined.
Possible reasons:
- A non-zero mass might be missing on either side of the parts
  connected to the prismatic joint.
- Too many StateSelect.always are defined and the model
  has less degrees of freedom as specified with this setting
  (remove all StateSelect.always settings).
");

        //SI.Velocity v(start=0,final stateSelect=stateSelect)
         // "First derivative of s (relative velocity)";
        //SI.Acceleration a(start=0) "Second derivative of s (relative acceleration)";
        SI.Force f "Actuation force in direction of joint axis";

        Modelica.Mechanics.Translational.Components.Fixed fixed
          annotation (Placement(transformation(extent={{-50,30},{-30,50}})));
        Modelica.Mechanics.Translational.Interfaces.InternalSupport
          internalAxis(                                                          f = f)
          annotation (Placement(transformation(extent={{70,50},{90,30}})));
    public
        Modelica.Blocks.Interfaces.RealInput n[3] "direction vector"
                                                  annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=90,
              origin={-59,-100}), iconTransformation(
              extent={{-20,-20},{20,20}},
              rotation=90,
              origin={-66,-60})));
      equation
        //v = der(s);
        //a = der(v);

        e= smooth(2,Modelica.Math.Vectors.normalize(n)) "normalize of vector n";

        // relationships between kinematic quantities of frame_a and of frame_b
        frame_b.r_0 = frame_a.r_0 + Modelica.Mechanics.MultiBody.Frames.resolve1(frame_a.R, e*(s_offset + s));
        frame_b.R = frame_a.R;

        // Force and torque balance
        zeros(3) = frame_a.f + frame_b.f;
        zeros(3) = frame_a.t + frame_b.t + cross(e*(s_offset + s), frame_b.f);

        // d'Alemberts principle
        f = -e*frame_b.f;

        // Connection to internal connectors
        s = internalAxis.s;

        connect(fixed.flange, support) annotation (Line(
            points={{-40,40},{-40,60}},
            color={0,127,0},
            smooth=Smooth.None));
        connect(internalAxis.flange, axis)    annotation (Line(
            points={{80,40},{80,60}},
            color={0,127,0},
            smooth=Smooth.None));

        annotation (
          Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={
              Rectangle(
                extent={{-100,-50},{-30,41}},
                pattern=LinePattern.None,
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid,
                lineColor={0,0,255}),
              Rectangle(
                extent={{-100,40},{-30,50}},
                pattern=LinePattern.None,
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid,
                lineColor={0,0,255}),
              Rectangle(
                extent={{-30,-30},{100,20}},
                pattern=LinePattern.None,
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid,
                lineColor={0,0,255}),
              Rectangle(
                extent={{-30,20},{100,30}},
                pattern=LinePattern.None,
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid,
                lineColor={0,0,255}),
              Line(points={{-30,-50},{-30,50}}, color={0,0,0}),
              Line(points={{100,-30},{100,21}}, color={0,0,0}),
              Text(
                extent={{60,12},{96,-13}},
                lineColor={128,128,128},
                textString="b"),
              Text(
                extent={{-95,13},{-60,-9}},
                lineColor={128,128,128},
                textString="a"),
              Text(
                visible=useAxisFlange,
                extent={{-150,-155},{150,-95}},
                textString="%name",
                lineColor={0,0,255}),
              Text(
                extent={{-150,-93},{150,-54}},
                lineColor={0,0,0},
                textString="n=%n"),
              Rectangle(
                visible=useAxisFlange,
                extent={{90,30},{100,70}},
                pattern=LinePattern.None,
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid,
                lineColor={0,0,255})}),
          Diagram(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics),
          Documentation(info="<!DOCTYPE html><html>
<p>This joint is a modification of the Modelica.Mechanics.MultiBody.Joints.Prismatic joint. The axis of translation can be now be set via the input n.</p>
</html>"));
      end variablePrism2;

      model variableRevol2
      "Revolute joint (1 rotational degree-of-freedom, 2 potential states, optional axis flange)"

        import SI = Modelica.SIunits;

        Modelica.Mechanics.Rotational.Interfaces.Flange_a axis
        "1-dim. rotational flange that drives the joint"
          annotation (Placement(transformation(extent={{10,90},{-10,110}}, rotation=
                 0)));
        Modelica.Mechanics.Rotational.Interfaces.Flange_b support
        "1-dim. rotational flange of the drive support (assumed to be fixed in the world frame, NOT in the joint)"
          annotation (Placement(transformation(extent={{-70,90},{-50,110}},
                rotation=0)));

        Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a
        "Coordinate system fixed to the joint with one cut-force and cut-torque"
          annotation (Placement(transformation(extent={{-116,-16},{-84,16}},
                rotation=0)));
        Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b
        "Coordinate system fixed to the joint with one cut-force and cut-torque"
          annotation (Placement(transformation(extent={{84,-16},{116,16}},
                rotation=0)));
        constant SI.Angle phi_offset=0
        "Relative angle offset (angle = phi_offset + phi)";

        parameter StateSelect stateSelect=StateSelect.never
        "Priority to use joint angle phi and w=der(phi) as states"   annotation(Dialog(tab="Advanced"));

        SI.Angle phi(start=0, final stateSelect=stateSelect)
        "Relative rotation angle from frame_a to frame_b"
           annotation (unassignedMessage="
The rotation angle phi of a revolute joint cannot be determined.
Possible reasons:
- A non-zero mass might be missing on either side of the parts
  connected to the revolute joint.
- Too many StateSelect.always are defined and the model
  has less degrees of freedom as specified with this setting
  (remove all StateSelect.always settings).
");
        SI.AngularVelocity w(start=0, stateSelect=stateSelect)
        "First derivative of angle phi (relative angular velocity)";
        //SI.AngularAcceleration a(start=0)
          //"Second derivative of angle phi (relative angular acceleration)";
        SI.Torque tau "Driving torque in direction of axis of rotation";
        SI.Angle angle "= phi_offset + phi";

    protected
        outer Modelica.Mechanics.MultiBody.World world;
        Real e[3]
        "Unit vector in direction of rotation axis, resolved in frame_a (= same as in frame_b)";
        Modelica.Mechanics.MultiBody.Frames.Orientation R_rel
        "Relative orientation object from frame_a to frame_b or from frame_b to frame_a";

    protected
        Modelica.Mechanics.Rotational.Components.Fixed fixed
        "support flange is fixed to ground"
          annotation (Placement(transformation(extent={{-70,70},{-50,90}})));
        Modelica.Mechanics.Rotational.Interfaces.InternalSupport internalAxis(tau=tau)
          annotation (Placement(transformation(extent={{-10,90},{10,70}})));
    public
        Modelica.Blocks.Interfaces.RealInput n[3] "axis of rotation"
                                                  annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=90,
              origin={-60,-100}), iconTransformation(
              extent={{-20,-20},{20,20}},
              rotation=90,
              origin={-66,-60})));
      equation
        e= smooth(2,if sqrt(n[1]^2+n[2]^2+n[3]^2) >= Modelica.Constants.eps then n/sqrt(n[1]^2+n[2]^2+n[3]^2) else zeros(3));
        Connections.branch(frame_a.R, frame_b.R);

        assert(cardinality(frame_a) > 0,
          "Connector frame_a of revolute joint is not connected");
        assert(cardinality(frame_b) > 0,
          "Connector frame_b of revolute joint is not connected");

        angle = phi_offset + phi;
        w = der(phi);
        //a = der(w);

        // relationships between quantities of frame_a and of frame_b
        frame_b.r_0 = frame_a.r_0;

        if Connections.rooted(frame_a.R) then
          R_rel = Modelica.Mechanics.MultiBody.Frames.planarRotation(e, phi_offset + phi, w);
          frame_b.R = Modelica.Mechanics.MultiBody.Frames.absoluteRotation(frame_a.R, R_rel);
          frame_a.f = -Modelica.Mechanics.MultiBody.Frames.resolve1(R_rel, frame_b.f);
          frame_a.t = -Modelica.Mechanics.MultiBody.Frames.resolve1(R_rel, frame_b.t);
        else
          R_rel = Modelica.Mechanics.MultiBody.Frames.planarRotation(-e, phi_offset + phi, w);
          frame_a.R = Modelica.Mechanics.MultiBody.Frames.absoluteRotation(frame_b.R, R_rel);
          frame_b.f = -Modelica.Mechanics.MultiBody.Frames.resolve1(R_rel, frame_a.f);
          frame_b.t = -Modelica.Mechanics.MultiBody.Frames.resolve1(R_rel, frame_a.t);
        end if;

        // d'Alemberts principle
        tau = -frame_b.t*e;

        // Connection to internal connectors
        phi = internalAxis.phi;

        connect(fixed.flange, support) annotation (Line(
            points={{-60,80},{-60,100}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(internalAxis.flange, axis) annotation (Line(
            points={{0,80},{0,100}},
            color={0,0,0},
            smooth=Smooth.None));
        annotation (
          Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={
              Rectangle(
                extent={{-100,-60},{-30,60}},
                lineColor={0,0,0},
                fillPattern=FillPattern.HorizontalCylinder,
                fillColor={192,192,192}),
              Rectangle(
                extent={{30,-60},{100,60}},
                lineColor={0,0,0},
                fillPattern=FillPattern.HorizontalCylinder,
                fillColor={192,192,192}),
              Rectangle(extent={{-100,59},{-30,-60}}, lineColor={0,0,0}),
              Rectangle(extent={{30,60},{100,-60}}, lineColor={0,0,0}),
              Text(
                extent={{-90,14},{-54,-11}},
                lineColor={128,128,128},
                textString="a"),
              Text(
                extent={{51,11},{87,-14}},
                lineColor={128,128,128},
                textString="b"),
              Line(
                visible=useAxisFlange,
                points={{-20,80},{-20,60}},
                color={0,0,0}),
              Line(
                visible=useAxisFlange,
                points={{20,80},{20,60}},
                color={0,0,0}),
              Rectangle(
                visible=useAxisFlange,
                extent={{-10,100},{10,50}},
                lineColor={0,0,0},
                fillPattern=FillPattern.VerticalCylinder,
                fillColor={192,192,192}),
              Polygon(
                visible=useAxisFlange,
                points={{-10,30},{10,30},{30,50},{-30,50},{-10,30}},
                lineColor={0,0,0},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),
              Rectangle(
                extent={{-30,11},{30,-10}},
                lineColor={0,0,0},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),
              Polygon(
                visible=useAxisFlange,
                points={{10,30},{30,50},{30,-50},{10,-30},{10,30}},
                lineColor={0,0,0},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-150,-117},{150,-77}},
                lineColor={0,0,0},
                textString="n=%n"),
              Text(
                visible=useAxisFlange,
                extent={{-150,-175},{150,-115}},
                textString="%name",
                lineColor={0,0,255}),
              Line(
                visible=useAxisFlange,
                points={{-20,70},{-60,70},{-60,60}},
                color={0,0,0},
                smooth=Smooth.None),
              Line(
                visible=useAxisFlange,
                points={{20,70},{50,70},{50,60}},
                color={0,0,0},
                smooth=Smooth.None),
              Line(
                visible=useAxisFlange,
                points={{-90,100},{-30,100}},
                color={0,0,0}),
              Line(
                visible=useAxisFlange,
                points={{-30,100},{-50,80}},
                color={0,0,0}),
              Line(
                visible=useAxisFlange,
                points={{-49,100},{-70,80}},
                color={0,0,0}),
              Line(
                visible=useAxisFlange,
                points={{-70,100},{-90,80}},
                color={0,0,0})}),
          Diagram(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics),
          Documentation(info="<!DOCTYPE html><html>
<p>This joint is a modification of the Modelica.Mechanics.MultiBody.Joints.Revolute joint. The axis of rotation can be now be set via the input n.</p>
</html>"));
      end variableRevol2;

     annotation(preferredView="info");
    end Utilities;

    package SpecialVisualizers "Special Visualizers for contact animation"
    extends Modelica.Icons.BasesPackage;
      model FixedShapeVarAnimation
      "Visualizing an elementary shape with dynamically varying shape attributes (has one frame connector)"
        import SI = Modelica.SIunits;
        import Modelica.Mechanics.MultiBody.Types;
        extends Modelica.Mechanics.MultiBody.Interfaces.PartialVisualizer;

        parameter Boolean animation=true
        "= true, if animation shall be enabled";
        parameter Types.ShapeType shapeType="box" "Type of shape"
          annotation (Dialog(group="if animation = true", enable=animation));
        input SI.Position r_shape[3]={0,0,0}
        "Vector from frame_a to shape origin, resolved in frame_a"
          annotation (Dialog(group="if animation = true", enable=animation));
        input Types.Axis lengthDirection={1,0,0}
        "Vector in length direction of shape, resolved in frame_a"
          annotation (Evaluate=true, Dialog(group="if animation = true", enable=animation));
        input Types.Axis widthDirection={0,1,0}
        "Vector in width direction of shape, resolved in frame_a"
          annotation (Evaluate=true, Dialog(group="if animation = true", enable=animation));
        input SI.Distance length(start=1) "Length of shape"
          annotation (Dialog(group="if animation = true", enable=animation));
        input SI.Distance width(start=0.1) "Width of shape"
           annotation (Dialog(group="if animation = true", enable=animation));
        input SI.Distance height(start=0.1) "Height of shape"
          annotation (Dialog(group="if animation = true", enable=animation));
        input Modelica.Mechanics.MultiBody.Types.Color color={0,128,255}
        "Color of shape"
          annotation (Dialog(__Dymola_colorSelector=true, group="if animation = true", enable=animation));
        input Types.ShapeExtra extra=0.0
        "Additional data for cylinder, cone, pipe, gearwheel and spring"
          annotation (Dialog(group="if animation = true", enable=animation));
        input Types.SpecularCoefficient specularCoefficient = world.defaultSpecularCoefficient
        "Reflection of ambient light (= 0: light is completely absorbed)"
          annotation (Dialog(group="if animation = true", enable=animation));

    protected
        Real width_;
        Real length_;
        Real height_;
        Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape vis(
          shapeType=shapeType,
          r_shape=r_shape,
          lengthDirection=lengthDirection,
          widthDirection=widthDirection,
          length=length_,
          width=width_,
          height=height_,
          color=color,
          extra=extra,
          specularCoefficient=specularCoefficient,
          r=frame_a.r_0,
          R=frame_a.R) if world.enableAnimation and animation;
    public
        Modelica.Blocks.Interfaces.BooleanInput  disableAnimation
        "Connector of Boolean input signal"   annotation (Placement(
              transformation(
              extent={{-20,-20},{20,20}},
              rotation=90,
              origin={0,-103})));
      equation
        // No forces and torques
        frame_a.f = zeros(3);
        frame_a.t = zeros(3);
        if not disableAnimation then
          width_=width;
          height_=height;
          length_=length;
        else
          width_=0;
          height_=0;
          length_=0;
        end if;
        annotation (
          Documentation(info="<!DOCTYPE html> <HTML><p>This model is a modification of <a href=\"modelica://Modelica.Mechanics.MultiBody.Visualizers.FixedShape\">Modelica.Mechanics.MultiBody.Visualizers.FixedShape</a>. The animation can be disabled via the boolean input. Therefore, the dimensions of the animation are set to 0.
</p></HTML>"),       Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={
              Polygon(
                points={{-100,33},{-100,-61},{-10,-41},{50,-61},{50,33},{-10,11},{-100,
                    33}},
                lineColor={0,127,255},
                fillColor={0,127,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-98,34},{-64,46},{0,30},{74,56},{50,32},{-10,12},{-98,34}},
                lineColor={255,255,255},
                fillColor={160,160,164},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{72,54},{50,32},{50,-60},{72,-32},{72,54}},
                lineColor={255,255,255},
                fillColor={160,160,164},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-150,-65},{150,-95}},
                lineColor={0,0,0},
                textString="%shapeType"),
              Text(
                extent={{-150,100},{150,60}},
                textString="%name",
                lineColor={0,0,255})}),
          Diagram(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics));
      end FixedShapeVarAnimation;

      model PointMassVarAnimation
      "Rigid body where body rotation and inertia tensor is neglected (6 potential states)"

        import SI = Modelica.SIunits;
        import Modelica.Mechanics.MultiBody.Types;
        Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a
        "Coordinate system fixed at center of mass point"
          annotation (Placement(transformation(extent={{-16,-16},{16,16}}, rotation=
                 0)));
        parameter Boolean animation=true
        "= true, if animation shall be enabled (show sphere)";
        parameter SI.Mass m(min=0) "Mass of mass point";
        input SI.Diameter sphereDiameter=world.defaultBodyDiameter
        "Diameter of sphere"   annotation (Dialog(
            tab="Animation",
            group="if animation = true",
            enable=animation));
        input Types.Color sphereColor=Modelica.Mechanics.MultiBody.Types.Defaults.BodyColor
        "Color of sphere"   annotation (Dialog(
            tab="Animation",
            group="if animation = true",
            enable=animation));
        input Types.SpecularCoefficient specularCoefficient = world.defaultSpecularCoefficient
        "Reflection of ambient light (= 0: light is completely absorbed)"
          annotation (Dialog(
            tab="Animation",
            group="if animation = true",
            enable=animation));
        parameter StateSelect stateSelect=StateSelect.avoid
        "Priority to use frame_a.r_0, v_0 (= der(frame_a.r_0)) as states"   annotation(Dialog(tab="Advanced"));

        SI.Position r_0[3](start={0,0,0}, each stateSelect=stateSelect)
        "Position vector from origin of world frame to origin of frame_a, resolved in world frame"
          annotation(Dialog(group="Initialization", showStartAttribute=true));
        SI.Velocity v_0[3](start={0,0,0}, each stateSelect=stateSelect)
        "Absolute velocity of frame_a, resolved in world frame (= der(r_0))"
          annotation(Dialog(group="Initialization", showStartAttribute=true));
        SI.Acceleration a_0[3](start={0,0,0})
        "Absolute acceleration of frame_a resolved in world frame (= der(v_0))"
          annotation(Dialog(group="Initialization", showStartAttribute=true));

    protected
        outer Modelica.Mechanics.MultiBody.World world;
        Real sphereDiameter_;
        // Declarations for animation
        Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape sphere(
          shapeType="sphere",
          color=sphereColor,
          specularCoefficient=specularCoefficient,
          length=sphereDiameter_,
          width=sphereDiameter_,
          height=sphereDiameter_,
          lengthDirection={1,0,0},
          widthDirection={0,1,0},
          r_shape=-{1,0,0}*sphereDiameter_/2,
          r=frame_a.r_0,
          R=frame_a.R) if world.enableAnimation and animation;
    public
        Modelica.Blocks.Interfaces.BooleanInput disableAnimation
        "Connector of Boolean input signal"   annotation (Placement(
              transformation(
              extent={{-20,-20},{20,20}},
              rotation=90,
              origin={1,-102})));
      equation
        // If any possible, do not use the connector as root
        Connections.potentialRoot(frame_a.R, 10000);
        if not disableAnimation then
          sphereDiameter_=sphereDiameter;
        else
          sphereDiameter_=0;

        end if;

        if Connections.isRoot(frame_a.R) then
           assert(cardinality(frame_a)==0, "
A Modelica.Mechanics.MultiBody.Parts.PointMass model is connected in
a way, so that no equations are present to compute frame_a.R
(the orientation object in the connector). Setting frame_a.R to
an arbitrary value in the PointMass model, might lead to a wrong
overall model, depending on how the PointMass model is used.
   You can avoid this message, by providing equations that
compute the orientation object, e.g., by using the
Modelica.Mechanics.MultiBody.Joints.FreeMotion joint.
   If a PointMass model is not connected at all, the
orientation object is set to a unit rotation. But this is
the only case where this is done.
");       frame_a.R = Modelica.Mechanics.MultiBody.Frames.nullRotation();
        else
           frame_a.t = zeros(3);
        end if;

        // Newton equation: f = m*(a-g)
        r_0 = frame_a.r_0;
        v_0 = der(r_0);
        a_0 = der(v_0);
        frame_a.f = m*Modelica.Mechanics.MultiBody.Frames.resolve2(frame_a.R, a_0 -
          world.gravityAcceleration(r_0));
        annotation (
          Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={
              Text(
                extent={{150,-90},{-150,-60}},
                lineColor={0,0,0},
                textString="m=%m"),
              Text(
                extent={{-150,100},{150,60}},
                textString="%name",
                lineColor={0,0,255}),
              Ellipse(
                extent={{-50,50},{50,-50}},
                lineColor={0,0,0},
                fillPattern=FillPattern.Sphere,
                fillColor={0,127,255})}),
          Diagram(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics),
          Documentation(info="<!DOCTYPE html><HTML><p>This rigid body is a modification of <a href=\"modelica://Modelica.Mechanics.MultiBody.Parts.PointMass\">Modelica.Mechanics.MultiBody.Parts.PointMass</a>. The animation can be disabled via the boolean input. Therefore, the diameter of the sphere is set to 0.
</p></HTML>"));
      end PointMassVarAnimation;

    end SpecialVisualizers;

    partial model PartialContactBlock "Partial model for the contact blocks"
      import SI = Modelica.SIunits;
      outer parameter SI.TranslationalSpringConstant springCoefficient;
      outer parameter SI.TranslationalDampingConstant dampingCoefficient;
      outer parameter Real n1;
      outer parameter Real n2;
      outer parameter SI.CoefficientOfFriction mue_r;
      outer parameter Real gamma1;
      outer parameter Real gamma2;
      outer parameter Real gamma3;
      outer parameter Real gamma4;
      outer parameter Real gamma5;
      outer parameter Real gamma6;
      outer parameter SI.Distance p_max;
      outer parameter SI.Frequency f;
      outer parameter Boolean exact;
      outer parameter Boolean animation=true;
      outer parameter Modelica.SIunits.Radius radiusContactPoint;
      outer parameter Modelica.Mechanics.MultiBody.Types.Color
        colorContactPoints1;
      outer parameter Modelica.Mechanics.MultiBody.Types.Color
        colorContactPoints2;

  protected
      parameter Real N1 = if n1==0 then Modelica.Constants.eps else n1;   //to avoid mathematical error in case of 0^0
      parameter Real N2 = if n2==0 then Modelica.Constants.eps else n2;
  public
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_b "port2_frame"
        annotation (Placement(transformation(extent={{-118,-90},{-86,-58}})));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a "port1_frame"
        annotation (Placement(transformation(extent={{-118,70},{-86,102}})));
      Modelica.Blocks.Interfaces.RealInput vector_1[12] "port1_vector"
                                                           annotation (
          Placement(transformation(
            extent={{-9,-9},{9,9}},
            rotation=0,
            origin={-107,37})));
      Modelica.Blocks.Interfaces.RealInput vector_2[12] "port2_vector"
                                                           annotation (
          Placement(transformation(
            extent={{-8,-8},{8,8}},
            rotation=0,
            origin={-106,-30})));
    Interfaces.ShapeTypeInput surfaceType1 annotation (Placement(transformation(extent={{-116,8},{-98,26}})));
    Interfaces.ShapeTypeInput surfaceType2 annotation (Placement(transformation(extent={{-114,-56},{-98,-40}})));
      Modelica.Blocks.Interfaces.BooleanOutput contact
        annotation (Placement(transformation(extent={{96,-12},{116,8}})));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}),
                          graphics));
    end PartialContactBlock;

    partial model PartialContactSurface "Partial model to define a surface"

    parameter Boolean animation=true "= true, if animation shall be enabled";
    parameter Boolean animation_BCS = true
      "= true, if animation of body coordinate system shall be enabled";
    parameter Modelica.Mechanics.MultiBody.Types.Color color={255,128,0}
      "color of the contact surface";
    parameter IdealizedContact.ContactSurfaces.Types.ContactShapeType contactShape
      "shape of the contact surface";

      Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a
      "Coordinate system fixed to the component with one cut-force and cut-torque"
        annotation (Placement(transformation(extent={{-122,-14},{-78,30}}),
            iconTransformation(extent={{-112,-16},{-80,16}})));
      Interfaces.Contact_a  contact_a
        annotation (Placement(transformation(extent={{90,-2},{110,18}}),
            iconTransformation(extent={{78,-16},{108,16}})));

      Modelica.Mechanics.MultiBody.Visualizers.FixedFrame fixedFrame(
        color_x=color,
        color_y=color,
        color_z=color,
        animation=animation_BCS)
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-36,-24})));
  protected
      final Modelica.Mechanics.MultiBody.Parts.Body body(
        r_CM={0,0,0},
        m=0,
        I_11=0,
        I_22=0,
        I_33=0,
        animation=false)
      "To avoid errors when no external body is connected to the surface model"
        annotation (Placement(transformation(extent={{22,-34},{42,-14}})));
  public
      Modelica.Blocks.Routing.Multiplex4 multiplex(
        n1=3,
        n2=3,
        n3=3,
        n4=3) annotation (Placement(transformation(extent={{-22,72},{-6,88}})));
    equation
     contact_a.contactShape=contactShape;
    connect(frame_a, fixedFrame.frame_a) annotation (Line(
        points={{-100,8},{-10,8},{-10,-24},{-26,-24}},
        color={95,95,95},
        thickness=0.5,
        smooth=Smooth.None));
    connect(fixedFrame.frame_a, body.frame_a) annotation (Line(
        points={{-26,-24},{22,-24}},
        color={95,95,95},
        thickness=0.5,
        smooth=Smooth.None));
      connect(multiplex.y, contact_a.u) annotation (Line(
          points={{-5.2,80},{44,80},{44,8},{100,8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(frame_a, contact_a.frame) annotation (Line(
          points={{-100,8},{100,8}},
          color={95,95,95},
          thickness=0.5,
          smooth=Smooth.None));
     annotation (
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
             graphics={
            Text(
              extent={{-100,-74},{106,-96}},
              lineColor={255,128,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%name")}));
    end PartialContactSurface;

   annotation(preferredView="info");
  end Components;


  package Interfaces "Contact interfaces"
    extends Modelica.Icons.InterfacesPackage;
    connector Contact_a "Contact interface of the surface definition"
      import B = Modelica.Blocks;
      import A = Modelica.Mechanics.MultiBody;
    A.Interfaces.Frame_a frame;
    B.Interfaces.RealOutput u[12];
    IdealizedContact.Interfaces.ShapeTypeOutput contactShape;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}),
                       graphics={Rectangle(
              extent={{-60,60},{60,-60}},
              lineColor={255,128,0},
              fillColor={255,128,0},
              fillPattern=FillPattern.Solid)}), Documentation(info="<!DOCTYPE html><html>
<p>Interface of the surface definition.</p>
</html>"));
    end Contact_a;

    connector Contact_b "Contact Interface of the contact block."
      import B = Modelica.Blocks;
      import A = Modelica.Mechanics.MultiBody;
    A.Interfaces.Frame_a frame;
    B.Interfaces.RealInput u[12];
    IdealizedContact.Interfaces.ShapeTypeInput contactShape;

      annotation (Icon(graphics={Rectangle(
              extent={{-60,60},{60,-60}},
              lineColor={255,128,0},
              fillColor={255,128,0},
              fillPattern=FillPattern.Solid)}), Documentation(info="<!DOCTYPE html><html>
<p>Interface of the contact block.</p>
</html>"));
    end Contact_b;

    connector ShapeTypeInput =   input
      IdealizedContact.ContactSurfaces.Types.ContactShapeType
    "'input ContactShapeType' as connector"
      annotation (defaultComponentName="contactShapeType",
      Icon(graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={255,128,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
                     Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={255,128,0},
              fillColor={255,128,0},
              fillPattern=FillPattern.Solid)},
           coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=false,initialScale=0.2)),
      Diagram(coordinateSystem(
            preserveAspectRatio=false,initialScale=0.2,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={
        Rectangle(
          extent={{0,50},{100,-50}},
          lineColor={255,128,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
                                   Polygon(
            points={{0,50},{100,0},{0,-50},{0,50}},
            lineColor={255,128,0},
            fillColor={255,128,0},
            fillPattern=FillPattern.Solid),   Text(
              extent={{-10,85},{-10,60}},
              lineColor={255,128,0},
            textString="%name")}),
        Documentation(info="<!DOCTYPE html><html>
<p>
Connector with one input signal of type IdealizedContact.ContactSurfaces.Types.ContactShapeType.
</p>
</html>"));
    connector ShapeTypeOutput =  output
      IdealizedContact.ContactSurfaces.Types.ContactShapeType
    "'output ContactShapeType' as connector"
      annotation (defaultComponentName="contactShapeType",
      Icon(graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={255,128,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
                     Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={255,128,0})},
           coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
      Diagram(coordinateSystem(
            preserveAspectRatio=true, initialScale=0.2,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={
        Rectangle(
          extent={{0,50},{100,-50}},
          lineColor={255,128,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
                                   Polygon(
          points={{0,50},{100,0},{0,-50},{0,50}},
          lineColor={255,128,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),     Text(
              extent={{-10,85},{-10,60}},
              lineColor={255,128,0},
            textString="%name")}),
        Documentation(info="<!DOCTYPE html><html>
<p>
Connector with one input signal of type IdealizedContact.ContactSurfaces.Types.ContactShapeType.
</p>
</html>"));
   annotation(preferredView="info", Documentation(info="<!DOCTYPE html><html>
<p>In order to be able to use the dimensions of the contact surfaces in the contact block a new interfaces to connect the surface definition with a contact block is introduced. This adds a scalar vector to the MultiBody frame of the Modelica Standard Library that comprises maximum three terms to describe the surface geometry and the three direction vectors to resolve them in the connected frame. The latter constitutes the body coordinate system (BCS) of the contact surface.</p>
</html>"));
  end Interfaces;


  annotation (Window(
    x=0.45,
    y=0.01,
    width=0.44,
    height=0.65,
    library=1,
    autolayout=1),version="0.2.0", uses(Modelica(version="3.2.1")), preferredView="info",
  Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
      Rectangle(
        extent={{14,-66},{90,-72}},
        fillColor={95,95,95},
        fillPattern=FillPattern.Solid,
        pattern=LinePattern.None,
        lineColor={0,0,0}),
      Ellipse(
        extent={{-80,70},{-18,8}},
        fillColor={175,175,175},
        fillPattern=FillPattern.Solid,
        pattern=LinePattern.None,
        lineColor={0,0,0}),
      Ellipse(
        extent={{24,-4},{86,-66}},
        fillColor={95,95,95},
        fillPattern=FillPattern.Solid,
        pattern=LinePattern.None,
        lineColor={0,0,0}),
      Rectangle(
        extent={{-84,-66},{-16,-72}},
        fillColor={175,175,175},
        fillPattern=FillPattern.Solid,
        pattern=LinePattern.None,
        lineColor={0,0,0})}),
    Documentation(info="<!DOCTYPE html><html>
<p>The Idealized Contact Library is ready-to-use contact library for Modelica. It comprises surface definitions for simple contact surfaces, which can be connected with the multibodies of the Modelica Standard Library. It implements a force-based approach between single contact points. The contact forces are calculated in configurable non-central contact blocks. </p>
</html>"));
end IdealizedContact;
