within ;
package IdealizedContact "idealized contact models for simple surfaces"
extends Modelica.Icons.Package;


  package UsersGuide "User's Guide of IdealizedContact Library"
  extends Modelica.Icons.Information;

    class ContactSurfaces "How to use the contact surfaces"
    extends Modelica.Icons.Information;
      annotation (preferredView="info",Documentation(info="<!DOCTYPE html><html>
<p>To describe elementary <a href=\"modelica://IdealizedContact.ContactSurfaces\">contact surfaces</a>, the library provides ready-to-use blocks. The surface definition represents a thin and massless layer, which can be connected to any kind of rigid body by a frame connector. The dimensions of the surface can be parameterized. In order to be able to use the dimensions in the contact block we introduce a new interface to connect the surface definition with a contact block. The figure shows the resulting shape of the contact area for all possible combinations, as well as the number of contact points to describe it.</p>
<p><br/><img src=\"modelica://IdealizedContact/Resources/Images/table_contactsurfaces.png\"/></p>
</html>"));
    end ContactSurfaces;

    class ElementaryContactBodies "How to use the elementary contact bodies"
    extends Modelica.Icons.Information;
      annotation (preferredView="info",Documentation(info="<!DOCTYPE html><html>
<p>The library includes predefined, <a href=\"modelica://IdealizedContact.ElementaryContactBodies\">elementary bodies</a> like cuboids or cylinders which combine several contact surfaces and include a Multibody block. Each contact surface can be enabled seperately. These do contain masses and moments of inertia, which are calculated by the dimensions and the density of the material. The Figure displays the<b> ElementaryContactBodies</b> that are currently available.</p>
<p><img src=\"modelica://IdealizedContact/Resources/Images/ElementaryContactBodies.png\"/> </p>
</html>"));
    end ElementaryContactBodies;

    class ContactBlock "How to use the contact block"
    extends Modelica.Icons.Information;
      annotation (preferredView="info",Documentation(info="<!DOCTYPE html><html>
<p>The <a href=\"modelica://IdealizedContact.ContactBlock.Contact\">contact block</a> calculates the appropriate force depending on the combination of surfaces. It is connected to a corresponding pair of contact surfaces. So, the respective combination of contact surfaces has to be chosen at first by setting the parameter contactDefinition. This will use the Modelica replaceable statement to define the appropiate components of the contact block. Then connect the contact interfaces of the two contact surfaces to the respective port of the contact block (first&nbsp;surface&nbsp;mentioned&nbsp;must&nbsp;be&nbsp;connected&nbsp;to&nbsp;port&nbsp;1).</p>
<p>In the case of a collision of the two connected surface (the contact condition holds for at least one contact point) a three-dimensional contact force is applied. It consists of both the normal force and the tangential friction. The respective directions can be obtained by means of the local coordinate systems in the contact points. As compared to more complex models, the continuous surface layer is replaced by a nonlinear spring/damper element. Consequently, the normal force Fn&nbsp;is determined by means of the penetration p&nbsp;and the penetration velocity. A continuous contact force model with hysteresis damping according to [9] is implemented. Nevertheless, choosing n1=1 and n=0&nbsp;one can get the linear Kelvin-Voigt model, where the coefficients are the spring and damping constant. Choosing n1=n2&nbsp;one will get the formulation according to [10].</p>
<p><img src=\"modelica://IdealizedContact/Resources/Images/equations/Fn.jpg\"/></p>
<p><br/>In order to calculate the friction forces without further discontinuous events, which would decrease the simulation speed and impede controller design, we use the continuously differentiable friction model of Makkar et al. [11]. They introduced the following function of the relative velocity&nbsp;to approximate the friction coefficient&nbsp;of the characteristic Stribeck curve.</p>
<p><img src=\"modelica://IdealizedContact/Resources/Images/equations/mue.jpg\"/></p>
<p>In doing so, no ideal static friction can be obtained because the actual force to be applied in the static state is independent from the relative velocity&nbsp;of the two bodies. Static friction is rather represented by sliding with very small relative velocities. To set the unknown constants gamma_i we use five parameters, which can be seen in the figure. The parameters mue_s&nbsp;and mue_k&nbsp;denote the coefficients of static and kinetic friction. The limit velocity v_e1&nbsp;and v_e2&nbsp;define the beginning of mixed and viscous friction. The latter is described by the proportionality factor k_v.</p>
<p><br/><br/><img src=\"modelica://IdealizedContact/Resources/Images/mue.jpg\"/></p>
<p><br/>The complete vector of the contact force is then computed as follows.</p>
<p><img src=\"modelica://IdealizedContact/Resources/Images/equations/Fcontact.jpg\"/></p>
<p><b>Note:</b> The collision of two cylinders can lead to linear or punctiform contact regions. The calculation for these two cases is currently seperated in two blocks. Integration of the two blocks is in progress.</p>
<p><b>see <a href=\"modelica://IdealizedContact.UsersGuide.Literature\">Literature</a> for references.</b></p>
</html>"));
    end ContactBlock;

    class ContactInterface "How to use the contact interface"
    extends Modelica.Icons.Information;
      annotation (preferredView="info",Documentation(info="<!DOCTYPE html><html>
<p>In order to be able to use the dimensions of the contact surfaces in the contact block a new <a href=\"modelica://IdealizedContact.Interfaces\">interface</a> to connect the surface definition with a contact block  is introduced. This adds a scalar vector to the MultiBody frame of the Modelica Standard Library that comprises maximum three terms to describe the surface geometry and the three direction vectors to resolve them in the connected frame. The latter constitutes the body coordinate system (BCS) of the contact surface.</p>
</html>"));
    end ContactInterface;

    class Literature "Literature"
    extends Modelica.Icons.References;
      annotation (preferredView="info", Documentation(info="<!DOCTYPE html><html>
<p>The library is described in:</p>
<p>Felix Oesters&ouml;tebier, Peng Wang and Ansgar Tr&auml;chtler: <b><a href=\"modelica://IdealizedContact/Resources/Documentation/Idealized Modelica Contact Library_Final_Paper.pdf\">A Modelica Contact Library for Idealized Simulation of Independently Defined Contact Surfaces</a> </b>submitted to the <b>10th International Modelica Conference 2014</b> in Lund/Sweden.</p>
<p><br/>It is furthermore based on the following theses:</p>
<dl><dt>Peng Wang:</dt>
<dd><b>Idealisierte Modellierung von Kontakten in Dymola/Modelica</b>. Date: 21.12.2011</dd>
<dd>Supervisor: Felix Oesters&ouml;tebier</dd></dl>
<dl><dt>Peng Wang:</dt>
<dd><b>Aufbau einer Kontaktbibliothek f&uuml;r einfache Kontaktgeometrien in Dymola/Modelica</b>. Date: 23.11.2012</dd>
<dd>Supervisor: Felix Oesters&ouml;tebier</dd>
</dl><p><br/>And, it also refers to these publications:</p>
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
      annotation (Documentation(info="<!DOCTYPE html><html>

<table border=0 cellspacing=0 cellpadding=2>
<tr>
<td>
<a href=\"http://www.hni.uni-paderborn.de/en/control-engineering-and-mechatronics/staff/136187502734681/\">Peng Wang </a></br><br>Heinz Nixdorf Institute </br><br>University of Paderborn </br><br>Control Engineering and Mechatronics </br><br>F&uuml;rstenallee 11 </br>
<br>33102 Paderborn </br>
<br>GERMANY </br>
<p>E-Mail: peng.wang(at)hni.upb.de </p>
</td>
<td valign=\"middle\">&nbsp;&nbsp;and&nbsp;&nbsp;</td>
<td>
<a href=\"http://www.hni.uni-paderborn.de/en/control-engineering-and-mechatronics/staff/118900600706213/\">Felix Oesters&ouml;tebier </a></br><br>Heinz Nixdorf Institute </br><br>University of Paderborn </br><br>Control Engineering and Mechatronics </br><br>F&uuml;rstenallee 11 </br>
<br>33102 Paderborn </br>
<br>GERMANY </br>
<p>E-Mail: felix.oestersoetebier(at)hni.upb.de </p>
</td>
<td></td>
</tr>
<tr><td>
<p><br><a href=\"http://www.hni.uni-paderborn.de/en/control-engineering-and-mechatronics\">http://www.hni.uni-paderborn.de/en/control-engineering-and-mechatronics/</a> </p></td><td></td><td></td>
</tr>
<tr><td></td></tr>
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

    class ReleaseNotes "Release notes"
    extends Modelica.Icons.Information;
      annotation (preferredView="info", Documentation(info="<!DOCTYPE html><html>
<h4>Version 0.1.0, 2014-05-07</h4>
<p>Uses Modelica Standard Library 3.2</p>
<p>Initial version based on the one presented at Modelica 2014.</p>
<p><b>Note:</b> The collision of two cylinders can lead to linear or punctiform contact regions. The calculation for these two cases are currently seperated in two blocks. Integration of the two blocks is in progress.</p>
<br/><b>Licensed by Heinz Nixdorf Institute under the Modelica License 2</b>
<p><i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica license 2, see <a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a> or visit <a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p>
<br/><b>Acknowledgements:</b>
<p>This work was developed in the project ENTIME: Entwurfstechnik Intelligente Mechatronik (Design Methods for Intelligent Mechatronic Systems). The project ENTIME is funded by the state of North Rhine-Westphalia (NRW), Germany and the EUROPEAN UNION, European Regional Development Fund, Investing in your future. <a href=\"http://entime.upb.de/\">ENTIME</a></p>
</html>"));
    end ReleaseNotes;
    annotation (Documentation(info="<!DOCTYPE html><html>
<p>The<b> IdealizedContact</b> Library is a free Modelica package for modeling and handling of collisions in MultiBody Systems.</p>
<p>Modeling of multibody mechanics plays a central role in the design of mechatronic systems. In technical use-cases, these often contain loose couplings, where contact is possible. The IdealizedContact library is ready-to-use contact library for Modelica. It comprises surface definitions for simple contact surfaces, which can be connected with the multibodies of the Modelica Standard Library. It furthermore implements a force-based approach between single contact points. The contact forces are calculated in configurable non-central contact blocks. </p>
<p>The aim is to bring the designer in the position to perform simulations of industrial applications including contacts. Thereby, the analysis of the principle functional capability of the system in the course of the conceptual design is focused. This entails specialized modeling principles concerning the usability and the interpretation of the simulation results, which both should be relatively easy. In addition, it should be possible to define each component separately in order to be able to reuse and combine approved patterns in new applications (c.f. [4]).</p>
<p>Detailed explenations of the concept can be found in the respective <a href=\"modelica://IdealizedContact.UsersGuide.Literature\">Literature</a>. Exemplarily the results of chosen experiments are shown therein. They are compared with benchmark simulations in RecurDyn. </p>
<p><h4>Licensed under the Modelica License 2</h4></p>
<p><i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica license 2, see the license conditions (including the disclaimer of warranty) at <a href=\"http://www.Modelica.org/licenses/ModelicaLicense2\">http://www.Modelica.org/licenses/ModelicaLicense2</a>.</i> </p>
<p><br/><b>Acknowledgements:</b> </p>
<p>This work was developed in the project ENTIME: Entwurfstechnik Intelligente Mechatronik (Design Methods for Intelligent Mechatronic Systems). The project ENTIME is funded by the state of North Rhine-Westphalia (NRW), Germany and the EUROPEAN UNION, European Regional Development Fund, Investing in your future. <a href=\"http://entime.upb.de/\">ENTIME</a> </p>
</html>"),   preferredView="info");
  end UsersGuide;


  package Examples
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
        r_rel_a(start={-0.1,0.3,0}, fixed=true))
        annotation (Placement(transformation(extent={{-48,12},{-32,28}})));
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
        redeclare
        IdealizedContact.ContactBlock.PunctiformContact.SphereToSphere
          contactDefinition "SphereToSphere")
        annotation (Placement(transformation(extent={{38,-10},{58,10}})));
      ElementaryContactBodies.SphericalContactBody sphericalContactBody(color={
            0,0,255})
        annotation (Placement(transformation(extent={{-4,8},{18,30}})));
      ElementaryContactBodies.SphericalContactBody sphericalContactBody1(color=
            {255,0,0}, radius=0.12)
        annotation (Placement(transformation(extent={{-2,-32},{20,-8}})));
    equation
      connect(freeMotion.frame_a,world. frame_b) annotation (Line(
          points={{-48,20},{-60,20},{-60,-20},{-66,-20}},
          color={95,95,95},
          thickness=0.5));
      connect(fixedRotation.frame_a,world. frame_b) annotation (Line(
          points={{-46,-20},{-66,-20}},
          color={95,95,95},
          thickness=0.5));
      connect(freeMotion.frame_b, sphericalContactBody.frame_a) annotation (
          Line(
          points={{-32,20},{-17.5111,20},{-17.5111,19.22},{-3.56,19.22}},
          color={95,95,95},
          thickness=0.5));
      connect(fixedRotation.frame_b, sphericalContactBody1.frame_a) annotation (
         Line(
          points={{-34,-20},{-18.5111,-20},{-18.5111,-19.76},{-1.56,-19.76}},
          color={95,95,95},
          thickness=0.5));

      connect(sphericalContactBody.contact_a,contact. Port1) annotation (Line(
          points={{17.34,19.22},{47.2889,19.22},{47.2889,10.9},{48,10.9}},
          color={255,128,0}));
      connect(sphericalContactBody1.contact_a,contact. Port2) annotation (Line(
          points={{19.34,-19.76},{48.2889,-19.76},{48.2889,-11.1},{48,-11.1}},
          color={255,128,0}));

      annotation (experiment(StartTime=0, StopTime=1));
    end Example1;

    model Example2 "Sphere to cylinder"
    extends Modelica.Icons.Example;
      inner Modelica.Mechanics.MultiBody.World world(animateGravity=false,
        enableAnimation=true,
        animateWorld=false)
        annotation (Placement(transformation(extent={{-88,0},{-68,20}})));
      Modelica.Mechanics.MultiBody.Joints.FreeMotion freeMotion(animation=false,
        angles_fixed=false,
        w_rel_a_fixed=false,
        enforceStates=false,
        r_rel_a(start={0,0.05,0}, fixed=true))
        annotation (Placement(transformation(extent={{-48,40},{-28,60}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation(animation=false,
        n={0,1,0} "y axis",
        angle=0)
        annotation (Placement(transformation(extent={{-48,0},{-28,20}})));
      ElementaryContactBodies.SphericalContactBody
                                                 ball(color={255,0,0})
        annotation (Placement(transformation(extent={{-4,38},{18,60}})));
      ElementaryContactBodies.CylindricalContactBody
                                                   cylinder(color={0,0,255},
          surfaceColor={0,0,255},
        enableFrontSurface1=false,
        enableFrontSurface2=false)
        annotation (Placement(transformation(extent={{28,-12},{50,10}})));

      IdealizedContact.ContactBlock.Contact contact(
        p_max=0.005,
        mue_s=0.03,
        n1=1.2,
        n2=1.2,
        mue_k=0.02,
        springCoefficient=1000000,
        dampingCoefficient=10000,
        f=10000,
        exact=true,
        redeclare
        IdealizedContact.ContactBlock.PunctiformContact.SphereToCylinder
          contactDefinition "SphereToCylinder")
        annotation (Placement(transformation(extent={{28,18},{48,38}})));
    equation
      connect(freeMotion.frame_a,world. frame_b) annotation (Line(
          points={{-48,50},{-58,50},{-58,10},{-68,10}},
          color={95,95,95},
          thickness=0.5));
      connect(fixedRotation.frame_a,world. frame_b) annotation (Line(
          points={{-48,10},{-68,10}},
          color={95,95,95},
          thickness=0.5));
      connect(freeMotion.frame_b, ball.frame_a) annotation (Line(
          points={{-28,50},{-16,50},{-16,49.22},{-3.56,49.22}},
          color={95,95,95},
          thickness=0.5));
      connect(cylinder.frame_a, fixedRotation.frame_b) annotation (Line(
          points={{32.84,-7.82},{34,-7.82},{34,-16},{0,-16},{0,10},{-28,10}},
          color={95,95,95},
          thickness=0.5));
      connect(cylinder.contact_lateral,contact. Port2) annotation (Line(
          points={{39,6.26},{39,11.36},{38,11.36},{38,16.9}},
          color={255,128,0},
          thickness=1));
      connect(ball.contact_a,contact. Port1) annotation (Line(
          points={{17.34,49.22},{37.2889,49.22},{37.2889,38.9},{38,38.9}},
          color={255,128,0}));
    annotation (experiment(StartTime=0, StopTime=1));
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
        r_rel_a(start={0,0.05,0}, fixed=true))
        annotation (Placement(transformation(extent={{-34,46},{-14,66}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation(animation=false,
        n={0,0,1},
        r={0,-0.015,0},
        angle=5)
        annotation (Placement(transformation(extent={{-48,-50},{-28,-30}})));
      ElementaryContactBodies.SphericalContactBody
                                                 ball(color={255,0,0})
        annotation (Placement(transformation(extent={{4,44},{26,66}})));
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
          thickness=0.5));
      connect(fixedRotation.frame_a,world. frame_b) annotation (Line(
          points={{-48,-40},{-58,-40},{-58,10},{-68,10}},
          color={95,95,95},
          thickness=0.5));
      connect(freeMotion.frame_b, ball.frame_a) annotation (Line(
          points={{-14,56},{-14,55.22},{4.44,55.22}},
          color={95,95,95},
          thickness=0.5));
      connect(fixedRotation.frame_b, rectangle.frame_a) annotation (Line(
          points={{-28,-40},{-16.2,-40},{-16.2,-25.6},{-4.4,-25.6}},
          color={95,95,95},
          thickness=0.5));
      connect(contact.Port2, rectangle.contact_a1) annotation (Line(
          points={{48,-7.54},{48,-14},{12,-14},{12,-23}},
          color={255,128,0}));
      connect(ball.contact_a,contact. Port1) annotation (Line(
          points={{25.34,55.22},{25.34,55.975},{48,55.975},{48,23.26}},
          color={255,128,0}));
    annotation (experiment(StartTime=0, StopTime=1));
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
        r_rel_a(start={0,0.03,0}, fixed=true),
        enforceStates=false)
        annotation (Placement(transformation(extent={{-44,40},{-24,60}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation(animation=false,
        n={-1,0,1},
        angle=-4)
        annotation (Placement(transformation(extent={{-44,0},{-24,20}})));
      ElementaryContactBodies.SphericalContactBody
                                                 ball(color={255,0,0}, radius=0.01)
        annotation (Placement(transformation(extent={{-4,40},{16,60}})));
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
          thickness=0.5));
      connect(fixedRotation.frame_a,world. frame_b) annotation (Line(
          points={{-44,10},{-64,10}},
          color={95,95,95},
          thickness=0.5));
      connect(freeMotion.frame_b, ball.frame_a) annotation (Line(
          points={{-24,50},{-14.1333,50},{-14.1333,50.2},{-3.6,50.2}},
          color={95,95,95},
          thickness=0.5));
      connect(fixedRotation.frame_b, circle.frame_a) annotation (Line(
          points={{-24,10},{-18,10},{-18,-2},{1.96,-2},{1.96,4.56}},
          color={95,95,95},
          thickness=0.5));
      connect(circle.contact_front1,contact. Port2) annotation (Line(
          points={{15.64,12},{30,12},{30,18.9}},
          color={255,128,0},
          thickness=1));
      connect(ball.contact_a,contact. Port1) annotation (Line(
          points={{15.4,50.2},{30.4667,50.2},{30.4667,40.9},{30,40.9}},
          color={255,128,0}));
    annotation (experiment(StartTime=0, StopTime=1));
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
        r_rel_a(start={0,0.03,0}, fixed=true),
        angles_fixed=true,
        angles_start={0,0,0})
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
          thickness=0.5));
      connect(fixedRotation.frame_a, world.frame_b) annotation (Line(
          points={{-42,-12},{-52,-12},{-52,28},{-62,28}},
          color={95,95,95},
          thickness=0.5));
      connect(freeMotion.frame_b, bodyShape.frame_a) annotation (Line(
          points={{-26,28},{-20,28}},
          color={95,95,95},
          thickness=0.5));
      connect(bodyShape.frame_b, cylinder.frame_a) annotation (Line(
          points={{-4,28},{4.2,28}},
          color={95,95,95},
          thickness=0.5));
      connect(cylinder.contact_a,contact. Port1) annotation (Line(
          points={{23.4,28},{50,28},{50,16.72}},
          color={255,128,0},
          thickness=0.5));
      connect(rectangle.contact_a,contact. Port2) annotation (Line(
          points={{21.1,-11.9},{21.1,-11.95},{50,-11.95},{50,-0.88}},
          color={255,128,0},
          thickness=0.5));
      connect(fixedRotation.frame_b, rectangle.frame_a) annotation (Line(
          points={{-22,-12},{0.2,-12}},
          color={95,95,95},
          thickness=0.5));
    annotation (experiment(StartTime=0, StopTime=1));
    end Example5;

    model Example6 "Cylinder to circle"
    extends Modelica.Icons.Example;
      inner Modelica.Mechanics.MultiBody.World world(
        enableAnimation=true,
        animateWorld=false,
        animateGravity=true)
        annotation (Placement(transformation(extent={{-82,-10},{-62,10}})));
      Modelica.Mechanics.MultiBody.Joints.FreeMotion freeMotion(animation=false,
        angles_fixed=false,
        w_rel_a_fixed=false,
        angles_start={0,0,0},
        r_rel_a(start={0.005,0.02,0}, fixed=true))
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
      IdealizedContact.ContactSurfaces.CircularPlaneContactSurface
                                                    circle(color={0,0,255},
          diameter=0.08)
        annotation (Placement(transformation(extent={{-2,-10},{18,10}})));
      IdealizedContact.ContactBlock.Contact contact(
        springCoefficient=5000,
        redeclare IdealizedContact.ContactBlock.LinearContact.CylinderToCircle
          contactDefinition "CylinderToCircle",
        mue_r=0,
        dampingCoefficient=500,
        v_e1=0.01,
        p_max=0.003,
        n1=1,
        n2=0,
        exact=false,
        f=10000,
        mue_k=0.05)
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
          thickness=0.5));
      connect(fixedRotation.frame_a,world. frame_b) annotation (Line(
          points={{-42,0},{-62,0}},
          color={95,95,95},
          thickness=0.5));
      connect(freeMotion.frame_b, cylinder.frame_a) annotation (Line(
          points={{-22,40},{-10,40},{-10,33.8},{2.4,33.8}},
          color={95,95,95},
          thickness=0.5));
      connect(cylinder.contact_lateral,contact. Port1) annotation (Line(
          points={{8,46.6},{8,64},{34,64},{34,30.9}},
          color={255,128,0},
          thickness=1));
      connect(circle.contact_a,contact. Port2) annotation (Line(
          points={{19.7,0.1},{33.85,0.1},{33.85,8.9},{34,8.9}},
          color={255,128,0},
          thickness=1));
      connect(fixedRotation.frame_b, circle.frame_a) annotation (Line(
          points={{-22,0},{-1.8,0}},
          color={95,95,95},
          thickness=0.5));
      connect(relativeSensor.frame_a, world.frame_b) annotation (Line(
          points={{78,18},{78,-24},{-52,-24},{-52,0},{-62,0}},
          color={95,95,95},
          thickness=0.5));
      connect(relativeSensor.frame_b, freeMotion.frame_b) annotation (Line(
          points={{78,38},{78,78},{-10,78},{-10,40},{-22,40}},
          color={95,95,95},
          thickness=0.5));
    annotation (experiment(StartTime=0, StopTime=1));
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
        animateWorld=true,
        animateGravity=true)
        annotation (Placement(transformation(extent={{-76,-10},{-56,10}})));
      Modelica.Mechanics.MultiBody.Joints.FreeMotion freeMotion(animation=false,
        angles_fixed=false,
        w_rel_a_fixed=false,
        r_rel_a(start={0,0.075,0}, fixed=true),
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
        dampingCoefficient=10000000.,
        v_e1=1.e-004,
        p_max=0.005,
        f=10000,
        exact=true)
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
          thickness=0.5));
      connect(fixedRotation.frame_a,world. frame_b) annotation (Line(
          points={{-36,0},{-56,0}},
          color={95,95,95},
          thickness=0.5));
      connect(fixedRotation.frame_b, rectangle1.frame_a) annotation (Line(
          points={{-16,0},{4.2,0}},
          color={95,95,95},
          thickness=0.5));
      connect(freeMotion.frame_b, bodyShape1.frame_a) annotation (Line(
          points={{-22,40},{-18,40}},
          color={95,95,95},
          thickness=0.5));
      connect(bodyShape1.frame_b, rectangle.frame_a) annotation (Line(
          points={{2,40},{10.2,40}},
          color={95,95,95},
          thickness=0.5));
      connect(relativePosition.frame_a, world.frame_b) annotation (Line(
          points={{72,14},{72,-24},{-46,-24},{-46,0},{-56,0}},
          color={95,95,95},
          thickness=0.5));
      connect(relativePosition.frame_b, bodyShape1.frame_a) annotation (Line(
          points={{72,34},{72,64},{-20,64},{-20,40},{-18,40}},
          color={95,95,95},
          thickness=0.5));
      connect(rectangle1.contact_a,contact. Port2) annotation (Line(
          points={{25.1,0.1},{39.55,0.1},{39.55,9.01},{39,9.01}},
          color={255,128,0}));
      connect(rectangle.contact_a,contact. Port1) annotation (Line(
          points={{31.1,40.1},{31.1,40.05},{39,40.05},{39,28.81}},
          color={255,128,0}));
    annotation (experiment(StartTime=0, StopTime=1));
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
        r_rel_a(start={0,0.025,0}, fixed=true),
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
          thickness=0.5));
      connect(freeMotion.frame_a, world.frame_b)  annotation (Line(
          points={{-44,30},{-64,30}},
          color={95,95,95},
          thickness=0.5));
      connect(fixedRotation.frame_b,body2. frame_a) annotation (Line(
          points={{-24,-10},{-16,-10}},
          color={95,95,95},
          thickness=0.5));
      connect(freeMotion.frame_b, body1.frame_a) annotation (Line(
          points={{-24,30},{-14,30}},
          color={95,95,95},
          thickness=0.5));
      connect(rectangle.contact_a,contact. Port2) annotation (Line(
          points={{31.1,-9.9},{45.55,-9.9},{45.55,-1.1},{46,-1.1}},
          color={255,128,0}));
      connect(circle.contact_a,contact. Port1) annotation (Line(
          points={{31.7,30.1},{46.85,30.1},{46.85,20.9},{46,20.9}},
          color={255,128,0}));
      connect(body1.frame_b, circle.frame_a) annotation (Line(
          points={{2,30},{10.2,30}},
          color={95,95,95},
          thickness=0.5));
      connect(body2.frame_b, rectangle.frame_a) annotation (Line(
          points={{0,-10},{10.2,-10}},
          color={95,95,95},
          thickness=0.5));
    annotation (experiment(StartTime=0, StopTime=1));
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
        r_rel_a(start={0,0.1,0}, fixed=true))
        annotation (Placement(transformation(extent={{-48,50},{-28,70}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation(animation=false,
        n={0,0,1},
        angle=-15)
        annotation (Placement(transformation(extent={{-52,-50},{-32,-30}})));
      ElementaryContactBodies.SphericalContactBody
                                                 ball(color={255,0,0})
        annotation (Placement(transformation(extent={{-6,50},{18,74}})));
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
          thickness=0.5));
      connect(fixedRotation.frame_a,world. frame_b) annotation (Line(
          points={{-52,-40},{-60,-40},{-60,10},{-72,10}},
          color={95,95,95},
          thickness=0.5));
      connect(freeMotion.frame_b, ball.frame_a) annotation (Line(
          points={{-28,60},{-20.8889,60},{-20.8889,62.24},{-5.52,62.24}},
          color={95,95,95},
          thickness=0.5));
      connect(rectangle.contact_a, contact2.Port2)
                                                  annotation (Line(
          points={{44.2,-5.8},{44,-6},{66,-6},{66,24.68}},
          color={255,128,0}));
      connect(rectangle1.contact_a,contact1. Port2) annotation (Line(
          points={{72.2,-71.8},{72.2,-72.9},{84,-72.9},{84,-39.32}},
          color={255,128,0}));
      connect(fixedRotation1.frame_b, rectangle1.frame_a) annotation (Line(
          points={{16,-72},{30.4,-72}},
          color={95,95,95},
          thickness=0.5));
      connect(fixedRotation1.frame_a, world.frame_b) annotation (Line(
          points={{-4,-72},{-60,-72},{-60,10},{-72,10}},
          color={95,95,95},
          thickness=0.5));
      connect(fixedRotation.frame_b, rectangle.frame_a) annotation (Line(
          points={{-32,-40},{-16,-40},{-16,-6},{2.4,-6}},
          color={95,95,95},
          thickness=0.5));
      connect(ball.contact_a, contact2.Port1)
                                             annotation (Line(
          points={{17.28,62.24},{67.1111,62.24},{67.1111,51.08},{66,51.08}},
          color={255,128,0}));
      connect(ball.contact_a,contact1. Port1) annotation (Line(
          points={{17.28,62.24},{17.28,62.825},{84,62.825},{84,-12.92}},
          color={255,128,0}));
    annotation (experiment(StartTime=0, StopTime=1));
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
        r_rel_a(start={0,0.03,0.005}, fixed=true),
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
          thickness=0.5));
      connect(fixedRotation.frame_a,world. frame_b) annotation (Line(
          points={{-20,-10},{-60,-10}},
          color={95,95,95},
          thickness=0.5));
      connect(freeMotion.frame_b,bodyShape. frame_a) annotation (Line(
          points={{-20,30},{-12,30}},
          color={95,95,95},
          thickness=0.5));
      connect(cylindricalContactSurface.frame_a, bodyShape.frame_b) annotation (
         Line(
          points={{12.2,30},{4,30}},
          color={95,95,95},
          thickness=0.5));
      connect(cylindricalContactSurface1.frame_a, fixedRotation.frame_b)
        annotation (Line(
          points={{12.2,-10},{0,-10}},
          color={95,95,95},
          thickness=0.5));
      connect(cylindricalContactSurface.contact_a, contact.Port1) annotation (
          Line(
          points={{31.4,30},{50,30},{50,20.9}},
          color={255,128,0}));
      connect(cylindricalContactSurface1.contact_a, contact.Port2) annotation (
          Line(
          points={{31.4,-10},{50,-10},{50,-1.1}},
          color={255,128,0}));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=true,  extent={{-100,
                -100},{100,100}}),
                          graphics={Text(
              extent={{-36,94},{40,52}},
              lineColor={255,0,0},
              textStyle={TextStyle.Bold},
              textString="The collision of two cylinders can lead to linear or punctiform contact regions.
The calculation for these two cases is currently seperated in two blocks.
Integration of the two blocks is in progress.")}));
    annotation (experiment(StartTime=0, StopTime=1));
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
        r_rel_a(start={0,0.1,-0.01}, fixed=true))
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
          thickness=0.5));
      connect(fixedRotation.frame_a,world. frame_b) annotation (Line(
          points={{-50,-10},{-70,-10}},
          color={95,95,95},
          thickness=0.5));
      connect(freeMotion.frame_b, bodyShape.frame_a) annotation (Line(
          points={{-36,30},{-30,30}},
          color={95,95,95},
          thickness=0.5));
      connect(bodyShape.frame_b, cylinder.frame_a) annotation (Line(
          points={{-14,30},{-9.8,30}},
          color={95,95,95},
          thickness=0.5));
      connect(fixedRotation.frame_b, cylinder1.frame_a) annotation (Line(
          points={{-30,-10},{-9.8,-10}},
          color={95,95,95},
          thickness=0.5));
      connect(cylinder.contact_a,contact. Port1) annotation (Line(
          points={{9.4,30},{38,30},{38,20.9}},
          color={255,128,0}));
      connect(cylinder1.contact_a,contact. Port2) annotation (Line(
          points={{9.4,-10},{38,-10},{38,-1.1}},
          color={255,128,0}));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),
                          graphics={Text(
              extent={{-44,84},{32,42}},
              lineColor={255,0,0},
              textStyle={TextStyle.Bold},
              textString="The collision of two cylinders can lead to linear or punctiform contact regions.
The calculation for these two cases is currently seperated in two blocks.
Integration of the two blocks is in progress.")}));
    annotation (experiment(StartTime=0, StopTime=1));
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
        r_rel_a(start={0,0.03,0.005}, fixed=true),
        w_rel_a_fixed=false,
      angles_start={0.17453292519943,0.5235987755983,0})
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
          thickness=0.5));
      connect(fixedRotation.frame_a,world. frame_b) annotation (Line(
          points={{-20,-10},{-60,-10}},
          color={95,95,95},
          thickness=0.5));
      connect(freeMotion.frame_b,bodyShape. frame_a) annotation (Line(
          points={{-20,30},{-12,30}},
          color={95,95,95},
          thickness=0.5));
      connect(cylindricalContactSurface.frame_a, bodyShape.frame_b) annotation (
         Line(
          points={{12.2,30},{4,30}},
          color={95,95,95},
          thickness=0.5));
      connect(cylindricalContactSurface1.frame_a, fixedRotation.frame_b)
        annotation (Line(
          points={{12.2,-10},{0,-10}},
          color={95,95,95},
          thickness=0.5));
      connect(cylindricalContactSurface.contact_a, contact.Port1) annotation (
          Line(
          points={{31.4,30},{50,30},{50,20.9}},
          color={255,128,0}));
      connect(cylindricalContactSurface1.contact_a, contact.Port2) annotation (
          Line(
          points={{31.4,-10},{50,-10},{50,-1.1}},
          color={255,128,0}));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=true,  extent={{-100,
                -100},{100,100}}),
                          graphics={Text(
              extent={{-36,94},{40,52}},
              lineColor={255,0,0},
              textStyle={TextStyle.Bold},
              textString="The collision of two cylinders can lead to linear or punctiform contact regions.
The calculation for these two cases is currently seperated in two blocks.
Integration of the two blocks is in progress.")}));
    annotation (experiment(StartTime=0, StopTime=1));
    end Example12;
   annotation(preferredView="info", Documentation(info="<!DOCTYPE html><html>
<p>This package includes examples for the use of the IdelaizedContact library.</p>
</html>"));
  end Examples;


  package ContactSurfaces
  extends Modelica.Icons.Package;

    model SphericalContactSurface "Model to define a spherical contact surface"

      import SI = Modelica.SIunits;
    parameter SI.Radius radius=0.015 "radius of the spherical contact surface";
    parameter Boolean animation=true "= true, if animation shall be enabled";
    parameter Boolean animation_BCS = true
      "= true, if animation of body coordinate system shall be enabled";

    parameter Modelica.Mechanics.MultiBody.Types.Color color={255,128,0}
      "color of the contact surface";

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
            origin={-18,34})));

      Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a
      "Coordinate system fixed to the component with one cut-force and cut-torque"
        annotation (Placement(transformation(extent={{-122,-14},{-78,30}}),
            iconTransformation(extent={{-90,-16},{-58,16}})));
      Modelica.Blocks.Routing.Multiplex4 multiplex(
        n1=3,
        n2=3,
        n3=3,
        n4=3) annotation (Placement(transformation(extent={{-16,62},{0,78}})));
      Interfaces.Contact_a                                    contact_a
        annotation (Placement(transformation(extent={{90,-2},{110,18}}),
            iconTransformation(extent={{68,-16},{98,16}})));
      Modelica.Mechanics.MultiBody.Visualizers.FixedFrame fixedFrame(
        color_x=color,
        color_y=color,
        color_z=color,
        animation=animation_BCS,
        length=3*radius)
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-50,-30})));
  public
      Modelica.Mechanics.MultiBody.Parts.Body       body(
        r_CM={0,0,0},
        I_11=0,
        I_22=0,
        I_33=0,
        animation=false,
        m=0)
      "To avoid errors when no external body is connected to the surface model"
        annotation (Placement(transformation(extent={{-2,-40},{18,-20}})));
    equation
      multiplex.u1={0,0,0};
      multiplex.u2={0,0,0};
      multiplex.u3={0,0,0};
      multiplex.u4=radius*{1,0,0};

      connect(shape.frame_a, frame_a)      annotation (Line(
          points={{-18,22},{-18,8},{-100,8}},
          color={95,95,95},
          thickness=0.5));
      connect(shape.frame_a, contact_a.frame)     annotation (Line(
          points={{-18,22},{-18,8},{100,8}},
          color={95,95,95},
          thickness=0.5));
      connect(shape.frame_a, fixedFrame.frame_a)     annotation (Line(
          points={{-18,22},{-18,-30},{-40,-30}},
          color={95,95,95},
          thickness=0.5));
      connect(multiplex.y, contact_a.u) annotation (Line(
          points={{0.8,70},{8,70},{8,8},{100,8}},
          color={0,0,127},
          thickness=0.5));
      connect(fixedFrame.frame_a, body.frame_a) annotation (Line(
          points={{-40,-30},{-2,-30}},
          color={95,95,95},
          thickness=0.5));
      annotation (Documentation(info="<!DOCTYPE html><html>
<p>The surface definition represents a thin and massless layer, which can be connected to any kind of rigid body by a frame connector. The dimensions can be parameterized. In order to be able to use them in the contact block we introduce a new interface to connect the surface definition with the contact block of this library. This adds a scalar vector to the MultiBody frame of the Modelica Standard Library. It comprises maximum three terms to describe the surface geometry and the three direction vectors to resolve them in the connected frame. The latter constitutes the body coordinate system of the contact surface. This model defines a spherical contact surface.</p>
</html>"),        Icon(graphics={
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
              pattern=LinePattern.Solid,
              lineThickness=1,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-5,-55},{6,-66}},
              pattern=LinePattern.Solid,
              lineThickness=1,
              fillColor={0,176,0},
              fillPattern=FillPattern.Solid,
              lineColor={0,176,0})}));
    end SphericalContactSurface;

    model CylindricalContactSurface
    "Model to define a cylindrical contact surface"
      import SI = Modelica.SIunits;
    parameter SI.Diameter diameter=0.015 "diameter of cylindrical surface";
    parameter SI.Length length=0.05 "length of cylindrical surface";
    parameter Modelica.Mechanics.MultiBody.Types.Axis diameterDirection={0,0,1}
      "unit vector in diameter direction";
    parameter Modelica.Mechanics.MultiBody.Types.Axis lengthDirection={1,0,0}
      "unit vector in length direction";
    final parameter Modelica.Mechanics.MultiBody.Types.Axis heightDirection=abs(cross(diameterDirection,lengthDirection));
    parameter Boolean animation=true "= true, if animation shall be enabled";
    parameter Boolean animation_BCS = true
      "= true, if animation of body coordinate system shall be enabled";

    parameter Modelica.Mechanics.MultiBody.Types.Color color={255,128,0}
      "color of the contact surface";

    constant Real pi=Modelica.Constants.pi;

      Modelica.Mechanics.MultiBody.Visualizers.FixedShape shape(
        shapeType="cylinder",
        width=diameter,
        color=color,
        lengthDirection=lengthDirection,
        widthDirection=diameterDirection,
        length=length,
        r_shape=-length/2*lengthDirection,
        height=diameter,
        animation=animation)
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-18,28})));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a
      "Coordinate system fixed to the component with one cut-force and cut-torque"
        annotation (Placement(transformation(extent={{-114,-16},{-82,16}}),
            iconTransformation(extent={{-114,-16},{-82,16}})));
      Modelica.Mechanics.MultiBody.Visualizers.FixedFrame fixedFrame(
        color_x=color,
        color_y=color,
        color_z=color,
        animation=animation_BCS,
        length=2*diameter)
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-44,-24})));

      Interfaces.Contact_a                                    contact_a
        annotation (Placement(transformation(extent={{96,-10},{116,10}}),
            iconTransformation(extent={{78,-16},{110,16}})));
      Modelica.Blocks.Routing.Multiplex4 multiplex(
        n1=3,
        n2=3,
        n3=3,
        n4=3) annotation (Placement(transformation(extent={{-16,48},{0,64}})));
  protected
      final Modelica.Mechanics.MultiBody.Parts.Body body(
        r_CM={0,0,0},
        m=0,
        I_11=0,
        I_22=0,
        I_33=0,
        animation=false)
      "To avoid errors when no external body is connected to the surface model"
        annotation (Placement(transformation(extent={{10,-34},{30,-14}})));
    equation
      multiplex.u1=lengthDirection;
      multiplex.u2=diameterDirection;
      multiplex.u3=heightDirection;
      multiplex.u4={diameter/2,length/2,0};

      connect(shape.frame_a, frame_a)      annotation (Line(
          points={{-18,18},{-18,0},{-98,0}},
          color={95,95,95},
          thickness=0.5));
      connect(multiplex.y,contact_a. u) annotation (Line(
          points={{0.8,56},{20,56},{20,0},{106,0}},
          color={0,0,127}));
      connect(shape.frame_a,contact_a. frame) annotation (Line(
          points={{-18,18},{-18,0},{106,0}},
          color={95,95,95},
          thickness=0.5));
      connect(shape.frame_a, fixedFrame.frame_a) annotation (Line(
          points={{-18,18},{-18,-24},{-34,-24}},
          color={95,95,95},
          thickness=0.5));
      connect(shape.frame_a, body.frame_a) annotation (Line(
          points={{-18,18},{-18,-24},{10,-24}},
          color={95,95,95},
          thickness=0.5));
      annotation ( Icon(graphics={
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
            Text(
              extent={{-100,-80},{102,-100}},
              lineColor={255,128,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%name"),
            Ellipse(
              extent={{-69,-57},{-63,-63}},
              pattern=LinePattern.Solid,
              lineThickness=1,
              fillColor={0,176,0},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,0}),
            Ellipse(
              extent={{55,-57},{61,-63}},
              pattern=LinePattern.Solid,
              lineThickness=1,
              fillColor={0,176,0},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,0}),
            Ellipse(
              extent={{-11,5},{0,-6}},
              pattern=LinePattern.Solid,
              lineThickness=1,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{53,-55},{64,-66}},
              pattern=LinePattern.Solid,
              lineThickness=1,
              fillColor={0,176,0},
              fillPattern=FillPattern.Solid,
              lineColor={0,176,0}),
            Ellipse(
              extent={{-73,-53},{-62,-64}},
              pattern=LinePattern.Solid,
              lineThickness=1,
              fillColor={0,176,0},
              fillPattern=FillPattern.Solid,
              lineColor={0,176,0})}),
        Documentation(info="<!DOCTYPE html><html>
<p>The surface definition represents a thin and massless layer, which can be connected to any kind of rigid body by a frame connector. The dimensions can be parameterized. In order to be able to use them in the contact block we introduce a new interface to connect the surface definition with the contact block of this library. This adds a scalar vector to the MultiBody frame of the Modelica Standard Library. It comprises maximum three terms to describe the surface geometry and the three direction vectors to resolve them in the connected frame. The latter constitutes the body coordinate system of the contact surface. This model defines a cylindrical skin surface.</p>
</html>"));
    end CylindricalContactSurface;

    model RectangularPlaneContactSurface
    "Model to define a rectangular and plane contact surface"
      import SI = Modelica.SIunits;

    parameter SI.Length length=0.04;
    parameter SI.Length width=0.02;
    final parameter SI.Length height=0.001;
    parameter Modelica.Mechanics.MultiBody.Types.Axis lengthDirection={1,0,0};
    parameter Modelica.Mechanics.MultiBody.Types.Axis widthDirection={0,0,1};
    final parameter Modelica.Mechanics.MultiBody.Types.Axis heightDirection=abs(cross(lengthDirection,widthDirection));

    parameter Boolean animation_BCS = true
      "= true, if animation of body coordinate system shall be enabled";
    parameter Boolean animation=true "= true, if animation shall be enabled";
    parameter Modelica.Mechanics.MultiBody.Types.Color color={255,128,0}
      "color of the contact surface";
    constant Real pi=Modelica.Constants.pi;

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
            origin={-14,18})));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a "center of mass"
        annotation (Placement(transformation(extent={{-114,-16},{-82,16}}),
            iconTransformation(extent={{-114,-16},{-82,16}})));
      Modelica.Mechanics.MultiBody.Visualizers.FixedFrame fixedFrame(
        color_x=color,
        color_y=color,
        color_z=color,
        animation=animation_BCS,
        length=2*length)
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-36,-26})));

      Interfaces.Contact_a                                    contact_a
        annotation (Placement(transformation(extent={{96,-10},{116,10}}),
            iconTransformation(extent={{96,-14},{126,16}})));
      Modelica.Blocks.Routing.Multiplex4 multiplex(
        n1=3,
        n2=3,
        n3=3,
        n4=3) annotation (Placement(transformation(extent={{-16,34},{0,50}})));
  protected
      final Modelica.Mechanics.MultiBody.Parts.Body body(
        r_CM={0,0,0},
        m=0,
        I_11=0,
        I_22=0,
        I_33=0,
        animation=false)
      "To avoid errors when no external body is connected to the surface model"
        annotation (Placement(transformation(extent={{10,-36},{30,-16}})));
    equation
      multiplex.u1=lengthDirection;
      multiplex.u2=widthDirection;
      multiplex.u3=heightDirection;
      multiplex.u4=length*{1,0,0}+width*{0,1,0}+height*{0,0,1};

      connect(shape.frame_a, frame_a)      annotation (Line(
          points={{-14,8},{-14,0},{-98,0}},
          color={95,95,95},
          thickness=0.5));
      connect(multiplex.y,contact_a. u) annotation (Line(
          points={{0.8,42},{20,42},{20,0},{106,0}},
          color={0,0,127}));
      connect(shape.frame_a, fixedFrame.frame_a) annotation (Line(
          points={{-14,8},{-14,-26},{-26,-26}},
          color={95,95,95},
          thickness=0.5));
      connect(shape.frame_a,contact_a. frame) annotation (Line(
          points={{-14,8},{-14,0},{106,0}},
          color={95,95,95},
          thickness=0.5));
      connect(shape.frame_a, body.frame_a) annotation (Line(
          points={{-14,8},{-14,-26},{10,-26}},
          color={95,95,95},
          thickness=0.5));
      annotation ( Icon(graphics={
            Text(
              extent={{-100,-80},{102,-100}},
              lineColor={255,128,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%name"),
            Line(
              points={{-60,60},{-100,-60},{60,-60},{100,60},{-44,60},{-60,60}},
              thickness=0.5),
            Ellipse(
              extent={{55,-55},{66,-66}},
              pattern=LinePattern.Solid,
              lineThickness=1,
              fillColor={0,176,0},
              fillPattern=FillPattern.Solid,
              lineColor={0,176,0}),
            Ellipse(
              extent={{-105,-55},{-94,-66}},
              pattern=LinePattern.Solid,
              lineThickness=1,
              fillColor={0,176,0},
              fillPattern=FillPattern.Solid,
              lineColor={0,176,0}),
            Ellipse(
              extent={{-65,65},{-54,54}},
              pattern=LinePattern.Solid,
              lineThickness=1,
              fillColor={0,176,0},
              fillPattern=FillPattern.Solid,
              lineColor={0,176,0}),
            Ellipse(
              extent={{95,65},{106,54}},
              pattern=LinePattern.Solid,
              lineThickness=1,
              fillColor={0,176,0},
              fillPattern=FillPattern.Solid,
              lineColor={0,176,0}),
            Ellipse(
              extent={{-5,5},{6,-6}},
              pattern=LinePattern.Solid,
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
      import SI = Modelica.SIunits;
    parameter SI.Diameter diameter=0.015;
    parameter Modelica.Mechanics.MultiBody.Types.Axis lengthDirection={0,1,0}
      "Length Direction";
    parameter Modelica.Mechanics.MultiBody.Types.Axis diameterDirection={0,0,1};
    parameter Boolean animation = true "= true, if animation shall be enabled";
    parameter Boolean animation_BCS = true
      "= true, if animation of body coordinate system shall be enabled";
    parameter Modelica.Mechanics.MultiBody.Types.Color color={255,128,0}
      "color of the contact surface";

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
            origin={-20,22})));

      Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a
      "Coordinate system fixed to the component with one cut-force and cut-torque"
        annotation (Placement(transformation(extent={{-114,-16},{-82,16}}),
            iconTransformation(extent={{-114,-16},{-82,16}})));
      Modelica.Mechanics.MultiBody.Visualizers.FixedFrame fixedFrame(
        color_x=color,
        color_y=color,
        color_z=color,
        animation=animation_BCS,
        length=2*diameter)
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-46,-34})));
      Interfaces.Contact_a                                    contact_a
        annotation (Placement(transformation(extent={{96,-10},{116,10}}),
            iconTransformation(extent={{102,-14},{132,16}})));
      Modelica.Blocks.Routing.Multiplex4 multiplex(
        n1=3,
        n2=3,
        n3=3,
        n4=3) annotation (Placement(transformation(extent={{-16,42},{0,58}})));
  protected
      final Modelica.Mechanics.MultiBody.Parts.Body body(
        r_CM={0,0,0},
        m=0,
        I_11=0,
        I_22=0,
        I_33=0,
        animation=false)
      "To avoid errors when no external body is connected to the surface model"
        annotation (Placement(transformation(extent={{12,-44},{32,-24}})));
    equation
      multiplex.u1=lengthDirection;
      multiplex.u2=diameterDirection;
      multiplex.u3=diameterDirection2;
      multiplex.u4={diameter/2,0,0};
      connect(cylinder.frame_a, frame_a)   annotation (Line(
          points={{-20,12},{-20,0},{-98,0}},
          color={95,95,95},
          thickness=0.5));
      connect(multiplex.y,contact_a. u) annotation (Line(
          points={{0.8,50},{26,50},{26,0},{106,0}},
          color={0,0,127}));
      connect(cylinder.frame_a, fixedFrame.frame_a)  annotation (Line(
          points={{-20,12},{-20,-34},{-36,-34}},
          color={95,95,95},
          thickness=0.5));
      connect(cylinder.frame_a, body.frame_a)  annotation (Line(
          points={{-20,12},{-20,-34},{12,-34}},
          color={95,95,95},
          thickness=0.5));
      connect(cylinder.frame_a, contact_a.frame)  annotation (Line(
          points={{-20,12},{-20,0},{106,0}},
          color={95,95,95},
          thickness=0.5));
      annotation (Icon(graphics={
            Ellipse(
              extent={{-94,48},{96,-52}},
              lineColor={0,0,0},
              lineThickness=0.5),
            Ellipse(
              extent={{-5,5},{6,-6}},
              pattern=LinePattern.Solid,
              lineThickness=1,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,0}),
            Ellipse(
              extent={{-100,5},{-89,-6}},
              pattern=LinePattern.Solid,
              lineThickness=1,
              fillColor={0,176,0},
              fillPattern=FillPattern.Solid,
              lineColor={0,176,0}),
            Ellipse(
              extent={{-5,53},{6,42}},
              pattern=LinePattern.Solid,
              lineThickness=1,
              fillColor={0,176,0},
              fillPattern=FillPattern.Solid,
              lineColor={0,176,0}),
            Ellipse(
              extent={{-5,-47},{6,-58}},
              pattern=LinePattern.Solid,
              lineThickness=1,
              fillColor={0,176,0},
              fillPattern=FillPattern.Solid,
              lineColor={0,176,0}),
            Ellipse(
              extent={{91,5},{102,-6}},
              pattern=LinePattern.Solid,
              lineThickness=1,
              fillColor={0,176,0},
              fillPattern=FillPattern.Solid,
              lineColor={0,176,0}),
            Text(
              extent={{-100,-80},{102,-100}},
              lineColor={255,128,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%name")}),
        Documentation(info="<!DOCTYPE html><html>
<p>The surface definition represents a thin and massless layer, which can be connected to any kind of rigid body by a frame connector. The dimensions can be parameterized. In order to be able to use them in the contact block we introduce a new interface to connect the surface definition with the contact block of this library. This adds a scalar vector to the MultiBody frame of the Modelica Standard Library. It comprises maximum three terms to describe the surface geometry and the three direction vectors to resolve them in the connected frame. The latter constitutes the body coordinate system of the contact surface. This model defines a circular, plane contact surface.</p>
</html>"));
    end CircularPlaneContactSurface;
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
     annotation (Placement(transformation(extent={{-42,-18},{10,34}})));

      Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a "center of mass"
        annotation (Placement(transformation(extent={{-102,-14},{-58,30}}),
            iconTransformation(extent={{-112,-14},{-80,18}})));
      Interfaces.Contact_a                    contact_a
        annotation (Placement(transformation(extent={{90,-2},{110,18}}),
            iconTransformation(extent={{78,-14},{110,18}})));
      IdealizedContact.ContactSurfaces.SphericalContactSurface
                                sphericalContactSurface(
        animation=animation,
        radius=radius,
        color=color,
        animation_BCS=animation_BCS)
        annotation (Placement(transformation(extent={{16,-20},{70,36}})));
    equation

      connect(sphericalBody.frame_a, frame_a)
                                           annotation (Line(
          points={{-42,8},{-80,8}},
          color={95,95,95},
          thickness=0.5));
      connect(sphericalContactSurface.contact_a,contact_a)  annotation (Line(
          points={{65.41,8},{100,8}},
          color={255,128,0}));

      connect(sphericalBody.frame_b, sphericalContactSurface.frame_a)
        annotation (Line(
          points={{10,8},{23.02,8}},
          color={95,95,95},
          thickness=0.5));
      annotation (Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
              preserveAspectRatio=false)),
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
      "= true, if lateral contact surface shall be enabled"   annotation (choices(__Dymola_checkBox=true));
    parameter Boolean enableFrontSurface1 = true
      "= true, if first front contact surface shall be enabled"   annotation (choices(__Dymola_checkBox=true));
    parameter Boolean enableFrontSurface2 = true
      "= true, if second front contact surface shall be enabled"   annotation (choices(__Dymola_checkBox=true));
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
            origin={-10,-62}),
            iconTransformation(extent={{-16,-16},{16,16}},
            rotation=90,
            origin={-56,-62})));

      Interfaces.Contact_a contact_lateral if enableLateralSurface  annotation (Placement(transformation(extent={{-14,88},{6,108}}),
            iconTransformation(extent={{-10,56},{10,76}})));
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
          points={{-2,0},{-10,0},{-10,-62}},
          color={95,95,95},
          thickness=0.5));
      connect(cylindricalBody.frame_b, cylindricalContactSurface.frame_a)
        annotation (Line(
          points={{18,0},{24,0},{24,22},{-42,22},{-42,44},{-35.78,44}},
          color={95,95,95},
          thickness=0.5));
      connect(cylindricalContactSurface.contact_a, contact_lateral)
                                                              annotation (Line(
          points={{-14.66,44},{-4,44},{-4,98}},
          color={255,128,0}));
      connect(circularPlaneContactSurface1.contact_a, contact_front1)
                                                                     annotation (
          Line(
          points={{81.7,0.1},{86,0.1},{86,0},{102,0}},
          color={255,128,0}));
      connect(cylindricalBody.frame_b, fixedTranslation1.frame_a)
                                                                 annotation (Line(
          points={{18,0},{32,0}},
          color={95,95,95},
          thickness=0.5));
      connect(fixedTranslation1.frame_b, circularPlaneContactSurface1.frame_a)
        annotation (Line(
          points={{52,0},{60.2,0}},
          color={95,95,95},
          thickness=0.5));
      connect(fixedTranslation2.frame_b, cylindricalBody.frame_a) annotation (Line(
          points={{-18,0},{-2,0}},
          color={95,95,95},
          thickness=0.5));
      connect(circularPlaneContactSurface2.frame_a,fixedTranslation2. frame_a)
        annotation (Line(
          points={{-56.2,-1.20015e-015},{-50,-1.20015e-015},{-50,0},{-38,0}},
          color={95,95,95},
          thickness=0.5));
      connect(circularPlaneContactSurface2.contact_a, contact_front2) annotation (
          Line(
          points={{-77.7,-0.1},{-87.85,-0.1},{-87.85,0},{-100,0}},
          color={255,128,0}));
      annotation (Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
              preserveAspectRatio=false)), Icon(coordinateSystem(extent={{-100,-100},
              {100,100}},  preserveAspectRatio=false),
                                          graphics={
            Ellipse(
              extent={{-90,66},{-62,-60}},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.Solid,
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
              pattern=LinePattern.Solid,
              lineColor={0,0,0}),
            Ellipse(
              extent={{58,66},{86,-60}},
              fillColor={0,0,143},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.Solid)}),
        Documentation(info="<!DOCTYPE html><html>
<p>This model defines a cylindrical body that can collide with every surface. Contact surfaces can be enabled seperately. The enumeration corresponds to the chosen directions and dimensions and is displayed in the Figure.</p>
<p><br/><br/><img src=\"modelica://IdealizedContact/Resources/Images/cylindricalContactBody.png\"/></p>
</html>"));
    end CylindricalContactBody;

    model CuboidContactBody "Predefined cuboid body with contact surfaces"
      import SI = Modelica.SIunits;

    parameter Boolean enableSurface1 = true
      "= true, if contact surface 1 shall be enabled"   annotation (choices(__Dymola_checkBox=true));
    parameter Boolean enableSurface2 = true
      "= true, if contact surface 2 shall be enabled"   annotation (choices(__Dymola_checkBox=true));
        parameter Boolean enableSurface3 = true
      "= true, if contact surface 3 shall be enabled"   annotation (choices(__Dymola_checkBox=true));
    parameter Boolean enableSurface4 = true
      "= true, if contact surface 4 shall be enabled"   annotation (choices(__Dymola_checkBox=true));
    parameter Boolean enableSurface5 = true
      "= true, if contact surface 5 shall be enabled"   annotation (choices(__Dymola_checkBox=true));
    parameter Boolean enableSurface6 = true
      "= true, if contact surface 6 shall be enabled"   annotation (choices(__Dymola_checkBox=true));

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
            /2*heightDirection)              annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={0,24})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation    fixedTranslation1(r=-(
            height)/2*heightDirection,
        n=lengthDirection,
        angle=180)                           annotation (Placement(transformation(
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
            origin={58,0})));
      Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation2(r=(length)
            /2*lengthDirection)              annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            origin={24,0})));
      Interfaces.Contact_a contact_a3 if enableSurface3 annotation (Placement(transformation(extent={{72,-10},
                {92,10}}),       iconTransformation(extent={{72,-10},{92,10}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation    fixedTranslation3(r=-(
            length)/2*lengthDirection,
        n=heightDirection,
        angle=180)                           annotation (Placement(transformation(
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
            /2*widthDirection)               annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            origin={38,38})));
      Interfaces.Contact_a contact_a5 if enableSurface5 annotation (Placement(transformation(extent={{52,82},
                {72,102}}),       iconTransformation(extent={{52,82},{72,102}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation    fixedTranslation4(r=-(width)
            /2*widthDirection,
        n=heightDirection,
        angle=180)                           annotation (Placement(transformation(
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
          thickness=0.5));
      connect(rectangularPlaneContactSurface1.contact_a, contact_a1)
                                                                   annotation (Line(
          points={{-0.1,69.1},{-0.45,69.1},{-0.45,98},{0,98}},
          color={255,128,0}));
      connect(bodyShape.frame_b, fixedTranslation.frame_a) annotation (Line(
          points={{-8,0},{-6.12323e-016,0},{-6.12323e-016,14}},
          color={95,95,95},
          thickness=0.5));
      connect(fixedTranslation.frame_b, rectangularPlaneContactSurface1.frame_a)
        annotation (Line(
          points={{6.12323e-016,34},{6.12323e-016,38},{0,38},{0,42},{-6.00077e-016,
              42},{-6.00077e-016,48.2}},
          color={95,95,95},
          thickness=0.5));
      connect(rectangularPlaneContactSurface2.contact_a,contact_a2)  annotation (
          Line(
          points={{-21.9,-53.1},{-21.9,-54},{-22,-54},{-22,-66}},
          color={255,128,0}));
      connect(fixedTranslation2.frame_a, bodyShape.frame_b) annotation (Line(
          points={{14,0},{-8,0}},
          color={95,95,95},
          thickness=0.5));
      connect(rectangularPlaneContactSurface3.contact_a,contact_a3)  annotation (
          Line(
          points={{69.1,0.1},{86,0},{82,0}},
          color={255,128,0}));
      connect(rectangularPlaneContactSurface3.frame_a, fixedTranslation2.frame_b)
        annotation (Line(
          points={{48.2,0},{34,0}},
          color={95,95,95},
          thickness=0.5));
      connect(fixedTranslation3.frame_a, bodyShape.frame_a) annotation (Line(
          points={{-42,-1.22465e-015},{-36,-1.22465e-015},{-36,0},{-28,0}},
          color={95,95,95},
          thickness=0.5));
      connect(rectangularPlaneContactSurface4.frame_a, fixedTranslation3.frame_b)
        annotation (Line(
          points={{-70.2,-1.20015e-015},{-67.1,-1.20015e-015},{-67.1,1.22465e-015},
              {-62,1.22465e-015}},
          color={95,95,95},
          thickness=0.5));
      connect(rectangularPlaneContactSurface4.contact_a,contact_a4)  annotation (
          Line(
          points={{-91.1,-0.1},{-96,0},{-102,0}},
          color={255,128,0}));
      connect(fixedTranslation5.frame_b,rectangularPlaneContactSurface5. frame_a)
        annotation (Line(
          points={{48,38},{62,38},{62,58.2}},
          color={95,95,95},
          thickness=0.5));
      connect(fixedTranslation5.frame_a, bodyShape.frame_b) annotation (Line(
          points={{28,38},{20,38},{20,16},{8,16},{8,0},{-8,0}},
          color={95,95,95},
          thickness=0.5));
      connect(rectangularPlaneContactSurface5.contact_a,contact_a5)  annotation (
          Line(
          points={{61.9,79.1},{62.95,79.1},{62.95,92},{62,92}},
          color={255,128,0}));
      connect(rectangularPlaneContactSurface6.frame_a, fixedTranslation4.frame_b)
        annotation (Line(
          points={{-66,-42.2},{-66,-38},{-46,-38},{-46,-32}},
          color={95,95,95},
          thickness=0.5));
      connect(fixedTranslation4.frame_a, bodyShape.frame_a) annotation (Line(
          points={{-46,-12},{-46,-10},{-36,-10},{-36,0},{-28,0}},
          color={95,95,95},
          thickness=0.5));
      connect(rectangularPlaneContactSurface6.contact_a,contact_a6)  annotation (
          Line(
          points={{-65.9,-63.1},{-83.95,-63.1},{-83.95,-68},{-82,-68}},
          color={255,128,0}));
      connect(bodyShape.frame_b, fixedTranslation1.frame_a) annotation (Line(
          points={{-8,0},{1.83697e-015,0},{1.83697e-015,-6}},
          color={95,95,95},
          thickness=0.5));
      connect(fixedTranslation1.frame_b,rectangularPlaneContactSurface2. frame_a)
        annotation (Line(
          points={{-1.83697e-015,-26},{-22,-26},{-22,-32.2}},
          color={95,95,95},
          thickness=0.5));
      connect(contact_a5,contact_a5)  annotation (Line(
          points={{62,92},{62,92}},
          color={255,128,0}));
      annotation ( Icon(coordinateSystem(preserveAspectRatio=false,
                       extent={{-100,-100},{100,100}}),
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
              fillPattern=FillPattern.Solid,
              fillColor={0,0,255}),
            Polygon(
              points={{-80,42},{-60,82},{60,82},{40,42},{-80,42}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={0,0,255}),
            Polygon(
              points={{-80,42},{-60,82},{-80,42}},
              lineColor={0,0,255})}),
        Documentation(
          info="<!DOCTYPE html><html>
<p>This model defines a cuboid body that can collide with every surface. Contact surfaces can be enabled seperately. The enumeration corresponds to the chosen directions and dimensions and is displayed in the Figure.</p>
<p><br/><br/><img src=\"modelica://IdealizedContact/Resources/Images/cuboidContactBody.png\"/></p>
</html>"));
    end CuboidContactBody;
   annotation(preferredView="info", Documentation(info="<!DOCTYPE html><html>
<p>This package includes predefined elementary bodies with contact surfaces.</p>
</html>"));
  end ElementaryContactBodies;


  package ContactBlock
  extends Modelica.Icons.Package;
    model Contact
      import SI = Modelica.SIunits;
      inner parameter SI.TranslationalSpringConstant springCoefficient=1000000
      "spring coefficient to calculate normal force"   annotation(Dialog(group="Normal force"));
      inner parameter SI.TranslationalDampingConstant dampingCoefficient=100000
      "damper coefficient to calculate normal force"   annotation(Dialog(group="Normal force"));
      inner parameter Real n1 = 1.5 "stiffness exponent" annotation(Dialog(group="Normal force"));
      inner parameter Real n2 = n1 "indentation exponent" annotation(Dialog(group="Normal force"));
      //formula to determine normal force: fn=c*p^n1+d*p^n2*der(p)   p: penetration
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

      inner parameter Real gamma1=(mue_s-tanh(2*v_e1/v_e2)*gamma4-k_v*2*v_e1)/(tanh(2*v_e1/v_e1)-tanh(2*v_e1/v_e2))-gamma4
      "friction parameter 1"                                                                                                     annotation(Dialog(tab="Friction model"));
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

      replaceable
      IdealizedContact.ContactBlock.PunctiformContact.SphereToRectangle           contactDefinition
        constrainedby IdealizedContact.Components.PartialContactBlock
      "select contact surface combination (first surface mentioned must be connected to port 1)"
        annotation (Placement(transformation(extent={{-14,-24},{44,34}})),  choices(
              choice(redeclare
            IdealizedContact.ContactBlock.PunctiformContact.SphereToRectangle                                     contactDefinition
            "SphereToRectangle"),
              choice(redeclare
            IdealizedContact.ContactBlock.PunctiformContact.SphereToCircle
              contactDefinition "SphereToCircle"),
              choice(redeclare
            IdealizedContact.ContactBlock.PunctiformContact.SphereToCylinder                                      contactDefinition
            "SphereToCylinder"),
              choice(redeclare
            IdealizedContact.ContactBlock.PunctiformContact.SphereToSphere
              contactDefinition "SphereToSphere"),
              choice(redeclare
            IdealizedContact.ContactBlock.LinearContact.CylinderToRectangle
              contactDefinition "CylinderToRectangle"),
              choice(redeclare
            IdealizedContact.ContactBlock.LinearContact.CylinderToCircle                                          contactDefinition
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
            IdealizedContact.ContactBlock.PlanarContact.CircleToRectangle                                         contactDefinition
            "CircleToRectangle")),
                Dialog(group="Contact specification"));
      IdealizedContact.Interfaces.Contact_b Port1
        annotation (Placement(transformation(extent={{2,60},{22,80}}),
            iconTransformation(extent={{-20,90},{20,128}})));
      IdealizedContact.Interfaces.Contact_b Port2
        annotation (Placement(transformation(extent={{8,-86},{28,-66}}),
            iconTransformation(extent={{-20,-130},{20,-92}})));

    equation
      connect(contactDefinition.frame_a, Port1.frame)
                                                 annotation (Line(
          points={{-14.58,22.4},{-42,22.4},{-42,52},{12,52},{12,70}},
          color={95,95,95},
          thickness=0.5));
      connect(contactDefinition.frame_b, Port2.frame)
                                                annotation (Line(
          points={{-14.58,-12.4},{-38,-12.4},{-38,-60},{18,-60},{18,-76}},
          color={95,95,95},
          thickness=0.5));
      connect(Port1.u, contactDefinition.vector_1)
                                             annotation (Line(
          points={{12,70},{12,52},{-52,52},{-52,7.9},{-16.32,7.9}},
          color={255,128,0}));
      connect(contactDefinition.vector_2, Port2.u)
                                             annotation (Line(
          points={{-16.32,-3.7},{-50,-3.7},{-50,-60},{18,-60},{18,-76}},
          color={255,128,0}));
        annotation (Placement(transformation(extent={{-20,0},{0,20}})),
      Icon(graphics={
          Rectangle(
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
<p>Then, the contact block calculates the appropriate force depending on the combination of surfaces. So, using it the respective combination of contact surface has to be chosen at first by setting the parameter contactDefinition. This will use the Modelica replaceable statement to define the appropiate components of the contact block. Then connect the contact interfaces of the two contact surfaces to the respective port of the contact block (first&nbsp;surface&nbsp;mentioned&nbsp;must&nbsp;be&nbsp;connected&nbsp;to&nbsp;port&nbsp;1).</p>
<p>In the case of a collision of the two connected surface (the contact condition holds for at least one contact point) a three-dimensional contact force is applied. It consists of both the normal force and the tangential friction. The respective directions can be obtained by means of the local coordinate systems in the contact points. As compared to more complex models, the continuous surface layer is replaced by a nonlinear spring/damper element. Consequently, the normal force Fn&nbsp;is determined by means of the penetration p&nbsp;and the penetration velocity. A continuous contact force model with hysteresis damping according to [1] is implemented. Nevertheless, choosing n1=1 and n=0&nbsp;one can get the linear Kelvin-Voigt model, where the coefficients are the spring and damping constant. Choosing n1=n2&nbsp;one will get the formulation according to [2].</p>
<p><img src=\"modelica://IdealizedContact/Resources/Images/equations/Fn.jpg\"/></p>
<p><br/>In order to calculate the friction forces without further discontinuous events, which would decrease the simulation speed and impede controller design, we use the continuously differentiable friction model of Makkar et al. [3]. They introduced the following function of the relative velocity&nbsp;to approximate the friction coefficient&nbsp;of the characteristic Stribeck curve.</p>
<p><img src=\"modelica://IdealizedContact/Resources/Images/equations/mue.jpg\"/></p>
<p>In doing so, no ideal static friction can be obtained because the actual force to be applied in the static state is independent from the relative velocity&nbsp;of the two bodies. Static friction is rather represented by sliding with very small relative velocities. To set the unknown constants gamma_i we use five parameters, which can be seen in the figure. The parameters mue_s&nbsp;and mue_k&nbsp;denote the coefficients of static and kinetic friction. The limit velocity v_e1&nbsp;and v_e2&nbsp;define the beginning of mixed and viscous friction. The latter is described by the proportionality factor k_v. The actual approximation can be monitored by calling the function <a href=\"IdealizedContact.ContactBlock.plotFrictionCurve\">plotFrictionCurve</a>.</p>
<p><br/><br/><img src=\"modelica://IdealizedContact/Resources/Images/mue.jpg\"/></p>
<p><br/>The complete vector of the contact force is then computed as follows.</p>
<p><img src=\"modelica://IdealizedContact/Resources/Images/equations/Fcontact.jpg\"/></p>
<p><b>Note:</b> The collision of two cylinders can lead to linear or punctiform contact regions. The calculation for these two cases is currently seperated in two blocks. Integration of the two blocks is in progress.</p>
<h4>References:</h4>
<p><br/>[1]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; H. M. Lankarani, P. E. Nikravesh: Continuous Contact Force Models for Impact Analysis in Multibody Systems, Nonlinear Dynamics, 5, 1994 </p>
<p>[2]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; K. H. Hunt, F. R. E. Crossley: Coefficient of restitution interpreted as damping in vibroimpact, ASME J. Appl. Mech, 1975 </p>
<p>[3]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; C. Makkar, W. E. Dixon, W. G. Sawyer, G. Hu: A New Continuously Differentiable Friction Model for Control Systems Design, Proceedings of the 2005 IEEE/ASME International Conference on Advanced Intelligent Mechatronics, Monterey CA, July, 2005</p>
</html>"));
    end Contact;

    function plotFrictionCurve
      import SI = Modelica.SIunits;
    input SI.CoefficientOfFriction mue_k=0.03 "coefficient of kinetic friction"
                                          annotation(Dialog(group="Stribeck curve"));
    input SI.CoefficientOfFriction mue_s=0.04 "coefficient of static friction"
                                         annotation(Dialog(group="Stribeck curve"));
    input Real k_v( unit="s2/m")=0 "gradient of viscous friction" annotation(Dialog(group="Stribeck curve"));
    input SI.Velocity v_e1=0.01 "limit velocity of static friction" annotation(Dialog(group="Stribeck curve"));
    input SI.Velocity v_e2=0.1 "limit velocity of kinetic friction" annotation(Dialog(group="Stribeck curve"));

    input Real gamma1=(mue_s-tanh(2*v_e1/v_e2)*gamma4-k_v*2*v_e1)/(tanh(2*v_e1/v_e1)-tanh(2*v_e1/v_e2))-gamma4
      "friction parameter 1"                                                                                                     annotation(Dialog(tab="Friction model"));
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

    package PunctiformContact
      model SphereToSphere
       extends IdealizedContact.Components.PartialContactBlock;
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
        outer parameter Boolean animation;
        outer parameter Modelica.SIunits.Radius radiusContactPoint;
        outer parameter Modelica.Mechanics.MultiBody.Types.Color
          colorContactPoints1;
        outer parameter Modelica.Mechanics.MultiBody.Types.Color
          colorContactPoints2;

    protected
        parameter Real N1 = if n1==0 then Modelica.Constants.eps else n1;   //to avoid mathematical error in case of 0^0
        parameter Real N2 = if n2==0 then Modelica.Constants.eps else n2;
    public
        IdealizedContact.ContactBlock.PunctiformContact.Components.MovePointSphereToSphere
          move_point_sphere_spherel(
          f=f,
          colorContactPoint_Ball1=colorContactPoints1,
          colorContactPoint_Ball2=colorContactPoints2,
          radiusContactPoint=radiusContactPoint, Animation=animation)
          annotation (Placement(transformation(extent={{-60,20},{-20,60}})));
        IdealizedContact.ContactBlock.PunctiformContact.Components.ForceSphereToSphere
          force_sphere_sphere(
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
          mue_r=mue_r)
          annotation (Placement(transformation(extent={{0,-40},{40,0}})));

      equation
        connect(force_sphere_sphere.frame_a2, move_point_sphere_spherel.frame_b2)
                                                                         annotation (
            Line(
            points={{12,0},{12,28},{-19.6,28}},
            color={95,95,95},
            thickness=0.5));
        connect(move_point_sphere_spherel.frame_b1, force_sphere_sphere.frame_a1)
                                                                         annotation (
            Line(
            points={{-19.6,52},{24,52},{24,0}},
            color={95,95,95},
            thickness=0.5));
        connect(move_point_sphere_spherel.frame_a1, frame_a)
                                                        annotation (Line(
            points={{-60.4,52},{-80,52},{-80,60},{-102,60}},
            color={95,95,95},
            thickness=0.5));
        connect(move_point_sphere_spherel.frame_a2, frame_b)
                                                        annotation (Line(
            points={{-60.4,28},{-68,28},{-68,-60},{-102,-60}},
            color={95,95,95},
            thickness=0.5));
        connect(move_point_sphere_spherel.vector_ball1, vector_1)
                                                             annotation (Line(
            points={{-61.6,42},{-84,42},{-84,10},{-108,10}},
            color={0,0,127}));
        connect(move_point_sphere_spherel.vector_ball2, vector_2)
                                                             annotation (Line(
            points={{-61.6,34},{-78,34},{-78,-30},{-108,-30}},
            color={0,0,127}));
        connect(force_sphere_sphere.Vector_ball1, vector_1)
                                                        annotation (Line(
            points={{-1.6,-28},{-84,-28},{-84,10},{-108,10}},
            color={0,0,127}));
        connect(force_sphere_sphere.vector_ball2, vector_2)
                                                        annotation (Line(
            points={{-1.6,-36},{-78,-36},{-78,-30},{-108,-30}},
            color={0,0,127}));
        connect(force_sphere_sphere.w_mov2, move_point_sphere_spherel.w2)
          annotation (Line(
            points={{-1.6,-1.6},{-25.8,-1.6},{-25.8,18},{-25.2,18}},
            color={0,0,127}));
        connect(force_sphere_sphere.w_mov1, move_point_sphere_spherel.w1)
          annotation (Line(
            points={{-1.6,-9.2},{-36,-9.2},{-36,18}},
            color={0,0,127}));
        connect(force_sphere_sphere.pos_rel_BCS1, move_point_sphere_spherel.pos_rel2)
          annotation (Line(
            points={{-1.6,-16},{-44,-16},{-44,18}},
            color={0,0,127}));
        connect(force_sphere_sphere.pos_rel_BCS2, move_point_sphere_spherel.pos_rel1)
          annotation (Line(
            points={{-1.6,-22},{-50.8,-22},{-50.8,18}},
            color={0,0,127}));
        annotation (Icon(graphics={                   Rectangle(extent={{-100,
                    100},{100,-100}},
                                 lineColor={255,128,0}), Text(
                extent={{-82,10},{82,-10}},
                lineColor={0,0,255},
                textString="Ball-Ball")}));
      end SphereToSphere;
    extends Modelica.Icons.Package;
      model SphereToCylinder
        extends IdealizedContact.Components.PartialContactBlock;
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
        outer parameter Boolean animation;
        outer parameter Modelica.SIunits.Radius radiusContactPoint;
        outer parameter Modelica.Mechanics.MultiBody.Types.Color
          colorContactPoints1;
        outer parameter Modelica.Mechanics.MultiBody.Types.Color
          colorContactPoints2;

    protected
        parameter Real N1 = if n1==0 then Modelica.Constants.eps else n1; //to avoid mathematical error in case of 0^0
        parameter Real N2 = if n2==0 then Modelica.Constants.eps else n2;

    public
        IdealizedContact.ContactBlock.PunctiformContact.Components.MovePointSphereToCylinder
                                            move_point_ball_cylinder(
          f=f,
          Animation=animation,
          radiusContactPoint=radiusContactPoint,
          colorContactPoints1=colorContactPoints1,
          Color_contact_point_cylinder=colorContactPoints2)
          annotation (Placement(transformation(extent={{-60,20},{-20,60}})));
        IdealizedContact.ContactBlock.PunctiformContact.Components.ForceSphereToCylinder
                                       force_ball_cylinder(
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
          mue_r=mue_r)
          annotation (Placement(transformation(extent={{-10,-40},{30,0}})));
      equation
        connect(move_point_ball_cylinder.frame_b1,force_ball_cylinder. frame_a1)
          annotation (Line(
            points={{-19.6,28},{2,28},{2,0.4}},
            color={95,95,95},
            thickness=0.5));
        connect(move_point_ball_cylinder.frame_b2,force_ball_cylinder. frame_a2)
          annotation (Line(
            points={{-19.6,52},{18,52},{18,0.4}},
            color={95,95,95},
            thickness=0.5));
        connect(move_point_ball_cylinder.frame_a2, frame_a) annotation (Line(
            points={{-60.4,52},{-80.2,52},{-80.2,60},{-102,60}},
            color={95,95,95},
            thickness=0.5));
        connect(frame_b, move_point_ball_cylinder.frame_a1) annotation (Line(
            points={{-102,-60},{-68,-60},{-68,28},{-60.4,28}},
            color={95,95,95},
            thickness=0.5));
        connect(vector_1, move_point_ball_cylinder.Vector_ball) annotation (
            Line(
            points={{-108,10},{-86,10},{-86,44},{-61.6,44}},
            color={0,0,127}));
        connect(vector_2, move_point_ball_cylinder.vector_cy) annotation (Line(
            points={{-108,-30},{-80,-30},{-80,36},{-61.6,36}},
            color={0,0,127}));
        connect(force_ball_cylinder.Vector_ball, vector_1) annotation (Line(
            points={{-11.6,-32},{-86,-32},{-86,10},{-108,10}},
            color={0,0,127}));
        connect(force_ball_cylinder.vector_cy, vector_2) annotation (Line(
            points={{-11.6,-40},{-80,-40},{-80,-30},{-108,-30}},
            color={0,0,127}));
        connect(force_ball_cylinder.pos_ctb_BCS1, move_point_ball_cylinder.pos_ctb_BCS1)
          annotation (Line(
            points={{-11.6,0},{-24,0},{-24,18}},
            color={0,0,127}));
        connect(force_ball_cylinder.pos_ctb_BCS4, move_point_ball_cylinder.pos_ctb_BCS4)
          annotation (Line(
            points={{-11.6,-6},{-32,-6},{-32,18}},
            color={0,0,127}));
        connect(force_ball_cylinder.pos_b_BCSA, move_point_ball_cylinder.pos_b_BCSA)
          annotation (Line(
            points={{-11.6,-12.8},{-40,-12.8},{-40,18}},
            color={0,0,127}));
        connect(force_ball_cylinder.w_mov1, move_point_ball_cylinder.w_mov1)
          annotation (Line(
            points={{-11.6,-20},{-48,-20},{-48,18}},
            color={0,0,127}));
        connect(force_ball_cylinder.w_mov2, move_point_ball_cylinder.w_mov2)
          annotation (Line(
            points={{-11.6,-26},{-56,-26},{-56,18}},
            color={0,0,127}));
        annotation ( Icon(graphics={Rectangle(extent={{-100,100},{100,
                    -100}},      lineColor={255,128,0}), Text(
                extent={{-82,10},{82,-10}},
                lineColor={0,0,255},
                textString="Ball-Cylinder")}));
      end SphereToCylinder;

      model SphereToRectangle
        extends IdealizedContact.Components.PartialContactBlock;
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
        outer parameter Boolean animation;
        outer parameter Modelica.SIunits.Radius radiusContactPoint;

        outer parameter Modelica.Mechanics.MultiBody.Types.Color
          colorContactPoints1;
        outer parameter Modelica.Mechanics.MultiBody.Types.Color
          colorContactPoints2;

    protected
        parameter Real N1 = if n1==0 then Modelica.Constants.eps else n1;//to avoid mathematical error in case of 0^0
        parameter Real N2 = if n2==0 then Modelica.Constants.eps else n2;

    public
        Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_b
        "from center of rectangle"
          annotation (Placement(transformation(extent={{-118,-76},{-86,-44}}),
              iconTransformation(extent={{-118,-76},{-86,-44}})));
        Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a
        "center of ball mass"
          annotation (Placement(transformation(extent={{-118,44},{-86,76}})));
        IdealizedContact.ContactBlock.PunctiformContact.Components.MovePointSphereToRectangle
                                         move_point_ball_plane(
          f=f,
          Animation=animation,
          radiusContactPoint=radiusContactPoint,
          colorContactPoints1=colorContactPoints1,
          Color_contact_point_rectangle=colorContactPoints2)
          annotation (Placement(transformation(extent={{-60,20},{-20,60}})));
        IdealizedContact.ContactBlock.PunctiformContact.Components.ForceSphereToRectangle
                                        force_ball_rectangle(
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
          mue_r=mue_r)
          annotation (Placement(transformation(extent={{-20,-40},{20,0}})));
      equation
        connect(move_point_ball_plane.frame_b1,force_ball_rectangle. frame_a1)
          annotation (Line(
            points={{-19.6,28},{-12,28},{-12,0.4}},
            color={95,95,95},
            thickness=0.5));
        connect(move_point_ball_plane.frame_b2,force_ball_rectangle. frame_a2)
          annotation (Line(
            points={{-19.6,52},{3.55271e-016,52},{3.55271e-016,0.4}},
            color={95,95,95},
            thickness=0.5));
        connect(frame_a, move_point_ball_plane.frame_a2)
                                                      annotation (Line(
            points={{-102,60},{-82,60},{-82,52},{-60.4,52}},
            color={95,95,95},
            thickness=0.5));
        connect(move_point_ball_plane.frame_a1, frame_b)   annotation (Line(
            points={{-60.4,28},{-66,28},{-66,-60},{-102,-60}},
            color={95,95,95},
            thickness=0.5));
        connect(vector_2, force_ball_rectangle.vector_r) annotation (Line(
            points={{-108,-30},{-80,-30},{-80,-38.8},{-21.6,-38.8}},
            color={0,0,127}));
        connect(vector_2, move_point_ball_plane.vector_r) annotation (Line(
            points={{-108,-30},{-80,-30},{-80,34},{-61.6,34}},
            color={0,0,127}));
        connect(vector_1, move_point_ball_plane.Vector_ball) annotation (Line(
            points={{-108,10},{-86,10},{-86,42},{-61.6,42}},
            color={0,0,127}));
        connect(vector_1, force_ball_rectangle.vector_ball) annotation (Line(
            points={{-108,10},{-86,10},{-86,-30.8},{-21.6,-30.8}},
            color={0,0,127}));
        connect(move_point_ball_plane.pos_rel_mb_BCS2, force_ball_rectangle.r_rel1)
          annotation (Line(
            points={{-18.4,40},{9.6,40},{9.6,1.6}},
            color={0,0,127}));
        connect(force_ball_rectangle.w_mov, move_point_ball_plane.w)
          annotation (Line(
            points={{-21.6,-24},{-48,-24},{-48,18.4}},
            color={0,0,127}));
        connect(force_ball_rectangle.pos_ctb_BCS1, move_point_ball_plane.pos_ctb_BCS1)
          annotation (Line(
            points={{-21.6,-16},{-32,-16},{-32,18.4}},
            color={0,0,127}));
        connect(force_ball_rectangle.pos_rel, move_point_ball_plane.pos_rel)
          annotation (Line(
            points={{-21.6,-9.2},{-21.6,-3.6},{-24,-3.6},{-24,18.4}},
            color={0,0,127}));
        annotation ( Icon(graphics={Rectangle(extent={{-100,100},{100,
                    -100}},      lineColor={255,128,0}), Text(
                extent={{-82,10},{82,-10}},
                lineColor={0,0,255},
                textString="Ball-Rectangle")}));
      end SphereToRectangle;

      model SphereToCircle
        extends IdealizedContact.Components.PartialContactBlock;
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
        outer parameter Boolean animation;
        outer parameter Modelica.SIunits.Radius radiusContactPoint;
        outer parameter Modelica.Mechanics.MultiBody.Types.Color
          colorContactPoints1;
        outer parameter Modelica.Mechanics.MultiBody.Types.Color
          colorContactPoints2;

    protected
        parameter Real N1 = if n1==0 then Modelica.Constants.eps else n1;//to avoid mathematical error in case of 0^0
        parameter Real N2 = if n2==0 then Modelica.Constants.eps else n2;

    public
        IdealizedContact.ContactBlock.PunctiformContact.Components.MovePointSphereToCircle
                                          move_point_ball_circle(
          f=f,
          Animation=animation,
          radiusContactPoint=radiusContactPoint,
          colorContactPoints1=colorContactPoints1,
          Color_contact_point_circle=colorContactPoints2)
          annotation (Placement(transformation(extent={{-40,20},{0,60}})));
        IdealizedContact.ContactBlock.PunctiformContact.Components.ForceSphereToCircle
                                     force_ball_circle(
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
          mue_r=mue_r)
          annotation (Placement(transformation(extent={{0,-40},{40,0}})));
        Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_b
        "center of circle"
          annotation (Placement(transformation(extent={{-118,-76},{-86,-44}})));
        Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a
        "frame center of ball mass"
          annotation (Placement(transformation(extent={{-118,44},{-86,76}})));
      equation
        connect(move_point_ball_circle.frame_a2, frame_a)
                                                       annotation (Line(
            points={{-40.4,52},{-72,52},{-72,60},{-102,60}},
            color={95,95,95},
            thickness=0.5));
        connect(move_point_ball_circle.frame_a1, frame_b)
                                                         annotation (Line(
            points={{-40.4,28},{-70,28},{-70,-60},{-102,-60}},
            color={95,95,95},
            thickness=0.5));
        connect(move_point_ball_circle.frame_b1, force_ball_circle.frame_a1)
          annotation (Line(
            points={{0.4,28},{8,28},{8,0.4}},
            color={95,95,95},
            thickness=0.5));
        connect(move_point_ball_circle.frame_b2, force_ball_circle.frame_a2)
          annotation (Line(
            points={{0.4,52},{20,52},{20,0.4}},
            color={95,95,95},
            thickness=0.5));
        connect(vector_1, move_point_ball_circle.Vector_ball) annotation (Line(
            points={{-108,10},{-85,10},{-85,42},{-41.6,42}},
            color={0,0,127}));
        connect(vector_1, force_ball_circle.vector_ball) annotation (Line(
            points={{-108,10},{-84,10},{-84,-30.8},{-1.6,-30.8}},
            color={0,0,127}));
        connect(vector_2, force_ball_circle.vector_c) annotation (Line(
            points={{-108,-30},{-56,-30},{-56,-38.8},{-1.6,-38.8}},
            color={0,0,127}));
        connect(vector_2, move_point_ball_circle.vector_circle) annotation (
            Line(
            points={{-108,-30},{-56,-30},{-56,34},{-41.6,34}},
            color={0,0,127}));
        connect(move_point_ball_circle.pos_rel_mb_BCS2, force_ball_circle.r_rel)
          annotation (Line(
            points={{2,40},{28,40},{28,1.6}},
            color={0,0,127}));
        connect(force_ball_circle.pos_rel, move_point_ball_circle.pos_rel)
          annotation (Line(
            points={{-1.6,-9.2},{-2,-9.2},{-2,18.4},{-4,18.4}},
            color={0,0,127}));
        connect(force_ball_circle.pos_ctb_BCS1, move_point_ball_circle.pos_ctb_BCS1)
          annotation (Line(
            points={{-1.6,-16},{-12,-16},{-12,18.4}},
            color={0,0,127}));
        connect(force_ball_circle.w_mov, move_point_ball_circle.w) annotation (
            Line(
            points={{-1.6,-22.8},{-28,-22.8},{-28,18.4}},
            color={0,0,127}));
        annotation ( Icon(graphics={Rectangle(extent={{-100,100},{100,
                    -100}},      lineColor={255,128,0}), Text(
                extent={{-82,10},{82,-10}},
                lineColor={0,0,255},
                textString="Ball-Circle")}));
      end SphereToCircle;

      package Components
      extends Modelica.Icons.BasesPackage;
        model MovePointSphereToSphere
          parameter Modelica.SIunits.Frequency f=100000;
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
                origin={-108,10})));
          Modelica.Blocks.Interfaces.RealInput vector_ball2[12] "radius ball"
                                                               annotation (
              Placement(transformation(
                extent={{-8,-8},{8,8}},
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
          "absolut anglulat velocity contact point ball1 resolved in BCS1"
            annotation (Placement(transformation(extent={{-6,-6},{6,6}},
                rotation=270,
                origin={20,0})));
          Modelica.Blocks.Interfaces.RealOutput w1[3]
          "absolut anglulat velocity contact point ball1 resolved in BCS1"
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
          "absolut anglulat velocity contact point ball2 resolved in BCS2"
            annotation (Placement(transformation(extent={{-6,-6},{6,6}},
                rotation=270,
                origin={74,-80})));
          Modelica.Blocks.Interfaces.RealOutput w2[3]
          "absolut anglulat velocity contact point ball2 resolved in BCS2"
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
              thickness=0.5));
          connect(rP_ball1_ball2.frame_a, frame_a2) annotation (Line(
              points={{-60,-6},{-60,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_ball2_ball1.frame_a, frame_a1) annotation (Line(
              points={{-14,6},{-14,60},{-102,60}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_ball2_ball1.frame_b, frame_a2) annotation (Line(
              points={{-14,-6},{-14,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(contact_point_ball1.frame_a, frame_b1)
                                                     annotation (Line(
              points={{102,82},{102,60}},
              color={95,95,95},
              thickness=0.5));
          connect(contact_point_ball2.frame_a, frame_b2)
                                                      annotation (Line(
              points={{102,-38},{102,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_ball1_ball2.r_rel, pos_rel1) annotation (Line(
              points={{-53.4,-4.04133e-016},{-54,-4.04133e-016},{-54,-110}},
              color={0,0,127}));
          connect(aAV.w, w1)
                            annotation (Line(
              points={{20,-6.6},{20,-110}},
              color={0,0,127}));
          connect(variablePrism1.frame_b, frame_b1) annotation (Line(
              points={{60,60},{102,60}},
              color={95,95,95},
              thickness=0.5));
          connect(variablePrism1.frame_a, frame_a1) annotation (Line(
              points={{40,60},{-102,60}},
              color={95,95,95},
              thickness=0.5));
          connect(variablePrism2.frame_b, frame_b2) annotation (Line(
              points={{60,-60},{102,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(variablePrism2.frame_a, frame_a2) annotation (Line(
              points={{40,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(vector_ball1, deMultiplex1.u) annotation (Line(
              points={{-108,10},{-93.2,10}},
              color={0,0,127}));
          connect(deMultiplex3.u, vector_ball2) annotation (Line(
              points={{-93.2,-30},{-108,-30}},
              color={0,0,127}));
          connect(aAV1.frame_a, variablePrism2.frame_b) annotation (Line(
              points={{74,-74},{74,-60},{60,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(aAV1.frame_resolve, frame_a2) annotation (Line(
              points={{67.94,-80},{-80,-80},{-80,-60},{-102,-60}},
              color={95,95,95},
              pattern=LinePattern.Dot));
          connect(aAV1.w, w2) annotation (Line(
              points={{74,-86.6},{74,-110}},
              color={0,0,127}));
          connect(rP_ball2_ball1.r_rel, pos_rel2) annotation (Line(
              points={{-20.6,1.2124e-015},{-20.6,-53},{-20,-53},{-20,-110}},
              color={0,0,127}));
          connect(aAV.frame_a, variablePrism1.frame_b) annotation (Line(
              points={{20,6},{60,6},{60,60}},
              color={95,95,95},
              thickness=0.5));
          connect(aAV.frame_resolve, frame_a1) annotation (Line(
              points={{13.94,1.1132e-015},{13.94,60},{-102,60}},
              color={95,95,95},
              pattern=LinePattern.Dot));
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
                origin={-108,-40})));
          Modelica.Blocks.Interfaces.RealInput vector_ball2[12] "radius ball"
                                                               annotation (
              Placement(transformation(
                extent={{-8,-8},{8,8}},
                origin={-108,-80})));
      public
          Modelica.Mechanics.MultiBody.Forces.Force force(resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a,
              animation=false) "Force resolved in BCS4 in contact point2"
            annotation (Placement(transformation(
                extent={{-6,-6},{6,6}},
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
                origin={-10,60})));
          Modelica.Blocks.Interfaces.RealInput pos_rel_BCS2[3]
          "relative position center of ball1 resolved in BCS2"
            annotation (Placement(transformation(extent={{-116,-18},{-100,-2}})));
          Modelica.Blocks.Interfaces.RealInput w_mov1[3]
          "absolut anglulat velocity contact point ball1 resolved in BCS1"
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

          Boolean contact;

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
          "absolut anglular velocity cantact point ball2 resolved in BCS2"
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
              thickness=0.5));
          connect(frame_a1,force. frame_b) annotation (Line(
              points={{20,100},{20,80},{-4,80}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_mp_1_2.frame_a, frame_a2) annotation (Line(
              points={{-16,60},{-40,60},{-40,100}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_mp_1_2.frame_b, frame_a1) annotation (Line(
              points={{-4,60},{20,60},{20,100}},
              color={95,95,95},
              thickness=0.5));
          connect(deMultiplex1.u, Vector_ball1) annotation (Line(
              points={{-93.2,-40},{-108,-40}},
              color={0,0,127}));
          connect(deMultiplex3.u, vector_ball2) annotation (Line(
              points={{-93.2,-80},{-108,-80}},
              color={0,0,127}));
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
                rotation=90)));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b1
          "contact point on cylinder surface BCS4 based on BCS2"
            annotation (Placement(transformation(extent={{86,-76},{118,-44}})));
          Modelica.Blocks.Interfaces.RealInput Vector_ball[12] "radius ball"
                                                               annotation (
              Placement(transformation(
                extent={{-8,-8},{8,8}},
                origin={-108,20})));
          Modelica.Blocks.Interfaces.RealInput vector_cy[12]
          "length/width direction and R L"                     annotation (
              Placement(transformation(
                extent={{-8,-8},{8,8}},
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
              thickness=0.5));
          connect(frame_a1, rP_b_cy.frame_a) annotation (Line(
              points={{-102,-60},{-66,-60},{-66,-6}},
              color={95,95,95},
              thickness=0.5));
          connect(frame_a2,rP_b_cyA. frame_b) annotation (Line(
              points={{-102,60},{3.67394e-016,60},{3.67394e-016,6}},
              color={95,95,95},
              thickness=0.5));
          connect(contact_point_ball.frame_a, frame_b2)
                                                     annotation (Line(
              points={{102,26},{102,60}},
              color={95,95,95},
              thickness=0.5));
          connect(contact_point_cylinder.frame_a, frame_b1)
                                                         annotation (Line(
              points={{102,-32},{102,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_cy_b.frame_a, frame_a2) annotation (Line(
              points={{40,6},{40,60},{-102,60}},
              color={95,95,95},
              thickness=0.5));
          connect(variablePrism_ball1.frame_b, frame_b2) annotation (Line(
              points={{66,60},{102,60}},
              color={95,95,95},
              thickness=0.5));
          connect(variablePrism_ball1.frame_a, frame_a2) annotation (Line(
              points={{46,60},{-102,60}},
              color={95,95,95},
              thickness=0.5));
          connect(variablePrism_ball1.frame_b, rP_mpb_mpcy.frame_b) annotation (
              Line(
              points={{66,60},{80,60},{80,6}},
              color={95,95,95},
              thickness=0.5));
          connect(variablePrism_cy1.frame_a, frame_a1) annotation (Line(
              points={{-56,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(variablePrism_cy1.frame_b,rP_b_cyA. frame_a) annotation (Line(
              points={{-36,-60},{-3.67394e-016,-60},{-3.67394e-016,-6}},
              color={95,95,95},
              thickness=0.5));
          connect(variablePrism_cy2.frame_b, frame_b1) annotation (Line(
              points={{30,-60},{102,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(variablePrism_cy2.frame_a, variablePrism_cy1.frame_b)
            annotation (Line(
              points={{10,-60},{-36,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_mpb_mpcy.frame_a, variablePrism_cy2.frame_b) annotation (
              Line(
              points={{80,-6},{80,-60},{30,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(deMultiplex1.u, Vector_ball) annotation (Line(
              points={{-97.2,20},{-108,20}},
              color={0,0,127}));
          connect(deMultiplex2.u, vector_cy) annotation (Line(
              points={{-97.2,-20},{-108,-20}},
              color={0,0,127}));
          connect(rP_cy_b.frame_b, variablePrism_cy2.frame_b) annotation (Line(
              points={{40,-6},{40,-60},{30,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(aAV2.frame_a, variablePrism_cy2.frame_b) annotation (Line(
              points={{40,-74},{40,-60},{30,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_ct_BCS1.frame_a, frame_a2) annotation (Line(
              points={{-60,80},{-80,80},{-80,60},{-102,60}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_ct_BCS1.frame_b, variablePrism_ball1.frame_b) annotation (Line(
              points={{-48,80},{80,80},{80,60},{66,60}},
              color={95,95,95},
              thickness=0.5));
          connect(aAV2.frame_resolve, variablePrism_cy1.frame_b) annotation (Line(
              points={{33.94,-80},{-30,-80},{-30,-60},{-36,-60}},
              color={95,95,95},
              pattern=LinePattern.Dot));
          connect(aAV1.frame_a, variablePrism_ball1.frame_b) annotation (Line(
              points={{-24,6},{-24,30},{66,30},{66,60}},
              color={95,95,95},
              thickness=0.5));
          connect(aAV1.frame_resolve, frame_a2) annotation (Line(
              points={{-30.06,1.1132e-015},{-38.03,1.1132e-015},{-38.03,60},{
                  -102,60}},
              color={95,95,95},
              pattern=LinePattern.Dot));
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
                origin={0,80})));
          Modelica.Blocks.Interfaces.RealInput pos_ctb_BCS4[3]
          "relative position contact point ball resolved in BCS4 contact point on cylinder Surface"
                                                               annotation (
              Placement(transformation(
                extent={{-8,-8},{8,8}},
                origin={-108,70})));
          Modelica.Blocks.Interfaces.RealInput pos_b_BCSA[3]
          "relative position center of ball mass resolved in BCSA"
                                                               annotation (
              Placement(transformation(
                extent={{-8,-8},{8,8}},
                origin={-108,36})));
          Modelica.Blocks.Interfaces.RealInput Vector_ball[12] "radius ball"
                                                               annotation (
              Placement(transformation(
                extent={{-8,-8},{8,8}},
                origin={-108,-60})));
          Modelica.Blocks.Interfaces.RealInput vector_cy[12]
          "length/width direction and R L"                     annotation (
              Placement(transformation(
                extent={{-8,-8},{8,8}},
                origin={-108,-100})));
          Modelica.Blocks.Interfaces.RealInput w_mov1[3]
          "absolut anglular velocity contact point ball resolved in BCS1"
                                                               annotation (
              Placement(transformation(
                extent={{-8,-8},{8,8}},
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

          Boolean contact;

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
                origin={-108,-30})));
          Modelica.Blocks.Interfaces.RealInput pos_ctb_BCS1[3]
          "relative position contact point on ball surface resolved in BCS1"
                                                               annotation (
              Placement(transformation(
                extent={{-8,-8},{8,8}},
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
              thickness=0.5));
          connect(force.frame_b, frame_a2) annotation (Line(
              points={{6,80},{40,80},{40,102}},
              color={95,95,95},
              thickness=0.5));
          connect(Vector_ball, deMultiplex1.u) annotation (Line(
              points={{-108,-60},{-93.2,-60}},
              color={0,0,127}));
          connect(vector_cy, deMultiplex2.u) annotation (Line(
              points={{-108,-100},{-93.2,-100}},
              color={0,0,127}));
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
          "anglulat velocity contact point ball resolved in BCS1"
            annotation (Placement(transformation(extent={{-6,-6},{6,6}},
                rotation=270,
                origin={-40,20})));
          Modelica.Blocks.Interfaces.RealOutput w[3]
          "anglulat velocity contact point ball resolved in BCS1"
            annotation (Placement(transformation(
                extent={{-8,-8},{8,8}},
                rotation=270,
                origin={-40,-108})));
          Modelica.Blocks.Interfaces.RealInput vector_r[12]
          "length/width direction and L_W_H"                   annotation (
              Placement(transformation(
                extent={{-8,-8},{8,8}},
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
              thickness=0.5));
          connect(frame_a1, rP_ball_rectangle.frame_a)
                                                 annotation (Line(
              points={{-102,-60},{-66,-60},{-66,-6}},
              color={95,95,95},
              thickness=0.5));
          connect(frame_a2, rP_mp_rectangle_mp_ball.frame_a)
                                                    annotation (Line(
              points={{-102,60},{20,60},{20,26}},
              color={95,95,95},
              thickness=0.5));
          connect(aAV.w, w) annotation (Line(
              points={{-40,13.4},{-40,-108}},
              color={0,0,127}));
          connect(move_point_ball.frame_a, frame_b2)
                                                annotation (Line(
              points={{109,31},{102,31},{102,60}},
              color={95,95,95},
              thickness=0.5));
          connect(move_point_rectangle.frame_a, frame_b1)
                                               annotation (Line(
              points={{105,-41},{102,-41},{102,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(pos_rel, rP_mp_ball_rectangle.r_rel) annotation (Line(
              points={{80,-108},{80,20},{78.6,20}},
              color={0,0,127}));
          connect(rP_mp_ball_rectangle.frame_a, frame_a1) annotation (Line(
              points={{72,14},{72,-20},{-66,-20},{-66,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(variablePrism_ball.frame_b, frame_b2) annotation (Line(
              points={{64,60},{102,60}},
              color={95,95,95},
              thickness=0.5));
          connect(variablePrism_ball.frame_b, rP_mp_ball_rectangle.frame_b) annotation (
             Line(
              points={{64,60},{72,60},{72,26}},
              color={95,95,95},
              thickness=0.5));
          connect(variablePrism_ball.frame_a, frame_a2) annotation (Line(
              points={{48,60},{-102,60}},
              color={95,95,95},
              thickness=0.5));
          connect(variablePrism_rLW.frame_a, frame_a1)
                                                      annotation (Line(
              points={{-62,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(variablePrism_rLW.frame_b, frame_b1) annotation (Line(
              points={{-46,-60},{102,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_mp_rectangle_mp_ball.frame_b, variablePrism_rLW.frame_b)
            annotation (Line(
              points={{20,14},{20,-60},{-46,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_ball_rectangle.r_rel, pos_rel_mb_BCS2)
                                                   annotation (Line(
              points={{-59.4,-4.04133e-016},{-50,-4.04133e-016},{-50,0},{108,0}},
              color={0,0,127}));
          connect(Vector_ball, deMultiplex1.u) annotation (Line(
              points={{-108,10},{-95.2,10}},
              color={0,0,127}));
          connect(deMultiplex3.u, vector_r) annotation (Line(
              points={{-93.2,-30},{-108,-30}},
              color={0,0,127}));
          connect(rP_ctb_BCS1.frame_a, frame_a2) annotation (Line(
              points={{34,80},{-30,80},{-30,60},{-102,60}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_ctb_BCS1.frame_b, variablePrism_ball.frame_b) annotation (Line(
              points={{46,80},{64,80},{64,60}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_ctb_BCS1.r_rel, pos_ctb_BCS1) annotation (Line(
              points={{40,73.4},{40,-108}},
              color={0,0,127}));
          connect(aAV.frame_a, variablePrism_ball.frame_b) annotation (Line(
              points={{-40,26},{-40,42},{64,42},{64,60}},
              color={95,95,95},
              thickness=0.5));
          connect(aAV.frame_resolve, frame_a2) annotation (Line(
              points={{-46.06,20},{-74,20},{-74,60},{-102,60}},
              color={95,95,95},
              pattern=LinePattern.Dot));
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
          Modelica.Blocks.Interfaces.BooleanOutput contact annotation (Placement(
                transformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={0,-100})));

          Modelica.Blocks.Interfaces.RealInput vector_ball[12] "radius ball"
            annotation (Placement(transformation(extent={{-116,-62},{-100,-46}})));
          Modelica.Blocks.Interfaces.RealInput w_mov[3]
          "anglulat velocity contact point ball resolved in BCS1"
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
              thickness=0.5));
          connect(frame_a2, force.frame_b) annotation (Line(
              points={{1.77636e-015,102},{1.77636e-015,70},{-24,70}},
              color={95,95,95},
              thickness=0.5));
          connect(deMultiplex1.u, vector_ball) annotation (Line(
              points={{-95.2,-54},{-108,-54}},
              color={0,0,127}));
          connect(deMultiplex3.u, vector_r) annotation (Line(
              points={{-95.2,-94},{-108,-94}},
              color={0,0,127}));
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
          "anglulat velocity contact point ball resolved in BCS1"
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
                origin={-108,10})));
          Modelica.Blocks.Interfaces.RealOutput pos_rel[3]
          "relative position contact point ball resolved in BCS2"
            annotation (Placement(transformation(
                extent={{-8,-8},{8,8}},
                rotation=270,
                origin={80,-108})));
          Modelica.Blocks.Interfaces.RealOutput w[3]
          "anglulat velocity contact point ball resolved in BCS1"
            annotation (Placement(transformation(
                extent={{-8,-8},{8,8}},
                rotation=270,
                origin={-40,-108})));
          Modelica.Blocks.Interfaces.RealInput vector_circle[12]
          "V-Dl-Dw direction and Radius"                       annotation (
              Placement(transformation(
                extent={{-8,-8},{8,8}},
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
              thickness=0.5));
          connect(frame_a1, rP_ball_circle.frame_a)
                                                 annotation (Line(
              points={{-102,-60},{-72,-60},{-72,-6}},
              color={95,95,95},
              thickness=0.5));
          connect(aAV.w,w)  annotation (Line(
              points={{-40,13.4},{-40,-108}},
              color={0,0,127}));
          connect(contact_point_ball.frame_a, frame_b2)
                                                annotation (Line(
              points={{105,29},{102,29},{102,60}},
              color={95,95,95},
              thickness=0.5));
          connect(contact_point_circle.frame_a, frame_b1)
                                               annotation (Line(
              points={{103,-37},{102,-37},{102,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(pos_rel, rP_mp_ball_circle.r_rel)    annotation (Line(
              points={{80,-108},{80,20},{78.6,20}},
              color={0,0,127}));
          connect(rP_mp_ball_circle.frame_a, frame_a1)    annotation (Line(
              points={{72,14},{72,-18},{-72,-18},{-72,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_mp_circle_mp_ball.frame_a, frame_a2) annotation (Line(
              points={{14,26},{14,60},{-102,60}},
              color={95,95,95},
              thickness=0.5));
          connect(variablePrism_ball.frame_a, frame_a2) annotation (Line(
              points={{46,60},{-102,60}},
              color={95,95,95},
              thickness=0.5));
          connect(variablePrism_ball.frame_b, frame_b2) annotation (Line(
              points={{66,60},{102,60}},
              color={95,95,95},
              thickness=0.5));
          connect(variablePrism_ball.frame_b, rP_mp_ball_circle.frame_b) annotation (
              Line(
              points={{66,60},{72,60},{72,26}},
              color={95,95,95},
              thickness=0.5));
          connect(variablePrism_crLW.frame_a, frame_a1) annotation (Line(
              points={{-64,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(variablePrism_crLW.frame_b, frame_b1) annotation (Line(
              points={{-44,-60},{102,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(variablePrism_crLW.frame_b, rP_mp_circle_mp_ball.frame_b) annotation (
             Line(
              points={{-44,-60},{14,-60},{14,14}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_ball_circle.r_rel, pos_rel_mb_BCS2)
                                                annotation (Line(
              points={{-65.4,-4.04133e-016},{-40,-4.04133e-016},{-40,0},{110,0}},
              color={0,0,127}));
          connect(deMultiplex1.u, Vector_ball) annotation (Line(
              points={{-95.2,10},{-108,10}},
              color={0,0,127}));
          connect(deMultiplex3.u, vector_circle) annotation (Line(
              points={{-95.2,-30},{-108,-30}},
              color={0,0,127}));
          connect(aAV.frame_a, variablePrism_ball.frame_b) annotation (Line(
              points={{-40,26},{-40,42},{66,42},{66,60}},
              color={95,95,95},
              thickness=0.5));
          connect(aAV.frame_resolve, frame_a2) annotation (Line(
              points={{-46.06,20},{-62,20},{-62,60},{-102,60}},
              color={95,95,95},
              pattern=LinePattern.Dot));
          connect(rP_ctb_BCS1.frame_b, variablePrism_ball.frame_b) annotation (
              Line(
              points={{46,84},{66,84},{66,60}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_ctb_BCS1.frame_a, frame_a2) annotation (Line(
              points={{34,84},{14,84},{14,60},{-102,60}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_ctb_BCS1.r_rel, pos_ctb_BCS1) annotation (Line(
              points={{40,77.4},{40,-108}},
              color={0,0,127}));
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
                origin={-30,80})));
          Modelica.Blocks.Interfaces.BooleanOutput contact annotation (Placement(
                transformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={0,-100})));
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
          "anglulat velocity contact point ball resolved in BCS1"
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
              thickness=0.5));
          connect(frame_a2,force. frame_b) annotation (Line(
              points={{1.77636e-015,102},{1.77636e-015,80},{-24,80}},
              color={95,95,95},
              thickness=0.5));
          connect(vector_ball, deMultiplex1.u) annotation (Line(
              points={{-108,-54},{-93.2,-54}},
              color={0,0,127}));
          connect(vector_c, deMultiplex3.u) annotation (Line(
              points={{-108,-94},{-93.2,-94}},
              color={0,0,127}));
        end ForceSphereToCircle;
       annotation(preferredView="info");
      end Components;

       annotation(preferredView="info");
    end PunctiformContact;

    package LinearContact
    extends Modelica.Icons.Package;
      model CylinderToRectangle
        extends IdealizedContact.Components.PartialContactBlock;
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
        outer parameter Boolean exact;
        outer parameter SI.Frequency f;
        outer parameter Boolean animation;
        outer parameter Modelica.SIunits.Radius radiusContactPoint;
        outer parameter Modelica.Mechanics.MultiBody.Types.Color
          colorContactPoints1;
        outer parameter Modelica.Mechanics.MultiBody.Types.Color
          colorContactPoints2;

    protected
        parameter Real N1 = if n1==0 then Modelica.Constants.eps else n1;//to avoid mathematical error in case of 0^0
        parameter Real N2 = if n2==0 then Modelica.Constants.eps else n2;

    public
        IdealizedContact.ContactBlock.LinearContact.Components.MovePointCylinderToRectangle
                                                 move_point[2](
          q={1,-1},
          f={f,f},
          exact={exact,exact}, Animation={animation,animation},
          Color_contact_point_rectangle={colorContactPoints1,
              colorContactPoints1},
          radiusContactPoint={radiusContactPoint,radiusContactPoint})
        "move point detection"
          annotation (Placement(transformation(extent={{-60,12},{0,72}})));
       IdealizedContact.ContactBlock.LinearContact.Components.ForceCylinderToRectangle
                                           contact_force[2](
          q={1,-1},
          c={springCoefficient,springCoefficient},
          d={dampingCoefficient,dampingCoefficient},
          n1={N1,N1},
          n2={N2,N2},
          t_max={p_max,p_max},
          f={f,f},
          Animation={animation,animation},
          exact={exact,exact},
          radiusContactPoint={radiusContactPoint,radiusContactPoint},
          Color_contact_point_cylinder={colorContactPoints1,colorContactPoints1},
          Color_contact_point_rectangle={colorContactPoints2,
              colorContactPoints2},
          mue_r={mue_r,mue_r},
          gamma1={gamma1,gamma1},
          gamma2={gamma2,gamma2},
          gamma3={gamma3,gamma3},
          gamma4={gamma4,gamma4},
          gamma5={gamma5,gamma5},
          gamma6={gamma6,gamma6})
          annotation (Placement(transformation(extent={{2,-54},{54,0}})));

       Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP_cm_l2(
           resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a) "test"
         annotation (Placement(transformation(
             extent={{-6,-6},{6,6}},
             rotation=90,
             origin={50,34})));
      equation
        connect(move_point[1].frame_b2, contact_force[1].frame_a1) annotation (Line(
            points={{0.6,60},{28,60},{28,0.54}},
            color={95,95,95},
            thickness=0.5));
        connect(move_point[2].frame_b2, contact_force[2].frame_a1) annotation (Line(
            points={{0.6,60},{28,60},{28,0.54}},
            color={95,95,95},
            thickness=0.5));
        connect(contact_force[1].pos_rel_c_L, move_point[1].pos_rel_c_l) annotation (
            Line(
            points={{0.44,-10.8},{-24.6,-10.8},{-24.6,9.6}},
            color={0,0,127}));
        connect(contact_force[2].pos_rel_c_L, move_point[2].pos_rel_c_l) annotation (
            Line(
            points={{0.44,-10.8},{-24.6,-10.8},{-24.6,9.6}},
            color={0,0,127}));
        connect(contact_force[1].w_rel, move_point[1].w_rel) annotation (Line(
            points={{0.44,-21.6},{-36.6,-21.6},{-36.6,9.6}},
            color={0,0,127}));
        connect(contact_force[2].w_rel, move_point[2].w_rel) annotation (Line(
            points={{0.44,-21.6},{-36.6,-21.6},{-36.6,9.6}},
            color={0,0,127}));
        connect(move_point[1].frame_a2, frame_a) annotation (Line(
            points={{-60.6,60},{-102,60}},
            color={95,95,95},
            thickness=0.5));
        connect(move_point[2].frame_a2, frame_a) annotation (Line(
            points={{-60.6,60},{-102,60}},
            color={95,95,95},
            thickness=0.5));
        connect(frame_b, move_point[1].frame_a1) annotation (Line(
            points={{-102,-60},{-74,-60},{-74,24},{-60.6,24}},
            color={95,95,95},
            thickness=0.5));
        connect(frame_b, move_point[2].frame_a1) annotation (Line(
            points={{-102,-60},{-74,-60},{-74,24},{-60.6,24}},
            color={95,95,95},
            thickness=0.5));
        connect(contact_force[1].frame_a3, frame_b) annotation (Line(
            points={{28,-54.54},{28,-60},{-102,-60}},
            color={95,95,95},
            thickness=0.5));
        connect(contact_force[2].frame_a3, frame_b) annotation (Line(
            points={{28,-54.54},{28,-60},{-102,-60}},
            color={95,95,95},
            thickness=0.5));
        connect(move_point[1].vector_cylinder, vector_1) annotation (Line(
            points={{-62.4,48},{-82,48},{-82,10},{-108,10}},
            color={0,0,127}));
        connect(move_point[2].vector_cylinder, vector_1) annotation (Line(
            points={{-62.4,48},{-82,48},{-82,10},{-108,10}},
            color={0,0,127}));
        connect(contact_force[1].vector_cylinder, vector_1) annotation (Line(
            points={{-0.08,-41.58},{-82,-41.58},{-82,10},{-108,10}},
            color={0,0,127}));
        connect(contact_force[2].vector_cylinder, vector_1) annotation (Line(
            points={{-0.08,-41.58},{-82,-41.58},{-82,10},{-108,10}},
            color={0,0,127}));
        connect(contact_force[1].vector_rectangle, vector_2) annotation (Line(
            points={{-0.08,-52.38},{-78,-52.38},{-78,-30},{-108,-30}},
            color={0,0,127}));
        connect(contact_force[2].vector_rectangle, vector_2) annotation (Line(
            points={{-0.08,-52.38},{-78,-52.38},{-78,-30},{-108,-30}},
            color={0,0,127}));
        connect(move_point[1].vector_rectangle, vector_2) annotation (Line(
            points={{-62.4,36},{-78,36},{-78,-30},{-108,-30}},
            color={0,0,127}));
        connect(move_point[2].vector_rectangle, vector_2) annotation (Line(
            points={{-62.4,36},{-78,36},{-78,-30},{-108,-30}},
            color={0,0,127}));
        connect(move_point.angles, contact_force.angles) annotation (Line(
            points={{-48.6,9.6},{-48.6,-32.4},{0.44,-32.4}},
            color={0,0,127}));
        connect(move_point.frame_b1, contact_force.frame_a2) annotation (Line(
            points={{0.6,24},{11.36,24},{11.36,0.54}},
            color={95,95,95},
            thickness=0.5));
        connect(rP_cm_l2.frame_a, contact_force[2].frame_a1) annotation (Line(
            points={{50,28},{50,20},{28,20},{28,0.54}},
            color={95,95,95},
            thickness=0.5));
        connect(rP_cm_l2.frame_b, contact_force[1].frame_a1) annotation (Line(
            points={{50,40},{50,48},{28,48},{28,0.54}},
            color={95,95,95},
            thickness=0.5));
        connect(contact_force.pos_ctc_BCS1a, move_point.pos_ctc_BCS1a)
          annotation (Line(
            points={{0.44,-2.16},{-12.78,-2.16},{-12.78,9.6},{-13.8,9.6}},
            color={0,0,127}));
        annotation ( Icon(graphics={Rectangle(extent={{-100,100},
                    {100,-100}}, lineColor={255,128,0}), Text(
                extent={{-82,8},{82,-12}},
                lineColor={0,0,255},
                textString="Cylinder-Rectangle")}),
          Documentation(info="<html>
</html>"));
      end CylinderToRectangle;

      model CylinderToCircle
        extends IdealizedContact.Components.PartialContactBlock;
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
        outer parameter Boolean exact;
        outer parameter SI.Frequency f;
        outer parameter Boolean animation;
        outer parameter Modelica.SIunits.Radius radiusContactPoint;
        outer parameter Modelica.Mechanics.MultiBody.Types.Color
          colorContactPoints1;
        outer parameter Modelica.Mechanics.MultiBody.Types.Color
          colorContactPoints2;

    protected
        parameter Real N1 = if n1==0 then Modelica.Constants.eps else n1;//to avoid mathematical error in case of 0^0
        parameter Real N2 = if n2==0 then Modelica.Constants.eps else n2;

    public
        IdealizedContact.ContactBlock.LinearContact.Components.MovePointCylinderToCircle
                                              move_point_cylinder_circle[2](
          q={1,-1},
          f={f,f},
          exact={exact,exact}) "move point detection"
          annotation (Placement(transformation(extent={{-60,12},{0,72}})));
        IdealizedContact.ContactBlock.LinearContact.Components.ForceCylinderToCircle
                                         force_cylinder_circle[2](
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
          gamma6={gamma6,gamma6})
          annotation (Placement(transformation(extent={{0,-60},{60,0}})));

      equation
        connect(move_point_cylinder_circle.pos_rel_c_l, force_cylinder_circle.pos_rel_c_L)
          annotation (Line(
            points={{-30,9.6},{-30,-12.6},{-1.8,-12.6}},
            color={0,0,127}));
        connect(move_point_cylinder_circle.w_rel, force_cylinder_circle.w_rel)
          annotation (Line(
            points={{-42,9.6},{-42,-24.6},{-1.8,-24.6}},
            color={0,0,127}));
        connect(force_cylinder_circle.angles, move_point_cylinder_circle.angles)
          annotation (Line(
            points={{-1.8,-36.6},{-54,-36.6},{-54,9.6}},
            color={0,0,127}));
        connect(move_point_cylinder_circle.frame_b2, force_cylinder_circle.frame_a1)
          annotation (Line(
            points={{0.6,60},{30,60},{30,0.6}},
            color={95,95,95},
            thickness=0.5));
        connect(move_point_cylinder_circle[1].frame_a2, frame_a) annotation (Line(
            points={{-60.6,60},{-102,60}},
            color={95,95,95},
            thickness=0.5));
        connect(move_point_cylinder_circle[2].frame_a2, frame_a) annotation (Line(
            points={{-60.6,60},{-102,60}},
            color={95,95,95},
            thickness=0.5));
        connect(move_point_cylinder_circle[1].frame_a1, frame_b) annotation (Line(
            points={{-60.6,24},{-66,24},{-66,-60},{-102,-60}},
            color={95,95,95},
            thickness=0.5));
        connect(move_point_cylinder_circle[2].frame_a1, frame_b) annotation (Line(
            points={{-60.6,24},{-66,24},{-66,-60},{-102,-60}},
            color={95,95,95},
            thickness=0.5));
        connect(force_cylinder_circle[1].frame_a3, frame_b) annotation (Line(
            points={{30,-60.6},{30,-60},{-102,-60}},
            color={95,95,95},
            thickness=0.5));
        connect(force_cylinder_circle[2].frame_a3, frame_b) annotation (Line(
            points={{30,-60.6},{30,-60},{-102,-60}},
            color={95,95,95},
            thickness=0.5));
        connect(move_point_cylinder_circle[1].vector_cylinder, vector_1) annotation (
            Line(
            points={{-62.4,48},{-82,48},{-82,10},{-108,10}},
            color={0,0,127}));
        connect(move_point_cylinder_circle[2].vector_cylinder, vector_1) annotation (
            Line(
            points={{-62.4,48},{-82,48},{-82,10},{-108,10}},
            color={0,0,127}));
        connect(move_point_cylinder_circle[1].vector_circle, vector_2) annotation (
            Line(
            points={{-62.4,36},{-76,36},{-76,-30},{-108,-30}},
            color={0,0,127}));
        connect(move_point_cylinder_circle[2].vector_circle, vector_2) annotation (
            Line(
            points={{-62.4,36},{-76,36},{-76,-30},{-108,-30}},
            color={0,0,127}));
        connect(force_cylinder_circle[1].vector_cylinder, vector_1) annotation (Line(
            points={{-2.4,-46.2},{-82,-46.2},{-82,10},{-108,10}},
            color={0,0,127}));
        connect(force_cylinder_circle[2].vector_cylinder, vector_1) annotation (Line(
            points={{-2.4,-46.2},{-82,-46.2},{-82,10},{-108,10}},
            color={0,0,127}));
        connect(force_cylinder_circle[1].vector_circle, vector_2) annotation (Line(
            points={{-2.4,-58.2},{-76,-58.2},{-76,-30},{-108,-30}},
            color={0,0,127}));
        connect(force_cylinder_circle[2].vector_circle, vector_2) annotation (Line(
            points={{-2.4,-58.2},{-76,-58.2},{-76,-30},{-108,-30}},
            color={0,0,127}));
        connect(force_cylinder_circle.pos_ctc_BCS1a, move_point_cylinder_circle.pos_ctc_BCS1a)
          annotation (Line(
            points={{-1.8,-3.6},{-18,-3.6},{-18,9.6}},
            color={0,0,127}));
        annotation (Icon(graphics={                   Rectangle(extent={{-100,100},{100,
                    -100}},      lineColor={255,128,0}), Text(
                extent={{-84,10},{80,-10}},
                lineColor={0,0,255},
                textString="Cylinder-Circle")}));
      end CylinderToCircle;

      model CylinderToCylinderPoint
        extends IdealizedContact.Components.PartialContactBlock;

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
        outer parameter Boolean exact;
        outer parameter SI.Frequency f;
        outer parameter Boolean animation;
        outer parameter Modelica.SIunits.Radius radiusContactPoint;
        outer parameter Modelica.Mechanics.MultiBody.Types.Color
          colorContactPoints1;
        outer parameter Modelica.Mechanics.MultiBody.Types.Color
          colorContactPoints2;

    protected
        parameter Real N1 = if n1==0 then Modelica.Constants.eps else n1;//to avoid mathematical error in case of 0^0
        parameter Real N2 = if n2==0 then Modelica.Constants.eps else n2;

    public
        Components.MovePointCylinderToCylinderPoint
                                                movePointCylinderToCylinderP(
          f=f,
          radiusContactPoint=radiusContactPoint,
          Color_contact_point_cylinder1=colorContactPoints1,
          Color_contact_point_cylinder2=colorContactPoints2,
          animation=animation)
          annotation (Placement(transformation(extent={{-60,28},{-20,68}})));
        Components.ForceCylinderToCylinderPoint
                                            forceCylnderToCylinderP(
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
          t_max=p_max)
          annotation (Placement(transformation(extent={{-28,-68},{12,-28}})));
      //   Modelica.Blocks.Sources.BooleanConstant booleanConstant annotation (
      //       Placement(transformation(
      //         extent={{-10,-10},{10,10}},
      //         rotation=90,
      //         origin={-8,-86})));
      equation
        connect(movePointCylinderToCylinderP.frame_b2, forceCylnderToCylinderP.frame_a3)
          annotation (Line(
            points={{-20.1429,32.4444},{-12,32.4444},{-12,-27.6}},
            color={95,95,95},
            thickness=0.5));
        connect(movePointCylinderToCylinderP.frame_b1, forceCylnderToCylinderP.frame_a4)
          annotation (Line(
            points={{-20,61.7778},{0,61.7778},{0,-27.6}},
            color={95,95,95},
            thickness=0.5));
        connect(movePointCylinderToCylinderP.frame_a1, frame_a) annotation (Line(
            points={{-60.2857,63.3333},{-71.7857,63.3333},{-71.7857,60},{-102,
              60}},
            color={95,95,95},
            thickness=0.5));
        connect(movePointCylinderToCylinderP.frame_a2, frame_b) annotation (Line(
            points={{-59.5714,32.4444},{-76,32.4444},{-76,-60},{-102,-60}},
            color={95,95,95},
            thickness=0.5));
        connect(forceCylnderToCylinderP.frame_a2, frame_b) annotation (Line(
            points={{-28.4,-60},{-102,-60}},
            color={95,95,95},
            thickness=0.5));
        connect(forceCylnderToCylinderP.frame_a1, frame_a) annotation (Line(
            points={{-28.4,-36},{-72,-36},{-72,60},{-102,60}},
            color={95,95,95},
            thickness=0.5));
        connect(movePointCylinderToCylinderP.vector_cylinder1, vector_1) annotation (
            Line(
            points={{-60.5714,49.7778},{-88,49.7778},{-88,10},{-108,10}},
            color={0,0,127}));
        connect(movePointCylinderToCylinderP.vector_cylinder2, vector_2) annotation (
            Line(
            points={{-60.5714,45.3333},{-82,45.3333},{-82,-30},{-108,-30}},
            color={0,0,127}));
        connect(forceCylnderToCylinderP.vector_cylinder2, vector_2) annotation (Line(
            points={{-29.6,-52},{-82,-52},{-82,-30},{-108,-30}},
            color={0,0,127}));
        connect(forceCylnderToCylinderP.vector_cylinder1, vector_1) annotation (Line(
            points={{-29.6,-44},{-88,-44},{-88,10},{-108,10}},
            color={0,0,127}));
      //   connect(booleanConstant.y, forceCylnderToCylinderP.enabled) annotation (
      //      Line(
      //       points={{-8,-75},{-8,-68},{-7.6,-68}},
      //       color={255,0,255},
      //       ));
      forceCylnderToCylinderP.enabled=true;
      movePointCylinderToCylinderP.enabled=true;
        annotation (Icon(graphics={                   Rectangle(extent={{-100,100},
                    {100,-100}}, lineColor={255,128,0}), Text(
                extent={{-80,10},{84,-10}},
                lineColor={0,0,255},
                textString="Cylinder-Cylinder")}));
      end CylinderToCylinderPoint;

      model CylinderToCylinderLine
        extends IdealizedContact.Components.PartialContactBlock;

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
        outer parameter Boolean exact;
        outer parameter SI.Frequency f;
        outer parameter Boolean animation;
        outer parameter Modelica.SIunits.Radius radiusContactPoint;
        outer parameter Modelica.Mechanics.MultiBody.Types.Color
          colorContactPoints1;
        outer parameter Modelica.Mechanics.MultiBody.Types.Color
          colorContactPoints2;

    protected
        parameter Real N1 = if n1==0 then Modelica.Constants.eps else n1;//to avoid mathematical error in case of 0^0
        parameter Real N2 = if n2==0 then Modelica.Constants.eps else n2;

    public
        Components.MovePointCylinderToCylinderLine
                                                move_point_cylinder_cylinder[2](
          q={1,-1},
          f={f,f},
          animation={animation,animation},
          radiusContactPoint={radiusContactPoint,radiusContactPoint},
          Color_contact_point_cylinder1={colorContactPoints1,colorContactPoints1},
          Color_contact_point_cylinder2={colorContactPoints2,colorContactPoints2})
        "move point detection"
          annotation (Placement(transformation(extent={{-40,-20},{0,20}})));
        Components.ForceCylinderToCylinderLine
                                           force_cylinder_cylinder[2](
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
          gamma6={gamma6,gamma6})
          annotation (Placement(transformation(extent={{0,-68},{40,-28}})));
      //   Modelica.Blocks.Sources.BooleanConstant booleanConstant annotation (
      //       Placement(transformation(
      //         extent={{-10,-10},{10,10}},
      //         rotation=90,
      //         origin={14,-90})));
      equation
        connect(move_point_cylinder_cylinder[1].frame_a1, frame_a) annotation (Line(
            points={{-40.4,7.69231},{-80,7.69231},{-80,60},{-102,60}},
            color={95,95,95},
            thickness=0.5));
        connect(move_point_cylinder_cylinder[2].frame_a1, frame_a) annotation (Line(
            points={{-40.4,7.69231},{-80,7.69231},{-80,60},{-102,60}},
            color={95,95,95},
            thickness=0.5));
        connect(move_point_cylinder_cylinder[1].frame_a2, frame_b) annotation (Line(
            points={{-40.4,-10.7692},{-74,-10.7692},{-74,-60},{-102,-60}},
            color={95,95,95},
            thickness=0.5));
        connect(move_point_cylinder_cylinder[2].frame_a2, frame_b) annotation (Line(
            points={{-40.4,-10.7692},{-74,-10.7692},{-74,-60},{-102,-60}},
            color={95,95,95},
            thickness=0.5));
        connect(move_point_cylinder_cylinder[1].vector_cylinder1, vector_1)
          annotation (Line(
            points={{-41.6,1.53846},{-92,1.53846},{-92,10},{-108,10}},
            color={0,0,127}));
        connect(move_point_cylinder_cylinder[2].vector_cylinder1, vector_1)
          annotation (Line(
            points={{-41.6,1.53846},{-92,1.53846},{-92,10},{-108,10}},
            color={0,0,127}));
        connect(move_point_cylinder_cylinder[1].vector_cylinder2, vector_2)
          annotation (Line(
            points={{-41.6,-4.61538},{-84,-4.61538},{-84,-30},{-108,-30}},
            color={0,0,127}));
        connect(move_point_cylinder_cylinder[2].vector_cylinder2, vector_2)
          annotation (Line(
            points={{-41.6,-4.61538},{-84,-4.61538},{-84,-30},{-108,-30}},
            color={0,0,127}));
        connect(move_point_cylinder_cylinder.frame_b2, force_cylinder_cylinder.frame_a3)
          annotation (Line(
            points={{0.4,-10.7692},{16,-10.7692},{16,-27.6}},
            color={95,95,95},
            thickness=0.5));
        connect(move_point_cylinder_cylinder.frame_b1, force_cylinder_cylinder.frame_a4)
          annotation (Line(
            points={{0.4,7.69231},{28,7.69231},{28,-27.6}},
            color={95,95,95},
            thickness=0.5));
        connect(force_cylinder_cylinder[1].frame_a2, frame_b) annotation (Line(
            points={{-0.4,-60},{-102,-60}},
            color={95,95,95},
            thickness=0.5));
        connect(force_cylinder_cylinder[2].frame_a2, frame_b) annotation (Line(
            points={{-0.4,-60},{-102,-60}},
            color={95,95,95},
            thickness=0.5));
        connect(force_cylinder_cylinder[1].vector_cylinder2, vector_2)
          annotation (Line(
            points={{-1.6,-52},{-84,-52},{-84,-30},{-108,-30}},
            color={0,0,127}));
        connect(force_cylinder_cylinder[2].vector_cylinder2, vector_2)
          annotation (Line(
            points={{-1.6,-52},{-84,-52},{-84,-30},{-108,-30}},
            color={0,0,127}));
        connect(force_cylinder_cylinder[1].vector_cylinder1, vector_1)
          annotation (Line(
            points={{-1.6,-44},{-92,-44},{-92,10},{-108,10}},
            color={0,0,127}));
        connect(force_cylinder_cylinder[2].vector_cylinder1, vector_1)
          annotation (Line(
            points={{-1.6,-44},{-92,-44},{-92,10},{-108,10}},
            color={0,0,127}));
        connect(force_cylinder_cylinder[1].frame_a1, frame_a) annotation (Line(
            points={{-0.4,-36},{-80,-36},{-80,60},{-102,60}},
            color={95,95,95},
            thickness=0.5));
        connect(force_cylinder_cylinder[2].frame_a1, frame_a) annotation (Line(
            points={{-0.4,-36},{-80,-36},{-80,60},{-102,60}},
            color={95,95,95},
            thickness=0.5));
      //   connect(booleanConstant.y, force_cylinder_cylinder[1].enabled)
      //     annotation (Line(
      //       points={{14,-79},{13.6,-79},{13.6,-69.6}},
      //       color={255,0,255},
      //       ));
      //   connect(booleanConstant.y, force_cylinder_cylinder[2].enabled)
      //     annotation (Line(
      //       points={{14,-79},{13.6,-79},{13.6,-69.6}},
      //       color={255,0,255},
      //       ));
      force_cylinder_cylinder[1].enabled=true;
      force_cylinder_cylinder[2].enabled=true;
      move_point_cylinder_cylinder[1].enabled=true;
      move_point_cylinder_cylinder[2].enabled=true;
        annotation (Icon(graphics={                   Rectangle(extent={{-100,100},
                    {100,-100}}, lineColor={255,128,0}), Text(
                extent={{-80,10},{84,-10}},
                lineColor={0,0,255},
                textString="Cylinder-Cylinder")}));
      end CylinderToCylinderLine;

      model CylinderToCylinderCombined
        extends IdealizedContact.Components.PartialContactBlock;

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
        outer parameter Boolean exact;
        outer parameter SI.Frequency f;
        outer parameter Boolean animation;
        outer parameter Modelica.SIunits.Radius radiusContactPoint;
        outer parameter Modelica.Mechanics.MultiBody.Types.Color
          colorContactPoints1;
        outer parameter Modelica.Mechanics.MultiBody.Types.Color
          colorContactPoints2;
      Real Length_Direction1_wf[3];
      Real Length_Direction2_wf[3];

      Boolean enable2p;
    protected
        parameter Real N1 = if n1==0 then Modelica.Constants.eps else n1;//to avoid mathematical error in case of 0^0
        parameter Real N2 = if n2==0 then Modelica.Constants.eps else n2;

    public
        Components.MovePointCylinderToCylinderPoint
                                                movePointCylinderToCylinderP(
          f=f,
          radiusContactPoint=radiusContactPoint,
          Color_contact_point_cylinder1=colorContactPoints1,
          Color_contact_point_cylinder2=colorContactPoints2,
          animation=animation)
          annotation (Placement(transformation(extent={{-60,28},{-20,68}})));
        Components.ForceCylinderToCylinderPoint
                                            forceCylnderToCylinderP(
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
          t_max=p_max)
          annotation (Placement(transformation(extent={{-28,-68},{12,-28}})));
    public
        Components.MovePointCylinderToCylinderLine
                                                move_point_cylinder_cylinder[2](
          q={1,-1},
          f={f,f},
          animation={animation,animation},
          radiusContactPoint={radiusContactPoint,radiusContactPoint},
          Color_contact_point_cylinder1={colorContactPoints1,colorContactPoints1},
          Color_contact_point_cylinder2={colorContactPoints2,colorContactPoints2})
        "move point detection"
          annotation (Placement(transformation(extent={{40,32},{80,72}})));
        Components.ForceCylinderToCylinderLine
                                           force_cylinder_cylinder[2](
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
          gamma6={gamma6,gamma6})
          annotation (Placement(transformation(extent={{76,-14},{116,26}})));
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
      Length_Direction1_wf = Modelica.Mechanics.MultiBody.Frames.resolve1(frame_a.R,deMultiplex1.y1);
      Length_Direction2_wf = Modelica.Mechanics.MultiBody.Frames.resolve1(frame_b.R,deMultiplex2.y1);

      enable2p=abs(IdealizedContact.Components.VectorCalculations.angleBetweenTwoVectors(Length_Direction1_wf,Length_Direction2_wf))<0.01;
      force_cylinder_cylinder[1].enabled=enable2p;
      force_cylinder_cylinder[2].enabled=enable2p;
      move_point_cylinder_cylinder[1].enabled=enable2p;
      move_point_cylinder_cylinder[2].enabled=enable2p;
      forceCylnderToCylinderP.enabled=not enable2p;
      movePointCylinderToCylinderP.enabled=not enable2p;
        connect(movePointCylinderToCylinderP.frame_b2, forceCylnderToCylinderP.frame_a3)
          annotation (Line(
            points={{-20.1429,32.4444},{-12,32.4444},{-12,-27.6}},
            color={95,95,95},
            thickness=0.5));
        connect(movePointCylinderToCylinderP.frame_b1, forceCylnderToCylinderP.frame_a4)
          annotation (Line(
            points={{-20,61.7778},{0,61.7778},{0,-27.6}},
            color={95,95,95},
            thickness=0.5));
        connect(movePointCylinderToCylinderP.frame_a1, frame_a) annotation (Line(
            points={{-60.2857,63.3333},{-66,63.3333},{-66,64},{-72,64},{-72,60},
              {-102,60}},
            color={95,95,95},
            thickness=0.5));
        connect(movePointCylinderToCylinderP.frame_a2, frame_b) annotation (Line(
            points={{-59.5714,32.4444},{-76,32.4444},{-76,-60},{-102,-60}},
            color={95,95,95},
            thickness=0.5));
        connect(forceCylnderToCylinderP.frame_a2, frame_b) annotation (Line(
            points={{-28.4,-60},{-102,-60}},
            color={95,95,95},
            thickness=0.5));
        connect(forceCylnderToCylinderP.frame_a1, frame_a) annotation (Line(
            points={{-28.4,-36},{-72,-36},{-72,60},{-102,60}},
            color={95,95,95},
            thickness=0.5));
        connect(movePointCylinderToCylinderP.vector_cylinder1, vector_1) annotation (
            Line(
            points={{-60.5714,49.7778},{-88,49.7778},{-88,10},{-108,10}},
            color={0,0,127}));
        connect(movePointCylinderToCylinderP.vector_cylinder2, vector_2) annotation (
            Line(
            points={{-60.5714,45.3333},{-82,45.3333},{-82,-30},{-108,-30}},
            color={0,0,127}));
        connect(forceCylnderToCylinderP.vector_cylinder2, vector_2) annotation (Line(
            points={{-29.6,-52},{-82,-52},{-82,-30},{-108,-30}},
            color={0,0,127}));
        connect(forceCylnderToCylinderP.vector_cylinder1, vector_1) annotation (Line(
            points={{-29.6,-44},{-88,-44},{-88,10},{-108,10}},
            color={0,0,127}));
        connect(move_point_cylinder_cylinder[1].frame_a1, frame_a) annotation (Line(
            points={{39.6,59.6923},{16,59.6923},{16,76},{-72,76},{-72,60},{-102,
              60}},
            color={95,95,95},
            thickness=0.5));
        connect(move_point_cylinder_cylinder[2].frame_a1, frame_a) annotation (Line(
            points={{39.6,59.6923},{16,59.6923},{16,76},{-72,76},{-72,60},{-102,
              60}},
            color={95,95,95},
            thickness=0.5));
        connect(move_point_cylinder_cylinder[1].frame_a2, frame_b) annotation (Line(
            points={{39.6,41.2308},{20,41.2308},{20,-74},{-76,-74},{-76,-60},{
              -102,-60}},
            color={95,95,95},
            thickness=0.5));
        connect(move_point_cylinder_cylinder[2].frame_a2, frame_b) annotation (Line(
            points={{39.6,41.2308},{20,41.2308},{20,-6},{-76,-6},{-76,-60},{
              -102,-60}},
            color={95,95,95},
            thickness=0.5));
        connect(move_point_cylinder_cylinder[1].vector_cylinder1, vector_1)
          annotation (Line(
            points={{38.4,53.5385},{4,53.5385},{4,10},{-108,10}},
            color={0,0,127}));
        connect(move_point_cylinder_cylinder[2].vector_cylinder1, vector_1)
          annotation (Line(
            points={{38.4,53.5385},{4,53.5385},{4,10},{-108,10}},
            color={0,0,127}));
        connect(move_point_cylinder_cylinder[1].vector_cylinder2, vector_2)
          annotation (Line(
            points={{38.4,47.3846},{12,47.3846},{12,2},{-64,2},{-64,-30},{-108,
              -30}},
            color={0,0,127}));
        connect(move_point_cylinder_cylinder[2].vector_cylinder2, vector_2)
          annotation (Line(
            points={{38.4,47.3846},{12,47.3846},{12,2},{-64,2},{-64,-30},{-108,
              -30}},
            color={0,0,127}));
        connect(move_point_cylinder_cylinder.frame_b2,force_cylinder_cylinder. frame_a3)
          annotation (Line(
            points={{80.4,41.2308},{92,41.2308},{92,26.4}},
            color={95,95,95},
            thickness=0.5));
        connect(move_point_cylinder_cylinder.frame_b1,force_cylinder_cylinder. frame_a4)
          annotation (Line(
            points={{80.4,59.6923},{104,59.6923},{104,26.4}},
            color={95,95,95},
            thickness=0.5));
        connect(force_cylinder_cylinder[1].frame_a2, frame_b) annotation (Line(
            points={{75.6,-6},{-76,-6},{-76,-60},{-102,-60}},
            color={95,95,95},
            thickness=0.5));
        connect(force_cylinder_cylinder[2].frame_a2, frame_b) annotation (Line(
            points={{75.6,-6},{-76,-6},{-76,-60},{-102,-60}},
            color={95,95,95},
            thickness=0.5));
        connect(force_cylinder_cylinder[1].vector_cylinder2, vector_2)
          annotation (Line(
            points={{74.4,2},{-64,2},{-64,-30},{-108,-30}},
            color={0,0,127}));
        connect(force_cylinder_cylinder[2].vector_cylinder2, vector_2)
          annotation (Line(
            points={{74.4,2},{-64,2},{-64,-30},{-108,-30}},
            color={0,0,127}));
        connect(force_cylinder_cylinder[1].vector_cylinder1, vector_1)
          annotation (Line(
            points={{74.4,10},{-108,10}},
            color={0,0,127}));
        connect(force_cylinder_cylinder[2].vector_cylinder1, vector_1)
          annotation (Line(
            points={{74.4,10},{-108,10}},
            color={0,0,127}));
        connect(force_cylinder_cylinder[1].frame_a1, frame_a) annotation (Line(
            points={{75.6,18},{16,18},{16,76},{-72,76},{-72,60},{-102,60}},
            color={95,95,95},
            thickness=0.5));
        connect(force_cylinder_cylinder[2].frame_a1, frame_a) annotation (Line(
            points={{75.6,18},{16,18},{16,76},{-72,76},{-72,60},{-102,60}},
            color={95,95,95},
            thickness=0.5));
        connect(vector_1, deMultiplex1.u) annotation (Line(
            points={{-108,10},{-88,10},{-88,-86},{-39.2,-86}},
            color={0,0,127}));
        connect(vector_2, deMultiplex2.u) annotation (Line(
            points={{-108,-30},{-82,-30},{-82,-94},{-21.2,-94}},
            color={0,0,127}));
        annotation (Icon(graphics={                   Rectangle(extent={{-100,100},
                    {100,-100}}, lineColor={255,128,0}), Text(
                extent={{-80,10},{84,-10}},
                lineColor={0,0,255},
                textString="Cylinder-Cylinder")}),         Diagram(coordinateSystem(
                preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
                                                                   graphics={
                                      Text(
                extent={{-30,106},{46,64}},
                lineColor={255,0,0},
                textStyle={TextStyle.Bold},
                textString="The collision of two cylinders can lead to linear or punctiform contact regions.
The calculation for these two cases is currently seperated in two blocks.
Integration of the two blocks is in progress.")}));
      end CylinderToCylinderCombined;

      package Components
      extends Modelica.Icons.BasesPackage;

        model MovePointCylinderToRectangle
          parameter Boolean exact=true;
          parameter Modelica.SIunits.Frequency f=10000000;
          parameter Real q=1 "1=left   -1=right";
         parameter Modelica.Mechanics.MultiBody.Types.Color
            Color_contact_point_rectangle =                                                {255,0,255};
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
            annotation (Placement(transformation(extent={{92,50},{112,70}})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a1
          "center of rectangle BCS2"
                                  annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                origin={-102,-60})));
          Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP_p_lc(
              resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "relativ position center of cylinder top/bottom surface resolved in BCS2"
            annotation (Placement(transformation(
                extent={{-6,-6},{6,6}},
                rotation=90,
                origin={-60,0})));
          Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP_cc_mpr(
              resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "position move point right resolved in frame center of cylinder mass"
            annotation (Placement(transformation(
                extent={{-6,-6},{6,6}},
                rotation=270,
                origin={36,2})));
          Modelica.Blocks.Interfaces.RealOutput w_rel[3]
          "relative angular velocity contact point cylinder resolved in BCS1a(from aAV)"
            annotation (Placement(transformation(
                extent={{-8,-8},{8,8}},
                rotation=270,
                origin={-22,-108})));
          Modelica.Blocks.Interfaces.RealOutput pos_rel_c_l[3]
          "relativ position center of cylinder top/bottom surface resolved in BCS2 (from rP_p_lc)"
            annotation (Placement(transformation(extent={{-8,-8},{8,8}},
                rotation=270,
                origin={18,-108})));
          Modelica.Blocks.Interfaces.RealInput vector_cylinder[12]
          "length_direction and radius and half_length"
            annotation (Placement(transformation(extent={{-8,-8},{8,8}},
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

      public
          IdealizedContact.Components.Utilities.variablePrism1 variablePrism_cy1
          "offset from center of cylinder mass to cylinder contact point BCS3"
            annotation (Placement(transformation(extent={{60,52},{76,68}})));
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
            annotation (Placement(transformation(extent={{90,-72},{114,-48}})));
          Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP_cc_mpcy(
              resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "position contact point cylinder resolved in BCS2"
            annotation (Placement(transformation(
                extent={{-6,-6},{6,6}},
                origin={70,-36})));
          Modelica.Mechanics.MultiBody.Parts.PointMass contact_point_rectangle(
            m=0,
            animation=Animation,
            sphereColor=Color_contact_point_rectangle,
            sphereDiameter=2*radiusContactPoint)
            annotation (Placement(transformation(extent={{96,-42},{108,-30}})));
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
                origin={-8,34})));
          Modelica.Blocks.Interfaces.RealOutput pos_ctc_BCS1a[3]
          "relativ position cylinder contact point resolved in BCS1a (from rP_p_lc)"
            annotation (Placement(transformation(extent={{-8,-8},{8,8}},
                rotation=270,
                origin={54,-108})));
          Modelica.Mechanics.MultiBody.Sensors.RelativeAngularVelocity aAV(
              resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "relative angular velocity contact point cylinder resolved in BCS1a"
            annotation (Placement(transformation(
                extent={{-6,-6},{6,6}},
                origin={88,20})));
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

        //----------connection to output--------------------------------------------------------
          pos_rel_c_l=rP_p_lc.r_rel;
          pos_ctc_BCS1a = rP_ctc_BCS1a.r_rel;
          w_rel=aAV.w_rel;
          angles[1]=angle_LotL.angle;
          angles[2]=angle_LotW.angle;
          angles[3]=angle_LH.angle;
        //--------------------------------------------------------------------------------------

          connect(rP_p_lc.frame_a, frame_a1) annotation (Line(
              points={{-60,-6},{-60,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5));

          connect(tansformRelativeVector.frame_b, frame_a2) annotation (Line(
              points={{-76,6},{-76,60},{-102,60}},
              color={95,95,95},
              thickness=0.5));
          connect(tansformRelativeVector.frame_a, frame_a1) annotation (Line(
              points={{-76,-6},{-76,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_cc_mpr.frame_a, frame_a2) annotation (Line(
              points={{36,8},{36,60},{-102,60}},
              color={95,95,95},
              thickness=0.5));
          connect(variablePrism_cy1.frame_b, frame_b2) annotation (Line(
              points={{76,60},{102,60}},
              color={95,95,95},
              thickness=0.5));
          connect(variablePrism_cy.frame_a, frame_a2) annotation (Line(
              points={{-60,54},{-60,60},{-102,60}},
              color={95,95,95},
              thickness=0.5));
          connect(variablePrism_rt1.frame_a, frame_a1) annotation (Line(
              points={{-52,-20},{-60,-20},{-60,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(variablePrism_rt2.frame_b, rP_cc_mpr.frame_b) annotation (Line(
              points={{36,-20},{36,-4}},
              color={95,95,95},
              thickness=0.5));
          connect(variableRevol_2.frame_b, variablePrism_rt2.frame_a) annotation (Line(
              points={{12,-20},{20,-20}},
              color={95,95,95},
              thickness=0.5));
          connect(variableRevol_1.frame_b, variableRevol_2.frame_a) annotation (Line(
              points={{-12,-20},{-4,-20}},
              color={95,95,95},
              thickness=0.5));
          connect(variableRevol_1.frame_a, variablePrism_rt1.frame_b) annotation (Line(
              points={{-28,-20},{-36,-20}},
              color={95,95,95},
              thickness=0.5));
          connect(variablePrism_cy.frame_b, rP_p_lc.frame_b) annotation (Line(
              points={{-60,34},{-60,6}},
              color={95,95,95},
              thickness=0.5));
          connect(deMultiplex2.u, vector_cylinder) annotation (Line(
              points={{-97.2,20},{-108,20}},
              color={0,0,127}));
          connect(deMultiplex3.u, vector_rectangle) annotation (Line(
              points={{-97.2,-20},{-108,-20}},
              color={0,0,127}));
          connect(variablePrism_mpr.frame_a, frame_a1) annotation (Line(
              points={{32,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(variablePrism_mpr.frame_b, frame_b1) annotation (Line(
              points={{48,-60},{102,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_cc_mpcy.frame_b, variablePrism_cy1.frame_b) annotation (Line(
              points={{76,-36},{76,60}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_cc_mpcy.frame_a, frame_a1) annotation (Line(
              points={{64,-36},{-60,-36},{-60,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(contact_point_rectangle.frame_a, frame_b1)
                                                            annotation (Line(
              points={{102,-36},{102,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(filter.u, angle_LotW.angle) annotation (Line(
              points={{-62,78},{-70,78},{-70,95},{-80,95}},
              color={0,0,127}));
          connect(variablePrism_cy1.frame_a, frame_a2) annotation (Line(
              points={{60,60},{-102,60}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_ctc_BCS1a.frame_a, variablePrism_cy.frame_b) annotation (Line(
              points={{-14,34},{-60,34}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_ctc_BCS1a.frame_b, variablePrism_cy1.frame_b) annotation (Line(
              points={{-2,34},{76,34},{76,60}},
              color={95,95,95},
              thickness=0.5));
          connect(aAV.frame_b, variablePrism_cy1.frame_b) annotation (Line(
              points={{94,20},{94,60},{76,60}},
              color={95,95,95},
              thickness=0.5));
          connect(aAV.frame_a, variablePrism_cy.frame_b) annotation (Line(
              points={{82,20},{-60,20},{-60,34}},
              color={95,95,95},
              thickness=0.5));
        end MovePointCylinderToRectangle;

        model ForceCylinderToRectangle
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
         parameter SI.Distance t_max=0.0001 "maximal penetration";
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
            Color_contact_point_rectangle =                                                {255,0,255};

        // BCS2 - body coordinate system resolved in center of rectangle
        // BCS1 - body coordinate system resolved in center of cylinder mass
        // BCS2a - coordinate system resolved in BCS2 and in x direction(length direction cylinder) has the same orientation as BCS1
        // BCS1a - coordinate system resolved in center of cylinder face side based on BCS1
        // BCS3 - coordinate system resolved in cylinder contact point based in BCS1
        // BCS4 - coordinate system resolved in rectangle contact point based in BCS2

         Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a1
          "contact point cylinder BCS3 based on BCS1"
           annotation (Placement(transformation(extent={{-12,-12},{12,12}},
               rotation=90,
               origin={0,102})));
         Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a3
          "center of rectangle BCS2"
           annotation (Placement(transformation(extent={{-12,-12},{12,12}},
               rotation=90,
               origin={0,-102})));
         Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP_cm_l(
             resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "relativ position cylindercontact point left/right resolved in BCS2"
           annotation (Placement(transformation(
               extent={{-6,-6},{6,6}},
               rotation=90,
               origin={0,-74})));
         Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP_p_cpl(
             resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "relative position offset contact point cylinder resolved in BCS2"
           annotation (Placement(transformation(extent={{-6,-6},{6,6}},
               origin={-54,-46})));
         Modelica.Mechanics.MultiBody.Sensors.AbsoluteAngles aA(sequence={1,2,3})
          "absolut rotation angles between BCS2 and ICS via 'sequence'"
           annotation (Placement(transformation(extent={{20,-92},{32,-80}})));
         Modelica.Blocks.Interfaces.RealInput w_rel[3]
          "Absolute angular velocity center of cylinder mass resolved in world frame"
           annotation (Placement(transformation(extent={{-112,14},{-100,26}})));
         Modelica.Blocks.Interfaces.RealInput pos_rel_c_L[3]
          "relativ position center of cylinder top/bottom surface resolved in BCS2"
           annotation (Placement(transformation(extent={{-6,-6},{6,6}},
               origin={-106,60})));

      public
         Modelica.Blocks.Interfaces.BooleanOutput contact annotation (Placement(
               transformation(
               extent={{-7,-7},{7,7}},
               origin={107,61})));
         Modelica.Mechanics.MultiBody.Forces.Force f_l(resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a,
             animation=false)
          "force resolved in contact point on rectangle surface BCS4"
           annotation (Placement(transformation(
               extent={{-6,-6},{6,6}},
               origin={-54,-20})));
         Modelica.Blocks.Interfaces.RealInput angles[3]
          "angle_LotL & angle_LotW &angle_LH"
           annotation (Placement(transformation(extent={{-112,-26},{-100,-14}})));
          Modelica.Blocks.Interfaces.RealInput vector_rectangle[12]
          "length/width-direction and L_W_H"
            annotation (Placement(transformation(extent={{-8,-8},{8,8}},
                origin={-108,-94})));
          Modelica.Blocks.Interfaces.RealInput vector_cylinder[12]
          "length_direction and radius and half_length"
            annotation (Placement(transformation(extent={{-8,-8},{8,8}},
                origin={-108,-54})));
          Modelica.Mechanics.MultiBody.Parts.PointMass contact_point_cylinder(
            m=0,
            animation=Animation,
            sphereColor=Color_contact_point_cylinder,
            sphereDiameter=2*radiusContactPoint)
            annotation (Placement(transformation(extent={{-46,26},{-34,38}})));

          Real L_W_H[3] "length, width, height of rectangle";
          Real Length_Direction_R[3] "length direction rectangle";
          Real Width_Direction_R[3] "width direction rectangle";
          Real Height_Direction_R[3] "height direction rectangle";
          Real R_l[3] "radius and half-length cylinder";
          Real Length_Direction_C[3] "length direction cylinder";

        //-----variable used to assign offset of move-point---------------------
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

        //-----variable for contact detection-----------------------------------
          Real pos_l_rel
          "position offset contact point cylinder in length direction BCS2";
          Real pos_w_rel
          "position offset contact point cylinder in width direction BCS2";
          Real pos_h_rel
          "position offset contact point cylinder in height direction BCS2";
        //----------------------------------------------------------------------

        //-----variable to calculate contact force------------------------------
        //   Real pos_l_rel_c
        //     "position center of cylinder face side in length direction BCS2";
        //   Real pos_w_rel_c
        //     "position center of cylinder face side in width direction BCS2";
        //   Real pos_h_rel_c
        //     "position center of cylinder face side in height direction BCS2";

        //   Real v_rel[3] "relative velocity resolved in BCS2";
        //   Real v_r[3] "rotational velocity resolved in BCS2";
          Real r_ctc_BCS1a[3]
          "position contact point cylinder resolved in BCS1a";
          Real v_cf_BCS2[3]
          "velocity center of cylinder face side resolved in BCS2";
          Real v_ctc_BCS2[3] "velocity contact point cylinder resolved in BCS2";
          Real T_BCS12[3,3]
          "Transmation matrix from orientation objekt to rotate BCS1a into BCS4(BCS2)";
          Real v_rel_ct_BCS2[3]
          "relative velocity contact points resolved in BCS2";

          Real angles_absl_p[3]
          "absolute angles between BCS-planar and world frame";

          Real f_n "normal force in height direction BCS2";
          Real f_fl "friction in length direction BCS2";
          Real f_fw "friction in width direction BCS2";

          Real f_normal[3] "normal force resolved in BCS2";
          Real f_tangential[3] "friction resolved in BCS2";
        //----------------------------------------------------------------------

          IdealizedContact.Components.Utilities.variablePrism2  variablePrism
            annotation (Placement(transformation(extent={{-10,-10},{10,10}},
                rotation=180,
                origin={-26,-20})));
          Modelica.Mechanics.Translational.Sources.Position pos_offset(
            useSupport=true,
            f_crit=f,
            exact=exact)
                        annotation (Placement(transformation(
                extent={{-7,-7},{7,7}},
                rotation=180,
                origin={-25,-45})));
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
         Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a2
          "contact point on recangle surface BCS4 based on BCS2"
           annotation (Placement(transformation(extent={{-12,-12},{12,12}},
               rotation=90,
               origin={-64,102})));
         Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP_cm_l1(
             resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a) "test"
           annotation (Placement(transformation(
               extent={{-6,-6},{6,6}},
               rotation=180,
               origin={-22,12})));
         Modelica.Blocks.Interfaces.RealInput pos_ctc_BCS1a[3]
          "relativ position cylinder contact point resolved in BCS1a (from rP_p_lc)"
           annotation (Placement(transformation(extent={{-6,-6},{6,6}},
               origin={-106,92})));
        equation

          Length_Direction_R=deMultiplex3.y1;
          Width_Direction_R=deMultiplex3.y2;
          Height_Direction_R=deMultiplex3.y3;
          L_W_H=deMultiplex3.y4;
          Length_Direction_C=deMultiplex2.y1;
          R_l=deMultiplex2.y4;

          r_ctc_BCS1a = pos_ctc_BCS1a;
          v_cf_BCS2 = der(pos_rel_c_L);
          T_BCS12 = Modelica.Mechanics.MultiBody.Frames.to_T(Modelica.Mechanics.MultiBody.Frames.relativeRotation(frame_a1.R, frame_a2.R));

        //----------offset contact point cylinder----------------------------------------------------------------------------------------------------
          pos_rel_L=rP_cm_l.r_rel*Length_Direction_R;
          pos_rel_W=rP_cm_l.r_rel*Width_Direction_R;

          o_w=smooth(2,((abs(pos_rel_W)-L_W_H[2]/2)*(sign(abs(pos_rel_W)-L_W_H[2]/2)+1)/2)/(abs(cos((pi/2-angles[1])*sign(abs(pi/2-angles[1])-pi/2)))*cos(pi/2-angles[3])));
          o_l=smooth(2,((abs(pos_rel_L)-L_W_H[1]/2)*(sign(abs(pos_rel_L)-L_W_H[1]/2)+1)/2)/(abs(cos((pi/2-angles[2])*sign(abs(pi/2-angles[2])-pi/2)))*cos(pi/2-angles[3])));

          offset_l=smooth(2,max(o_w,o_l));
          offset_ll = smooth(2,if offset_l>2*R_l[2] then 2*R_l[2] else offset_l);

          pos_offset.s_ref=q*offset_ll;
          variablePrism.n=Length_Direction_C;
        //-------------------------------------------------------------------------------------------------------------------------------------------

        //----------contact specification------------------------------------------------------------------------------------------------------------
          pos_l_rel=rP_p_cpl.r_rel*Length_Direction_R;
          pos_w_rel=rP_p_cpl.r_rel*Width_Direction_R;
          pos_h_rel=rP_p_cpl.r_rel*Height_Direction_R;
          contact = ((pos_h_rel <= 0) and (pos_h_rel >= -t_max)) and ((abs(pos_l_rel)<=0.0001) and ((abs(pos_w_rel)<=0.0001)));
        //-------------------------------------------------------------------------------------------------------------------------------------------

        //----------relative velocity resolved in BCS2-------------------------------------
        //   pos_l_rel_c = pos_rel_c_L*x_direction;
        //   pos_w_rel_c = pos_rel_c_L*z_direction;
        //   pos_h_rel_c = pos_rel_c_L*y_direction;

        //   v_r[1]=w_rel*Width_Direction_R*R_l[1]
        //     "rotation velocity around width direction BCS2";
        //   v_r[2]=0 "rotation around height direction BCS2 is neglected";
        //   v_r[3]=w_rel*Length_Direction_R*R_l[1]
        //     "rotation velocity around length direction BCS2";
        //
        //   v_rel[1]=der(pos_l_rel_c)-v_r[1] "relative velocity in length direction BCS2";
        //   v_rel[2]=0 "v_rel in height direction BCS2 is neglected";
        //   v_rel[3]=der(pos_w_rel_c)-v_r[3] "relative velocity in width direction BCS2";
          v_ctc_BCS2 = v_cf_BCS2 + T_BCS12*cross(w_rel, r_ctc_BCS1a);
          v_rel_ct_BCS2 = zeros(3) - v_ctc_BCS2;

          angles_absl_p=aA.angles;
        //--------------------------------------------------------------------------------

        //----------force resolved in BCS4----------------------------------------------------------------------------------------------------
          if (contact) then
            //f_n = c*(pos_h_rel)+d*der(pos_h_rel);
            f_n = sign(pos_h_rel)*(c*abs(pos_h_rel)^n1)+d*abs(pos_h_rel)^n2*der(pos_h_rel);
            f_normal = -f_n*Height_Direction_R;

            //mue=gamma1*(tanh(gamma2*v_rel)-tanh(gamma3*v_rel))+gamma4*tanh(gamma5*v_rel)+gamma6*v_rel
        //     f_fl = (gamma1*(tanh(gamma2*v_rel[1])-tanh(gamma3*v_rel[1]))+gamma4*tanh(gamma5*v_rel[1])+gamma6*v_rel[1])*(f_n);//*cos(abs(angles_absl_p[3])) + mue_r*tanh(v_rel[1]*gamma2)*(f_n)*cos(abs(angles_absl_p[3]));
        //     f_fw = (gamma1*(tanh(gamma2*v_rel[3])-tanh(gamma3*v_rel[3]))+gamma4*tanh(gamma5*v_rel[3])+gamma6*v_rel[3])*(f_n);//*cos(abs(angles_absl_p[1])) + mue_r*tanh(v_rel[3]*gamma2)*(f_n)*cos(abs(angles_absl_p[1]));
            f_fl = (gamma1*(tanh(gamma2*v_rel_ct_BCS2[1])-tanh(gamma3*v_rel_ct_BCS2[1]))+gamma4*tanh(gamma5*v_rel_ct_BCS2[1])+gamma6*v_rel_ct_BCS2[1])*abs(f_n);
            f_fw = (gamma1*(tanh(gamma2*v_rel_ct_BCS2[3])-tanh(gamma3*v_rel_ct_BCS2[3]))+gamma4*tanh(gamma5*v_rel_ct_BCS2[3])+gamma6*v_rel_ct_BCS2[3])*abs(f_n);

            f_tangential = f_fl*Length_Direction_R +f_fw*Width_Direction_R;
          else
            f_n=0;
            f_fl=0;
            f_fw=0;
            f_normal = zeros(3);
            f_tangential = zeros(3);
          end if;

          f_l.force=f_normal+f_tangential;
        //-----------------------------------------------------------------------------------------------------------------------------------
         connect(aA.frame_a, frame_a3) annotation (Line(
             points={{20,-86},{0,-86},{0,-102}},
             color={95,95,95},
             thickness=0.5));
         connect(frame_a3, frame_a3) annotation (Line(
             points={{0,-102},{0,-102}},
             color={95,95,95},
             thickness=0.5));
          connect(rP_cm_l.frame_b, frame_a1) annotation (Line(
              points={{3.67394e-016,-68},{3.67394e-016,-20},{0,-20},{0,102}},
              color={95,95,95},
              thickness=0.5));
          connect(variablePrism.frame_b, f_l.frame_b) annotation (Line(
              points={{-36,-20},{-48,-20}},
              color={95,95,95},
              thickness=0.5));
          connect(vector_cylinder, deMultiplex2.u) annotation (Line(
              points={{-108,-54},{-95.2,-54}},
              color={0,0,127}));
          connect(vector_rectangle, deMultiplex3.u) annotation (Line(
              points={{-108,-94},{-95.2,-94}},
              color={0,0,127}));
          connect(f_l.frame_a, frame_a2) annotation (Line(
              points={{-60,-20},{-64,-20},{-64,102}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_p_cpl.frame_a, f_l.frame_a) annotation (Line(
              points={{-60,-46},{-64,-46},{-64,-20},{-60,-20}},
              color={95,95,95},
              thickness=0.5));
          connect(variablePrism.frame_a, frame_a1) annotation (Line(
              points={{-16,-20},{0,-20},{0,102}},
              color={95,95,95},
              thickness=0.5));
          connect(pos_offset.support, variablePrism.support) annotation (Line(
              points={{-25,-38},{-24,-38},{-24,-26},{-22,-26}},
              color={0,0,0}));
          connect(variablePrism.axis, pos_offset.flange) annotation (Line(
              points={{-34,-26},{-34,-45},{-32,-45}},
              color={0,127,0}));
          connect(rP_p_cpl.frame_b, f_l.frame_b) annotation (Line(
              points={{-48,-46},{-40,-46},{-40,-20},{-48,-20}},
              color={95,95,95},
              thickness=0.5));
          connect(contact_point_cylinder.frame_a, variablePrism.frame_b)
            annotation (Line(
              points={{-40,32},{-40,-20},{-36,-20}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_cm_l.frame_a, frame_a3) annotation (Line(
              points={{-3.67394e-016,-80},{0,-80},{0,-102}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_cm_l1.frame_b, variablePrism.frame_b) annotation (Line(
              points={{-28,12},{-40,12},{-40,-20},{-36,-20}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_cm_l1.frame_a, frame_a1) annotation (Line(
              points={{-16,12},{0,12},{0,102}},
              color={95,95,95},
              thickness=0.5));
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
                origin={-108,20})));
          Modelica.Blocks.Interfaces.RealInput vector_circle[12]
            annotation (Placement(transformation(extent={{-8,-8},{8,8}},
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
              thickness=0.5));
          connect(tansformRelativeVector.frame_b,frame_a2)  annotation (Line(
              points={{-72,6},{-72,60},{-102,60}},
              color={95,95,95},
              thickness=0.5));
          connect(tansformRelativeVector.frame_a,frame_a1)  annotation (Line(
              points={{-72,-6},{-72,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_c_cymp.frame_a, frame_a1) annotation (Line(
              points={{-4,-82},{-32,-82},{-32,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_cc_mpr.frame_a, frame_a2) annotation (Line(
              points={{50,6},{50,60},{-102,60}},
              color={95,95,95},
              thickness=0.5));
          connect(variablePrism_cy.frame_a, frame_a2) annotation (Line(
              points={{-32,50},{-32,60},{-102,60}},
              color={95,95,95},
              thickness=0.5));
          connect(variablePrism_cy.frame_b, rP_p_lc.frame_b) annotation (Line(
              points={{-32,30},{-32,6}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_cr_cy.frame_a, frame_a1) annotation (Line(
              points={{-52,-6},{-52,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_cr_cy.frame_b, frame_a2) annotation (Line(
              points={{-52,6},{-52,60},{-102,60}},
              color={95,95,95},
              thickness=0.5));
          connect(variablePrism_cy1.frame_b, frame_b2) annotation (Line(
              points={{78,60},{102,60}},
              color={95,95,95},
              thickness=0.5));
          connect(variablePrism_cy1.frame_a, frame_a2) annotation (Line(
              points={{62,60},{-102,60}},
              color={95,95,95},
              thickness=0.5));
          connect(variableRevol_2.frame_b, variablePrism_rt2.frame_a) annotation (Line(
              points={{22,-60},{30,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(variableRevol_1.frame_b, variableRevol_2.frame_a) annotation (Line(
              points={{0,-60},{10,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(variablePrism_rt1.frame_b, variableRevol_1.frame_a) annotation (Line(
              points={{-20,-60},{-12,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(variablePrism_rt1.frame_a, frame_a1) annotation (Line(
              points={{-32,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_cc_mpr.frame_b, variablePrism_rt2.frame_b) annotation (Line(
              points={{50,-6},{50,-60},{42,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(variablePrism_rt2.frame_b, rP_c_cymp.frame_b) annotation (Line(
              points={{42,-60},{50,-60},{50,-82},{8,-82}},
              color={95,95,95},
              thickness=0.5));
          connect(deMultiplex2.u, vector_cylinder) annotation (Line(
              points={{-97.2,20},{-108,20}},
              color={0,0,127}));
          connect(deMultiplex3.u, vector_circle) annotation (Line(
              points={{-97.2,-20},{-108,-20}},
              color={0,0,127}));
          connect(filter.u, angle_LotDW.angle) annotation (Line(
              points={{-22,90},{-34,90},{-34,95},{-40,95}},
              color={0,0,127}));
          connect(aAV.frame_b, variablePrism_cy1.frame_b)  annotation (Line(
              points={{92,16},{92,60},{78,60}},
              color={95,95,95},
              thickness=0.5));
          connect(aAV.frame_a, variablePrism_cy.frame_b)  annotation (Line(
              points={{80,16},{-32,16},{-32,30}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_ctc_BCS1a.frame_a, variablePrism_cy.frame_b) annotation (Line(
              points={{-2,24},{-32,24},{-32,30}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_ctc_BCS1a.frame_b, variablePrism_cy1.frame_b) annotation (Line(
              points={{10,24},{78,24},{78,60}},
              color={95,95,95},
              thickness=0.5));
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
               origin={-106,58})));
      public
         Modelica.Blocks.Interfaces.BooleanOutput contact annotation (Placement(
               transformation(
               extent={{-7,-7},{7,7}},
               origin={107,61})));
         Modelica.Blocks.Interfaces.RealInput angles[3]
          "angle_cyL_mp(angles between cylinder length direction and relative position cylinder movepoint resolved in BCS circle) & angle_LotDW & angle_LH"
           annotation (Placement(transformation(extent={{-112,-28},{-100,-16}})));
          Modelica.Blocks.Interfaces.RealInput vector_circle[12]
            annotation (Placement(transformation(extent={{-8,-8},{8,8}},
                origin={-108,-94})));
          Modelica.Blocks.Interfaces.RealInput vector_cylinder[12]
          "length_direction and radius and half_length"
            annotation (Placement(transformation(extent={{-8,-8},{8,8}},
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
             thickness=0.5));
         connect(frame_a3,frame_a3)  annotation (Line(
             points={{0,-102},{0,-102}},
             color={95,95,95},
             thickness=0.5));
          connect(rP_p_cpl.frame_a,frame_a3)  annotation (Line(
              points={{60,-46},{60,-60},{0,-60},{0,-102}},
              color={95,95,95},
              thickness=0.5));
          connect(f_l.frame_a,frame_a3)  annotation (Line(
              points={{80,-46},{80,-60},{0,-60},{0,-102}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_cm_l.frame_a, frame_a3) annotation (Line(
              points={{-3.67394e-016,-46},{0,-46},{0,-102}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_cm_l.frame_b, frame_a1) annotation (Line(
              points={{3.67394e-016,-34},{0,-34},{0,102}},
              color={95,95,95},
              thickness=0.5));
          connect(contact_point_cylinder.frame_a, f_l.frame_b)
                                                   annotation (Line(
              points={{78,-6},{80,-6},{80,-34}},
              color={95,95,95},
              thickness=0.5));
          connect(pos_offset.support,variablePrism. support) annotation (Line(
              points={{27,-8},{26,-8},{26,-14}},
              color={0,0,0}));
          connect(pos_offset.flange, variablePrism.axis) annotation (Line(
              points={{34,-1},{36,-1},{36,-14},{38,-14}},
              color={0,127,0}));
          connect(variablePrism.frame_b, rP_p_cpl.frame_b) annotation (Line(
              points={{40,-20},{60,-20},{60,-34}},
              color={95,95,95},
              thickness=0.5));
          connect(f_l.frame_b, variablePrism.frame_b) annotation (Line(
              points={{80,-34},{80,-20},{40,-20}},
              color={95,95,95},
              thickness=0.5));
          connect(variablePrism.frame_a, frame_a1) annotation (Line(
              points={{20,-20},{0,-20},{0,102}},
              color={95,95,95},
              thickness=0.5));
          connect(deMultiplex2.u, vector_cylinder) annotation (Line(
              points={{-95.2,-54},{-108,-54}},
              color={0,0,127}));
          connect(deMultiplex3.u, vector_circle) annotation (Line(
              points={{-95.2,-94},{-108,-94}},
              color={0,0,127}));
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
                origin={-102,60})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a2
          "center of mass cylinder2 BCS2"
                                  annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
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
                origin={-108,-20})));
          Modelica.Blocks.Interfaces.RealInput vector_cylinder1[12]
          "length_direction and radius and half_length"
            annotation (Placement(transformation(extent={{-8,-8},{8,8}},
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
            annotation (Placement(transformation(extent={{-24,12},{-8,28}})));
          IdealizedContact.Components.Utilities.variablePrism1 variablePrism_l_cy2
          "offset from point on cylinder2 surface along L-direction to face side resolved in BCS2"
            annotation (Placement(transformation(extent={{-8,-8},{8,8}},
                rotation=180,
                origin={8,-20})));
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
                origin={10,20})));
          Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP1_cy2(resolveInFrame=
                Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
            annotation (Placement(transformation(
                extent={{-6,-6},{6,6}},
                origin={-18,-20})));
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
           IdealizedContact.Components.Utilities.PointMassVarAnimation
                                                       move_point_cylinder7(
            m=0,
            animation=animation,
            sphereColor=Color_contact_point_cylinder2,
            sphereDiameter=2*radiusContactPoint)
          "contact point cylinder2 after second correction"
            annotation (Placement(transformation(extent={{80,-120},{100,-100}})));
           IdealizedContact.Components.Utilities.PointMassVarAnimation
                                                       move_point_cylinder8(
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
              thickness=0.5));
          connect(rP_c2_c1.frame_a, frame_a2) annotation (Line(
              points={{-68,-6},{-68,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_c1_c2.frame_a, frame_a1) annotation (Line(
              points={{-50,6},{-50,20},{-68,20},{-68,60},{-102,60}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_c1_c2.frame_b, frame_a2) annotation (Line(
              points={{-50,-6},{-50,-20},{-68,-20},{-68,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(variablePrism_1.frame_a, frame_a1) annotation (Line(
              points={{-60,60},{-102,60}},
              color={95,95,95},
              thickness=0.5));
          connect(variablePrism_2.frame_a, frame_a2) annotation (Line(
              points={{-60,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(rP2_cy1.frame_b, variablePrism_l_cy1.frame_b) annotation (Line(
              points={{4,20},{-8,20}},
              color={95,95,95},
              thickness=0.5));
          connect(rP1_cy2.frame_b, variablePrism_l_cy2.frame_b) annotation (Line(
              points={{-12,-20},{0,-20}},
              color={95,95,95},
              thickness=0.5));
          connect(rP1_cy2.frame_a, variablePrism_1.frame_b) annotation (Line(
              points={{-24,-20},{-24,60},{-44,60}},
              color={95,95,95},
              thickness=0.5));
          connect(variablePrism_l_cy1.frame_a, variablePrism_1.frame_b) annotation (
              Line(
              points={{-24,20},{-24,60},{-44,60}},
              color={95,95,95},
              thickness=0.5));
          connect(deMultiplex1.u, vector_cylinder1) annotation (Line(
              points={{-93.2,20},{-108,20}},
              color={0,0,127}));
          connect(deMultiplex2.u, vector_cylinder2) annotation (Line(
              points={{-93.2,-20},{-108,-20}},
              color={0,0,127}));
          connect(tansformVectorCylinder1.frame_a, frame_a1) annotation (Line(
              points={{-86,70},{-86,60},{-102,60}},
              color={95,95,95},
              thickness=0.5));
          connect(tansformVectorCylinder2.frame_a, frame_a2) annotation (Line(
              points={{-86,-50},{-86,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5));

          connect(variablePrism_l_cy2.frame_a, variablePrism_2.frame_b) annotation (
              Line(
              points={{16,-20},{16,-20},{22,-20},{22,-20},{22,-20},{22,-60},{
                  -44,-60}},
              color={95,95,95},
              thickness=0.5));

          connect(move_point_cylinder8.frame_a, frame_b1) annotation (Line(
              points={{90,110},{90,60},{102,60}},
              color={95,95,95},
              thickness=0.5));
          connect(move_point_cylinder7.frame_a, frame_b2) annotation (Line(
              points={{90,-110},{90,-60},{102,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(variablePrism_ll_cy1.frame_b, frame_b1) annotation (Line(
              points={{60,60},{102,60}},
              color={95,95,95},
              thickness=0.5));
          connect(variablePrism_ll_cy1.frame_a, variablePrism_1.frame_b) annotation (
              Line(
              points={{40,60},{-44,60}},
              color={95,95,95},
              thickness=0.5));
          connect(variablePrism_ll_cy2.frame_b, frame_b2) annotation (Line(
              points={{60,-60},{102,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(variablePrism_ll_cy2.frame_a, variablePrism_2.frame_b) annotation (
              Line(
              points={{40,-60},{-44,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(variablePrism_l_cy2.frame_a, rP2_cy1.frame_a) annotation (Line(
              points={{16,-20},{22,-20},{22,20},{16,20}},
              color={95,95,95},
              thickness=0.5));
          connect(position2.support, variablePrism_ll_cy2.support) annotation (Line(
              points={{48,-50},{48,-54},{46,-54}},
              color={0,0,0}));
          connect(position2.flange, variablePrism_ll_cy2.axis) annotation (Line(
              points={{58,-40},{60,-40},{60,-54},{58,-54}},
              color={0,127,0}));
          connect(position1.flange, variablePrism_ll_cy1.axis) annotation (Line(
              points={{56,84},{58,84},{58,66}},
              color={0,127,0}));
          connect(position1.support, variablePrism_ll_cy1.support) annotation (Line(
              points={{46,74},{46,66}},
              color={0,0,0}));
          annotation (Diagram(coordinateSystem(extent={{-100,-120},{100,140}},
                  preserveAspectRatio=true)), Icon(coordinateSystem(extent={{-100,
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
                origin={-102,60})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a2
          "center of mass cylinder2 in BCS3"
                                  annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                origin={-102,-60})));
          Modelica.Blocks.Interfaces.RealInput vector_cylinder2[12]
          "length_direction and radius and half_length"
            annotation (Placement(transformation(extent={{-8,-8},{8,8}},
                origin={-108,-20})));
          Modelica.Blocks.Interfaces.RealInput vector_cylinder1[12]
          "length_direction and radius and half_length"
            annotation (Placement(transformation(extent={{-8,-8},{8,8}},
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

         Boolean contact;

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
        //     "absolut anglulat velocity center of cylinder1 around length direction resolved in BCS2";
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

          Modelica.Mechanics.MultiBody.Sensors.AbsoluteAngularVelocity aAV1(
              resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameA.frame_resolve)
          "anglulat velocity contact point cylinder1 resolved in BCS1"
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
          "anglulat velocity contact point cylinder1 resolved in BCS1"
            annotation (Placement(transformation(extent={{-6,-6},{6,6}},
                rotation=270,
                origin={-20,-60})));
         Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP_ct1_BCS1(
              resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "relativ position contact point cylinder1 resolved in BCS1"
           annotation (Placement(transformation(
               extent={{-6,-6},{6,6}},
               origin={54,26})));
         Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP_ct2_BCS2(
              resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "relativ position contact point cylinder2 resolved in BCS2"
           annotation (Placement(transformation(
               extent={{-6,-6},{6,6}},
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
              thickness=0.5));
          connect(rP_mp12.frame_b, frame_a4)    annotation (Line(
              points={{16,70},{40,70},{40,102}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_c12.frame_a, frame_a2) annotation (Line(
              points={{-68,-6},{-68,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_c12.frame_b, frame_a1) annotation (Line(
              points={{-68,6},{-68,60},{-102,60}},
              color={95,95,95},
              thickness=0.5));
          connect(force.frame_a, frame_a3) annotation (Line(
              points={{4,88},{-20,88},{-20,102}},
              color={95,95,95},
              thickness=0.5));
          connect(force.frame_b, frame_a4) annotation (Line(
              points={{16,88},{40,88},{40,102}},
              color={95,95,95},
              thickness=0.5));
          connect(deMultiplex1.u, vector_cylinder1) annotation (Line(
              points={{-91.2,20},{-108,20}},
              color={0,0,127}));
          connect(deMultiplex2.u, vector_cylinder2) annotation (Line(
              points={{-91.2,-20},{-108,-20}},
              color={0,0,127}));
          connect(aAV1.frame_a, frame_a4) annotation (Line(
              points={{40,66},{40,102}},
              color={95,95,95},
              thickness=0.5));
          connect(aAV1.frame_resolve, frame_a1) annotation (Line(
              points={{33.94,60},{-102,60}},
              color={95,95,95},
              pattern=LinePattern.Dot));
          connect(aAV2.frame_resolve, frame_a2) annotation (Line(
              points={{-26.06,-60},{-102,-60}},
              color={95,95,95},
              pattern=LinePattern.Dot));
          connect(aAV2.frame_a, frame_a3) annotation (Line(
              points={{-20,-54},{-20,102}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_ct2_BCS2.frame_a, frame_a2) annotation (Line(
              points={{-50,-36},{-50,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_ct2_BCS2.frame_b, frame_a3) annotation (Line(
              points={{-38,-36},{-20,-36},{-20,102}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_ct1_BCS1.frame_a, frame_a1) annotation (Line(
              points={{48,26},{-68,26},{-68,60},{-102,60}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_ct1_BCS1.frame_b, frame_a4) annotation (Line(
              points={{60,26},{62,26},{62,102},{40,102}},
              color={95,95,95},
              thickness=0.5));
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
                origin={-80,60})));
          Modelica.Mechanics.MultiBody.Sensors.TansformAbsoluteVector tansformVectorCy2(
              frame_r_in=Modelica.Mechanics.MultiBody.Types.ResolveInFrameA.frame_a,
              frame_r_out=Modelica.Mechanics.MultiBody.Types.ResolveInFrameA.world)
          "Transformation length-direction cylinder2 from BCS2 to ICS"
            annotation (Placement(transformation(
                extent={{-8,-8},{8,8}},
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
           IdealizedContact.Components.Utilities.PointMassVarAnimation
                                                       pointMass(
            m=0,
            animation=animation,
            sphereColor=Color_contact_point_cylinder1,
            sphereDiameter=2*radiusContactPoint)
            annotation (Placement(transformation(extent={{50,20},{70,40}})));
           IdealizedContact.Components.Utilities.PointMassVarAnimation
                                                       pointMass1(
            m=0,
            animation=animation,
            sphereColor=Color_contact_point_cylinder2,
            sphereDiameter=2*radiusContactPoint)
            annotation (Placement(transformation(extent={{50,-42},{70,-22}})));
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
                origin={-102,60}), iconTransformation(extent={{-374,128},{-354,
                    148}})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a2
          "center of mass cylinder2 BCS2"
                                  annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
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
                origin={-368,-24})));
          Modelica.Blocks.Interfaces.RealInput vector_cylinder1[12]
          "length_direction and radius and half_length"
            annotation (Placement(transformation(extent={{-8,-8},{8,8}},
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
              color={0,0,127}));
          connect(deMultiplex2.u,vector_cylinder2)  annotation (Line(
              points={{-345.2,-26},{-356,-26},{-356,-24},{-368,-24}},
              color={0,0,127}));
          connect(tansformVectorCy1.frame_a,frame_a1)        annotation (Line(
              points={{-88,60},{-102,60}},
              color={95,95,95},
              thickness=0.5));
          connect(tansformVectorCy2.frame_a,frame_a2)        annotation (Line(
              points={{-88,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_ins1_ins2.frame_a,bt_ins_cy1. frame_b) annotation (Line(
              points={{-20,10},{-20,50},{-20,50},{-20,90}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_ins1_ins2.frame_b,bt_ins_cy2. frame_b) annotation (Line(
              points={{-20,-10},{-20,-48},{-20,-48},{-20,-86}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_ins2_ins1.frame_b,bt_ins_cy1. frame_b) annotation (Line(
              points={{-48,10},{-20,10},{-20,90}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_ins2_ins1.frame_a,bt_ins_cy2. frame_b) annotation (Line(
              points={{-48,-10},{-20,-10},{-20,-86}},
              color={95,95,95},
              thickness=0.5));
          connect(cm_auxp1_cy1.frame_b,auxp1_auxcp1_cy1. frame_a)    annotation (Line(
              points={{-68,128},{-40,128}},
              color={95,95,95},
              thickness=0.5));
          connect(cm_auxp1_cy2.frame_b,auxp1_auxcp1_cy2. frame_a)    annotation (Line(
              points={{-66,-128},{-40,-128}},
              color={95,95,95},
              thickness=0.5));
          connect(cm_auxp1_cy2.frame_a,frame_a2)  annotation (Line(
              points={{-86,-128},{-102,-128},{-102,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(cm_auxp1_cy1.frame_a,frame_a1)  annotation (Line(
              points={{-88,128},{-102,128},{-102,60}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_ins1_c2.frame_a,frame_a2)  annotation (Line(
              points={{-138,-10},{-138,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_ins2_c1.frame_a,frame_a1)  annotation (Line(
              points={{-172,10},{-172,60},{-102,60}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_auxp1cy1_auxp1cy2.frame_b,cm_auxp1_cy1. frame_b) annotation (Line(
              points={{-200,10},{-200,140},{-68,140},{-68,128}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_auxp1cy1_auxp1cy2.frame_a,cm_auxp1_cy2. frame_b) annotation (Line(
              points={{-200,-10},{-200,-144},{-66,-144},{-66,-128}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_auxp1cy2_auxp1cy1.frame_a,rP_auxp1cy1_auxp1cy2. frame_b)
            annotation (Line(
              points={{-232,10},{-200,10}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_auxp1cy2_auxp1cy1.frame_b,rP_auxp1cy1_auxp1cy2. frame_a)
            annotation (Line(
              points={{-232,-10},{-200,-10}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_ins1_c2.frame_b,bt_ins_cy1. frame_b) annotation (Line(
              points={{-138,10},{-138,112},{-20,112},{-20,90}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_ins2_c1.frame_b,bt_ins_cy2. frame_b) annotation (Line(
              points={{-172,-10},{-172,-108},{-20,-108},{-20,-86}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_auxcp1cy1_c2.frame_b,auxp1_auxcp1_cy1. frame_b)    annotation (
              Line(
              points={{-266,10},{-266,140},{-20,140},{-20,128}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_auxcp1cy1_c2.frame_a,frame_a2)  annotation (Line(
              points={{-266,-10},{-266,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_auxcp1cy2_c1.frame_a,frame_a1)  annotation (Line(
              points={{-300,10},{-300,60},{-102,60}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_auxcp1cy2_c1.frame_b,auxp1_auxcp1_cy2. frame_b)    annotation (
              Line(
              points={{-300,-10},{-300,-144},{-20,-144},{-20,-128}},
              color={95,95,95},
              thickness=0.5));
          connect(auxp2_cp_cy1.frame_a,cm_auxp2_cy1. frame_b)        annotation (Line(
              points={{-40,160},{-68,160}},
              color={95,95,95},
              thickness=0.5));
          connect(cm_auxp2_cy1.frame_a,frame_a1)  annotation (Line(
              points={{-88,160},{-102,160},{-102,60}},
              color={95,95,95},
              thickness=0.5));
          connect(auxp2_cp_cy2.frame_a,cm_auxp2_cy2. frame_b)        annotation (Line(
              points={{-40,-164},{-66,-164}},
              color={95,95,95},
              thickness=0.5));
          connect(cm_auxp2_cy2.frame_a,frame_a2)  annotation (Line(
              points={{-86,-164},{-102,-164},{-102,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(frame_b1,auxp2_cp_cy1. frame_b)        annotation (Line(
              points={{200,124},{20,124},{20,160},{-20,160}},
              color={95,95,95},
              thickness=0.5));
          connect(frame_b2,auxp2_cp_cy2. frame_b)        annotation (Line(
              points={{198,-140},{20,-140},{20,-164},{-20,-164}},
              color={95,95,95},
              thickness=0.5));
          connect(cm_bt_cy1.frame_b, bt_ins_cy1.frame_a) annotation (Line(
              points={{-66,90},{-40,90}},
              color={95,95,95},
              thickness=0.5));
          connect(cm_bt_cy1.frame_a, frame_a1) annotation (Line(
              points={{-86,90},{-102,90},{-102,60}},
              color={95,95,95},
              thickness=0.5));
          connect(absP_bt_cy1.frame_a, cm_bt_cy1.frame_b) annotation (Line(
              points={{-60,68},{-60,90},{-66,90}},
              color={95,95,95},
              thickness=0.5));
          connect(pointMass.frame_a, frame_b1) annotation (Line(
              points={{60,30},{60,124},{200,124}},
              color={95,95,95},
              thickness=0.5));
          connect(cm_bt_cy2.frame_b, bt_ins_cy2.frame_a) annotation (Line(
              points={{-66,-86},{-40,-86}},
              color={95,95,95},
              thickness=0.5));
          connect(cm_bt_cy2.frame_a, frame_a2) annotation (Line(
              points={{-86,-86},{-102,-86},{-102,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(absP_bt_cy2.frame_a, cm_bt_cy2.frame_b) annotation (Line(
              points={{-60,-60},{-60,-86},{-66,-86}},
              color={95,95,95},
              thickness=0.5));
          connect(pointMass1.frame_a, frame_b2) annotation (Line(
              points={{60,-32},{60,-140},{198,-140}},
              color={95,95,95},
              thickness=0.5));
          annotation (Diagram(coordinateSystem(extent={{-360,-180},{200,180}},
                  preserveAspectRatio=false)), Icon(coordinateSystem(extent={{-360,
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
               origin={10,58})));
          Modelica.Mechanics.MultiBody.Sensors.AbsoluteAngularVelocity aAV1(
              resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameA.frame_resolve)
          "anglulat velocity contact point cylinder1 resolved in BCS1"
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
                origin={-102,60})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a2
          "center of mass cylinder2 in BCS2"
                                  annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                origin={-102,-60})));
          Modelica.Blocks.Interfaces.RealInput vector_cylinder2[12]
          "length_direction and radius and half_length"
            annotation (Placement(transformation(extent={{-8,-8},{8,8}},
                origin={-108,-20})));
          Modelica.Blocks.Interfaces.RealInput vector_cylinder1[12]
          "length_direction and radius and half_length"
            annotation (Placement(transformation(extent={{-8,-8},{8,8}},
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

         Boolean contact;

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
        //     "absolut anglulat velocity center of cylinder1 around length direction resolved in BCS2";
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
          "anglulat velocity contact point cylinder1 resolved in BCS1"
            annotation (Placement(transformation(extent={{-6,-6},{6,6}},
                rotation=270,
                origin={-20,-60})));
         Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP_ct2_BCS2(
              resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "relativ position contact point cylinder2 resolved in BCS2"
           annotation (Placement(transformation(
               extent={{-6,-6},{6,6}},
               origin={-44,-36})));
         Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP_ct1_BCS1(
              resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "relativ position contact point cylinder1 resolved in BCS1"
           annotation (Placement(transformation(
               extent={{-6,-6},{6,6}},
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
              thickness=0.5));
          connect(rP_mp12.frame_b,frame_a4)     annotation (Line(
              points={{16,58},{40,58},{40,102}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_c12.frame_a,frame_a2)  annotation (Line(
              points={{-68,-6},{-68,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_c12.frame_b,frame_a1)  annotation (Line(
              points={{-68,6},{-68,60},{-102,60}},
              color={95,95,95},
              thickness=0.5));
          connect(force.frame_a,frame_a3)  annotation (Line(
              points={{4,80},{-20,80},{-20,102}},
              color={95,95,95},
              thickness=0.5));
          connect(force.frame_b,frame_a4)  annotation (Line(
              points={{16,80},{40,80},{40,102}},
              color={95,95,95},
              thickness=0.5));
          connect(deMultiplex1.u,vector_cylinder1)  annotation (Line(
              points={{-91.2,20},{-108,20}},
              color={0,0,127}));
          connect(deMultiplex2.u,vector_cylinder2)  annotation (Line(
              points={{-91.2,-20},{-108,-20}},
              color={0,0,127}));
          connect(aAV1.frame_a, frame_a4)
                                         annotation (Line(
              points={{40,44},{40,102}},
              color={95,95,95},
              thickness=0.5));
          connect(aAV1.frame_resolve, frame_a1)
                                               annotation (Line(
              points={{33.94,38},{-34,38},{-34,60},{-102,60}},
              color={95,95,95},
              pattern=LinePattern.Dot));
          connect(aAV2.frame_a, frame_a3) annotation (Line(
              points={{-20,-54},{-20,102}},
              color={95,95,95},
              thickness=0.5));
          connect(aAV2.frame_resolve, frame_a2) annotation (Line(
              points={{-26.06,-60},{-102,-60}},
              color={95,95,95},
              pattern=LinePattern.Dot));
          connect(rP_ct2_BCS2.frame_b, frame_a3) annotation (Line(
              points={{-38,-36},{-20,-36},{-20,102}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_ct2_BCS2.frame_a, frame_a2) annotation (Line(
              points={{-50,-36},{-68,-36},{-68,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_ct1_BCS1.frame_a, frame_a1) annotation (Line(
              points={{34,12},{-34,12},{-34,60},{-102,60}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_ct1_BCS1.frame_b, frame_a4) annotation (Line(
              points={{46,12},{64,12},{64,102},{40,102}},
              color={95,95,95},
              thickness=0.5));
        end ForceCylinderToCylinderPoint;
         annotation(preferredView="info");
      end Components;
       annotation(preferredView="info",
                  preferredView="info");
    end LinearContact;

    package PlanarContact
      extends Modelica.Icons.Package;
      model RectangleToRectangle
        extends IdealizedContact.Components.PartialContactBlock;
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
        outer parameter Boolean exact;
        outer parameter SI.Frequency f;

        outer parameter Boolean animation;
        outer parameter Modelica.SIunits.Radius radiusContactPoint;
        outer parameter Modelica.Mechanics.MultiBody.Types.Color
          colorContactPoints1;
        outer parameter Modelica.Mechanics.MultiBody.Types.Color
          colorContactPoints2;

    protected
        parameter Real N1 = if n1==0 then Modelica.Constants.eps else n1;//to avoid mathematical error in case of 0^0
        parameter Real N2 = if n2==0 then Modelica.Constants.eps else n2;

    public
        IdealizedContact.ContactBlock.PlanarContact.Components.MovePointRectangleToRectangle
                                                  move_point_rectangle_rectangle[4](
          q_L={1,-1,-1,1},
          q_W={1,1,-1,-1},
          f={f,f,f,f},
          exact={exact,exact,exact,exact})
          annotation (Placement(transformation(extent={{-60,6},{0,66}})));
        IdealizedContact.ContactBlock.PlanarContact.Components.ForceRectangleToRectangle
                                             force_rectangle_rectangle[4](
          d={dampingCoefficient,dampingCoefficient,dampingCoefficient,dampingCoefficient},
          n1={N1,N1,N1,N1},
          n2={N2,N2,N2,N2},
          t_max={p_max,p_max,p_max,
              p_max},
          q_l={-1,1,1,-1},
          q_w={-1,-1,1,1},
          c={springCoefficient,springCoefficient,springCoefficient,
              springCoefficient},
          f={f,f,f,f},
          Animation={animation,animation,animation,animation},
          exact={exact,exact,exact,exact},
          radiusContactPoint={radiusContactPoint,radiusContactPoint,
              radiusContactPoint,radiusContactPoint},
          Color_contact_point_rectangle1={colorContactPoints1,
              colorContactPoints1,colorContactPoints1,
              colorContactPoints1},
          Color_contact_point_rectangle2={colorContactPoints2,
              colorContactPoints2,colorContactPoints2,
              colorContactPoints2},
          gamma1={gamma1,gamma1,gamma1,gamma1},
          gamma2={gamma2,gamma2,gamma2,gamma2},
          gamma3={gamma3,gamma3,gamma3,gamma3},
          gamma4={gamma4,gamma4,gamma4,gamma4},
          gamma5={gamma5,gamma5,gamma5,gamma5},
          gamma6={gamma6,gamma6,gamma6,gamma6})
          annotation (Placement(transformation(extent={{-60,-66},{0,-6}})));

      equation
        connect(move_point_rectangle_rectangle.frame_b1,
          force_rectangle_rectangle.frame_a2) annotation (Line(
            points={{-12,5.4},{-12,-5.4}},
            color={95,95,95},
            thickness=0.5));
        connect(move_point_rectangle_rectangle[1].frame_a1, frame_a) annotation (Line(
            points={{-60.6,60},{-102,60}},
            color={95,95,95},
            thickness=0.5));
        connect(move_point_rectangle_rectangle[2].frame_a1, frame_a) annotation (Line(
            points={{-60.6,60},{-102,60}},
            color={95,95,95},
            thickness=0.5));
        connect(move_point_rectangle_rectangle[3].frame_a1, frame_a) annotation (Line(
            points={{-60.6,60},{-102,60}},
            color={95,95,95},
            thickness=0.5));
        connect(move_point_rectangle_rectangle[4].frame_a1, frame_a) annotation (Line(
            points={{-60.6,60},{-102,60}},
            color={95,95,95},
            thickness=0.5));
        connect(move_point_rectangle_rectangle[1].vector_b, vector_1) annotation (
            Line(
            points={{-62.4,42},{-92,42},{-92,10},{-108,10}},
            color={0,0,127}));
        connect(move_point_rectangle_rectangle[2].vector_b, vector_1) annotation (
            Line(
            points={{-62.4,42},{-92,42},{-92,10},{-108,10}},
            color={0,0,127}));
        connect(move_point_rectangle_rectangle[3].vector_b, vector_1) annotation (
            Line(
            points={{-62.4,42},{-92,42},{-92,10},{-108,10}},
            color={0,0,127}));
        connect(move_point_rectangle_rectangle[4].vector_b, vector_1) annotation (
            Line(
            points={{-62.4,42},{-92,42},{-92,10},{-108,10}},
            color={0,0,127}));
        connect(force_rectangle_rectangle[1].vector_b, vector_1) annotation (Line(
            points={{-62.4,-24},{-92,-24},{-92,10},{-108,10}},
            color={0,0,127}));
        connect(force_rectangle_rectangle[2].vector_b, vector_1) annotation (Line(
            points={{-62.4,-24},{-92,-24},{-92,10},{-108,10}},
            color={0,0,127}));
        connect(force_rectangle_rectangle[3].vector_b, vector_1) annotation (Line(
            points={{-62.4,-24},{-92,-24},{-92,10},{-108,10}},
            color={0,0,127}));
        connect(force_rectangle_rectangle[4].vector_b, vector_1) annotation (Line(
            points={{-62.4,-24},{-92,-24},{-92,10},{-108,10}},
            color={0,0,127}));
        connect(force_rectangle_rectangle[1].vector_q, vector_2) annotation (Line(
            points={{-62.4,-48},{-84,-48},{-84,-30},{-108,-30}},
            color={0,0,127}));
        connect(force_rectangle_rectangle[2].vector_q, vector_2) annotation (Line(
            points={{-62.4,-48},{-84,-48},{-84,-30},{-108,-30}},
            color={0,0,127}));
        connect(force_rectangle_rectangle[3].vector_q, vector_2) annotation (Line(
            points={{-62.4,-48},{-84,-48},{-84,-30},{-108,-30}},
            color={0,0,127}));
        connect(force_rectangle_rectangle[4].vector_q, vector_2) annotation (Line(
            points={{-62.4,-48},{-84,-48},{-84,-30},{-108,-30}},
            color={0,0,127}));
        connect(vector_2, move_point_rectangle_rectangle[1].vector_q)
          annotation (Line(
            points={{-108,-30},{-84,-30},{-84,24},{-62.4,24}},
            color={0,0,127}));
        connect(vector_2, move_point_rectangle_rectangle[2].vector_q)
          annotation (Line(
            points={{-108,-30},{-84,-30},{-84,24},{-62.4,24}},
            color={0,0,127}));
        connect(vector_2, move_point_rectangle_rectangle[3].vector_q)
          annotation (Line(
            points={{-108,-30},{-84,-30},{-84,24},{-62.4,24}},
            color={0,0,127}));
        connect(vector_2, move_point_rectangle_rectangle[4].vector_q)
          annotation (Line(
            points={{-108,-30},{-84,-30},{-84,24},{-62.4,24}},
            color={0,0,127}));
        connect(frame_b, move_point_rectangle_rectangle[1].frame_a2)
          annotation (Line(
            points={{-102,-60},{-74,-60},{-74,12},{-60.6,12}},
            color={95,95,95},
            thickness=0.5));
        connect(frame_b, move_point_rectangle_rectangle[2].frame_a2)
          annotation (Line(
            points={{-102,-60},{-74,-60},{-74,12},{-60.6,12}},
            color={95,95,95},
            thickness=0.5));
        connect(frame_b, move_point_rectangle_rectangle[3].frame_a2)
          annotation (Line(
            points={{-102,-60},{-74,-60},{-74,12},{-60.6,12}},
            color={95,95,95},
            thickness=0.5));
        connect(frame_b, move_point_rectangle_rectangle[4].frame_a2)
          annotation (Line(
            points={{-102,-60},{-74,-60},{-74,12},{-60.6,12}},
            color={95,95,95},
            thickness=0.5));
        connect(move_point_rectangle_rectangle.frame_b2,
          force_rectangle_rectangle.frame_a1) annotation (Line(
            points={{-36,5.4},{-36,-5.4}},
            color={95,95,95},
            thickness=0.5));
        connect(force_rectangle_rectangle[1].frame_a3, frame_b) annotation (
            Line(
            points={{-60.6,-60},{-102,-60}},
            color={95,95,95},
            thickness=0.5));
        connect(force_rectangle_rectangle[2].frame_a3, frame_b) annotation (
            Line(
            points={{-60.6,-60},{-102,-60}},
            color={95,95,95},
            thickness=0.5));
        connect(force_rectangle_rectangle[3].frame_a3, frame_b) annotation (
            Line(
            points={{-60.6,-60},{-102,-60}},
            color={95,95,95},
            thickness=0.5));
        connect(force_rectangle_rectangle[4].frame_a3, frame_b) annotation (
            Line(
            points={{-60.6,-60},{-102,-60}},
            color={95,95,95},
            thickness=0.5));
        connect(move_point_rectangle_rectangle.angle, force_rectangle_rectangle.angle)
          annotation (Line(
            points={{3,30},{14,30},{14,-29.7},{3.3,-29.7}},
            color={0,0,127}));
        annotation ( Icon(graphics={Rectangle(extent={{-100,100},
                    {100,-100}}, lineColor={255,128,0}), Text(
                extent={{-80,10},{84,-10}},
                lineColor={0,0,255},
                textString="Rectangle-Rectangle")}),
          Documentation(info="<html>
</html>"));
      end RectangleToRectangle;

      model CircleToRectangle
        extends IdealizedContact.Components.PartialContactBlock;
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
        outer parameter Boolean exact;
        outer parameter SI.Frequency f;

        outer parameter Boolean animation;
        outer parameter Modelica.SIunits.Radius radiusContactPoint;
        outer parameter Modelica.Mechanics.MultiBody.Types.Color
          colorContactPoints1;
        outer parameter Modelica.Mechanics.MultiBody.Types.Color
          colorContactPoints2;

    protected
        parameter Real N1 = if n1==0 then Modelica.Constants.eps else n1;//to avoid mathematical error in case of 0^0
        parameter Real N2 = if n2==0 then Modelica.Constants.eps else n2;

    public
        IdealizedContact.ContactBlock.PlanarContact.Components.MovePointCircleToRectangle
                                               move_point_circle_rectangle(f=f,
            exact=exact)
          annotation (Placement(transformation(extent={{-40,12},{20,72}})));
        IdealizedContact.ContactBlock.PlanarContact.Components.ForceCircleToRectangle
                                          force_circle_rectangle[4](
          d={dampingCoefficient,dampingCoefficient,dampingCoefficient,dampingCoefficient},
          n1={N1,N1,N1,N1},
          n2={N2,N2,N2,N2},
          t_max={p_max,p_max,p_max,
              p_max},
          q_l={-1,1,1,-1},
          q_w={-1,-1,1,1},
          c={springCoefficient,springCoefficient,springCoefficient,
              springCoefficient},
          f={f,f,f,f},
          exact={exact,exact,exact,exact},
          radiusContactPoint={radiusContactPoint,radiusContactPoint,
              radiusContactPoint,radiusContactPoint},
          gamma1={gamma1,gamma1,gamma1,gamma1},
          gamma2={gamma2,gamma2,gamma2,gamma2},
          gamma3={gamma3,gamma3,gamma3,gamma3},
          gamma4={gamma4,gamma4,gamma4,gamma4},
          gamma5={gamma5,gamma5,gamma5,gamma5},
          gamma6={gamma6,gamma6,gamma6,gamma6},
          Color_contact_point_rectangle={colorContactPoints2,colorContactPoints2,
              colorContactPoints2,colorContactPoints2},
          Color_contact_point_circle={colorContactPoints1,colorContactPoints1,
              colorContactPoints1,colorContactPoints1},
          Animation={animation,animation,animation,animation})
          annotation (Placement(transformation(extent={{-40,-72},{20,-12}})));
      equation
        connect(move_point_circle_rectangle.frame_b2, force_circle_rectangle.frame_a1)
          annotation (Line(
            points={{20.6,24},{32,24},{32,-24},{20.6,-24}},
            color={95,95,95},
            thickness=0.5));
        connect(move_point_circle_rectangle.frame_b1, force_circle_rectangle.frame_a2)
          annotation (Line(
            points={{20.6,60},{40,60},{40,-60},{20.6,-60}},
            color={95,95,95},
            thickness=0.5));
        connect(move_point_circle_rectangle.frame_a1, frame_a) annotation (Line(
            points={{-41.2,60},{-102,60}},
            color={95,95,95},
            thickness=0.5));
        connect(move_point_circle_rectangle.frame_a2, frame_b) annotation (Line(
            points={{-40.6,24},{-60,24},{-60,-60},{-102,-60}},
            color={95,95,95},
            thickness=0.5));
        connect(move_point_circle_rectangle.vector_circle, vector_1) annotation (Line(
            points={{-41.8,48},{-74,48},{-74,10},{-108,10}},
            color={0,0,127}));
        connect(move_point_circle_rectangle.vector_rectangle, vector_2) annotation (
            Line(
            points={{-41.8,36},{-78,36},{-78,-30},{-108,-30}},
            color={0,0,127}));
        connect(force_circle_rectangle[1].frame_a4, frame_b) annotation (Line(
            points={{-40.6,-60},{-102,-60}},
            color={95,95,95},
            thickness=0.5));
        connect(force_circle_rectangle[2].frame_a4, frame_b) annotation (Line(
            points={{-40.6,-60},{-102,-60}},
            color={95,95,95},
            thickness=0.5));
        connect(force_circle_rectangle[3].frame_a4, frame_b) annotation (Line(
            points={{-40.6,-60},{-102,-60}},
            color={95,95,95},
            thickness=0.5));
        connect(force_circle_rectangle[4].frame_a4, frame_b) annotation (Line(
            points={{-40.6,-60},{-102,-60}},
            color={95,95,95},
            thickness=0.5));
        connect(force_circle_rectangle[1].vector_rectangle, vector_2) annotation (
            Line(
            points={{-41.8,-48},{-78,-48},{-78,-30},{-108,-30}},
            color={0,0,127}));
        connect(force_circle_rectangle[2].vector_rectangle, vector_2) annotation (
            Line(
            points={{-41.8,-48},{-78,-48},{-78,-30},{-108,-30}},
            color={0,0,127}));
        connect(force_circle_rectangle[3].vector_rectangle, vector_2) annotation (
            Line(
            points={{-41.8,-48},{-78,-48},{-78,-30},{-108,-30}},
            color={0,0,127}));
        connect(force_circle_rectangle[4].vector_rectangle, vector_2) annotation (
            Line(
            points={{-41.8,-48},{-78,-48},{-78,-30},{-108,-30}},
            color={0,0,127}));
        connect(force_circle_rectangle[1].vector_circle, vector_1) annotation (Line(
            points={{-41.8,-36},{-74,-36},{-74,10},{-108,10}},
            color={0,0,127}));
        connect(force_circle_rectangle[2].vector_circle, vector_1) annotation (Line(
            points={{-41.8,-36},{-74,-36},{-74,10},{-108,10}},
            color={0,0,127}));
        connect(force_circle_rectangle[3].vector_circle, vector_1) annotation (Line(
            points={{-41.8,-36},{-74,-36},{-74,10},{-108,10}},
            color={0,0,127}));
        connect(force_circle_rectangle[4].vector_circle, vector_1) annotation (Line(
            points={{-41.8,-36},{-74,-36},{-74,10},{-108,10}},
            color={0,0,127}));
        connect(force_circle_rectangle[1].frame_a3, frame_a) annotation (Line(
            points={{-32.8,-24},{-88,-24},{-88,60},{-102,60}},
            color={95,95,95},
            thickness=0.5));
        connect(force_circle_rectangle[2].frame_a3, frame_a) annotation (Line(
            points={{-32.8,-24},{-88,-24},{-88,60},{-102,60}},
            color={95,95,95},
            thickness=0.5));
        connect(force_circle_rectangle[3].frame_a3, frame_a) annotation (Line(
            points={{-32.8,-24},{-88,-24},{-88,60},{-102,60}},
            color={95,95,95},
            thickness=0.5));
        connect(force_circle_rectangle[4].frame_a3, frame_a) annotation (Line(
            points={{-32.8,-24},{-88,-24},{-88,60},{-102,60}},
            color={95,95,95},
            thickness=0.5));
        annotation (Icon(graphics={                   Rectangle(extent={{-100,100},
                    {100,-100}}, lineColor={255,128,0}), Text(
                extent={{-80,10},{84,-10}},
                lineColor={0,0,255},
                textString="Circle-Rectangle")}));
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
                origin={-108,20})));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b1
          "contact point rectangle1 BCS3"
            annotation (Placement(transformation(extent={{-16,-16},{16,16}},
                rotation=90,
                origin={60,-102})));

          Modelica.Blocks.Interfaces.RealInput vector_q[12]
          "Length/Width-direction and L_W_H"
            annotation (Placement(transformation(extent={{-8,-8},{8,8}},
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
              thickness=0.5));
          connect(variablePrism_r2.frame_a, frame_a2)  annotation (Line(
              points={{-52,-80},{-102,-80}},
              color={95,95,95},
              thickness=0.5));
          connect(angle_LL.angle, angle) annotation (Line(
              points={{90,-19},{90,-20},{110,-20}},
              color={0,0,127}));
          connect(tansformRelativeVector.frame_a, frame_a2) annotation (Line(
              points={{-66,-8},{-66,-80},{-102,-80}},
              color={95,95,95},
              thickness=0.5));
          connect(tansformRelativeVector.frame_b, frame_a1) annotation (Line(
              points={{-66,4},{-66,80},{-102,80}},
              color={95,95,95},
              thickness=0.5));
          connect(variablePrism_r1.frame_b, frame_b1) annotation (Line(
              points={{-14,80},{60,80},{60,-102}},
              color={95,95,95},
              thickness=0.5));
          connect(variablePrism_r2.frame_b, frame_b2) annotation (Line(
              points={{-32,-80},{-20,-80},{-20,-102}},
              color={95,95,95},
              thickness=0.5));
          connect(vector_b, deMultiplex3.u) annotation (Line(
              points={{-108,20},{-95.2,20}},
              color={0,0,127}));
          connect(vector_q, deMultiplex3_2.u) annotation (Line(
              points={{-108,-40},{-95.2,-40}},
              color={0,0,127}));
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
                origin={-108,-40})));
          Modelica.Blocks.Interfaces.RealInput vector_b[12]
          "Length/Width-direction and L_W_H"
            annotation (Placement(transformation(extent={{-8,-8},{8,8}},
                origin={-108,40})));

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
                origin={34,-60})));
          Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP_w(resolveInFrame=
                Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "relative position offset_z move point box resolved in frame center of planar surface"
            annotation (Placement(transformation(
                extent={{-6,-6},{6,6}},
                origin={74,-80})));
      public
          Modelica.Mechanics.MultiBody.Forces.Force force_r2(
                                                            resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a,
              animation=false) "supporting force resolved in frame-a"
            annotation (Placement(transformation(
                extent={{-7,-7},{7,7}},
                origin={-13,-21})));
          Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP(resolveInFrame=
                Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "Relative position move point square box resolved in frame center of square planar (R 1-2-3-4 & L 1-2-3-4)"
            annotation (Placement(transformation(
                extent={{-6,-6},{6,6}},
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

        //----------contact specification----------------------------------------------------
           t_z = (L_W_H_1[1]+L_W_H_1[2])/20; //?
           contact_bl = ((rP_l.r_rel*H_direction_2)<=0) and (rP_l.r_rel*H_direction_2)>=-t_max and (abs(rP_l.r_rel*L_direction_2)<=L_W_H_2[1]/2+t_z) and (abs(rP_l.r_rel*W_direction_2)<=L_W_H_2[2]/2+t_z)
          "contact move point in L direction of square b based on square q";
           contact_bw = ((rP_w.r_rel*H_direction_2)<=0) and (rP_w.r_rel*H_direction_2)>=-t_max and (abs(rP_w.r_rel*L_direction_2)<=L_W_H_2[1]/2+t_z) and (abs(rP_w.r_rel*W_direction_2)<=L_W_H_2[2]/2+t_z)
          "contact move point in W direction of square b based on square q";
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
              thickness=0.5));
          connect(force_r1.frame_a, frame_a1) annotation (Line(
              points={{12,-1},{-20,-1},{-20,102}},
              color={95,95,95},
              thickness=0.5));
          connect(force_r1.frame_b, rP_l.frame_b) annotation (Line(
              points={{26,-1},{40,-1},{40,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(force_r2.frame_a, frame_a1) annotation (Line(
              points={{-20,-21},{-20,102}},
              color={95,95,95},
              thickness=0.5));
          connect(contact_point_rectangle2.frame_a, frame_a1)
                                                annotation (Line(
              points={{-1,61},{-19.5,61},{-19.5,102},{-20,102}},
              color={95,95,95},
              thickness=0.5));
          connect(rP.frame_a, frame_a3) annotation (Line(
              points={{-56,80},{-56,-80},{-102,-80}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_w.frame_a, frame_a3) annotation (Line(
              points={{68,-80},{-102,-80}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_l.frame_a, frame_a3) annotation (Line(
              points={{28,-60},{28,-80},{-102,-80}},
              color={95,95,95},
              thickness=0.5));
          connect(offset1_cp1.frame_a, force_r1.frame_b) annotation (Line(
              points={{59,-1},{26,-1}},
              color={95,95,95},
              thickness=0.5));
          connect(force_r2.frame_b, offset2_cp1.frame_a) annotation (Line(
              points={{-6,-21},{97,-21}},
              color={95,95,95},
              thickness=0.5));
          connect(variablePrism_l.frame_b, force_r1.frame_b)
                                                            annotation (Line(
              points={{40,44},{40,-1},{26,-1}},
              color={95,95,95},
              thickness=0.5));
          connect(variablePrism_w.frame_b, force_r2.frame_b)
                                                            annotation (Line(
              points={{80,44},{80,-21},{-6,-21}},
              color={95,95,95},
              thickness=0.5));
          connect(variablePrism_w.frame_b, rP_w.frame_b)
                                                        annotation (Line(
              points={{80,44},{80,-80}},
              color={95,95,95},
              thickness=0.5));
          connect(variablePrism_l.support, pos_l.support)
                                                         annotation (Line(
              points={{44.8,55.2},{47.4,55.2},{47.4,53},{48,53}},
              color={0,127,0}));
          connect(pos_l.flange, variablePrism_l.axis)
                                                     annotation (Line(
              points={{55,46},{52,46},{52,45.6},{44.8,45.6}},
              color={0,127,0}));
          connect(variablePrism_w.support, pos_w.support)
                                                         annotation (Line(
              points={{84.8,55.2},{87.4,55.2},{87.4,51},{88,51}},
              color={0,127,0}));
          connect(pos_w.flange, variablePrism_w.axis)
                                                     annotation (Line(
              points={{95,44},{90,44},{90,45.6},{84.8,45.6}},
              color={0,127,0}));
          connect(variablePrism_l.frame_a, frame_a2)
                                                    annotation (Line(
              points={{40,60},{40,80},{60,80},{60,102}},
              color={95,95,95},
              thickness=0.5));
          connect(variablePrism_w.frame_a, frame_a2)
                                                    annotation (Line(
              points={{80,60},{80,80},{60,80},{60,102}},
              color={95,95,95},
              thickness=0.5));
          connect(deMultiplex3_1.u, vector_b) annotation (Line(
              points={{-93.2,40},{-108,40}},
              color={0,0,127}));
          connect(deMultiplex3_2.u, vector_q) annotation (Line(
              points={{-95.2,-40},{-100.6,-40},{-100.6,-40},{-108,-40}},
              color={0,0,127}));
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
                origin={-106,-20})));
          Modelica.Blocks.Interfaces.RealInput vector_circle[12]
          "length_direction and radius and half_length"
            annotation (Placement(transformation(extent={{-6,-6},{6,6}},
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
              thickness=0.5));
          connect(subsystem_mp_circle_rectangle1[2].frame_a2, frame_a2) annotation (
              Line(
              points={{-20,-28.4},{-20,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(frame_a2, subsystem_mp_circle_rectangle1[3].frame_a2) annotation (
              Line(
              points={{-102,-60},{-20,-60},{-20,-28.4}},
              color={95,95,95},
              thickness=0.5));
          connect(subsystem_mp_circle_rectangle1[4].frame_a2, frame_a2) annotation (
              Line(
              points={{-20,-28.4},{-20,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(frame_b2, subsystem_mp_circle_rectangle1.frame_b2) annotation (Line(
              points={{102,-60},{20,-60},{20,-16},{0.4,-16}},
              color={95,95,95},
              thickness=0.5));

          connect(tansformRelativeVector1.frame_a, frame_a2) annotation (Line(
              points={{-60,0},{-60,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(tansformRelativeVector1.frame_b, frame_a1) annotation (Line(
              points={{-60,12},{-60,60},{-104,60}},
              color={95,95,95},
              thickness=0.5));
          connect(subsystem_mp_circle_rectangle1.frame_b1, frame_b1) annotation (Line(
              points={{0.4,0},{20,0},{20,60},{102,60}},
              color={95,95,95},
              thickness=0.5));
          connect(angle_1.support, variableRevol_1.support) annotation (Line(
              points={{-49,76},{-48.8,76},{-48.8,68}},
              color={0,0,0}));
          connect(angle_1.flange, variableRevol_1.axis) annotation (Line(
              points={{-42,83},{-42,68},{-44,68}},
              color={0,0,0}));
          connect(variableRevol_1.frame_a, frame_a1) annotation (Line(
              points={{-52,60},{-104,60}},
              color={95,95,95},
              thickness=0.5));
          connect(variableRevol_1.frame_b, subsystem_mp_circle_rectangle1[1].frame_a1)
            annotation (Line(
              points={{-36,60},{-20,60},{-20,12.4}},
              color={95,95,95},
              thickness=0.5));
          connect(variableRevol_1.frame_b, subsystem_mp_circle_rectangle1[2].frame_a1)
            annotation (Line(
              points={{-36,60},{-20,60},{-20,12.4}},
              color={95,95,95},
              thickness=0.5));
          connect(variableRevol_1.frame_b, subsystem_mp_circle_rectangle1[3].frame_a1)
            annotation (Line(
              points={{-36,60},{-20,60},{-20,12.4}},
              color={95,95,95},
              thickness=0.5));
          connect(variableRevol_1.frame_b, subsystem_mp_circle_rectangle1[4].frame_a1)
            annotation (Line(
              points={{-36,60},{-20,60},{-20,12.4}},
              color={95,95,95},
              thickness=0.5));
          connect(deMultiplex3.u, vector_rectangle) annotation (Line(
              points={{-95.2,-6},{-98,-6},{-98,-20},{-106,-20}},
              color={0,0,127}));
          connect(deMultiplex2.u, vector_circle) annotation (Line(
              points={{-95.2,34},{-98,34},{-98,20},{-106,20}},
              color={0,0,127}));
          connect(vector_circle, subsystem_mp_circle_rectangle1[1].vector_circle)
            annotation (Line(
              points={{-106,20},{-74,20},{-74,-12},{-41.2,-12}},
              color={0,0,127}));
          connect(vector_circle, subsystem_mp_circle_rectangle1[2].vector_circle)
            annotation (Line(
              points={{-106,20},{-74,20},{-74,-12},{-41.2,-12}},
              color={0,0,127}));
          connect(vector_circle, subsystem_mp_circle_rectangle1[3].vector_circle)
            annotation (Line(
              points={{-106,20},{-74,20},{-74,-12},{-41.2,-12}},
              color={0,0,127}));
          connect(vector_circle, subsystem_mp_circle_rectangle1[4].vector_circle)
            annotation (Line(
              points={{-106,20},{-74,20},{-74,-12},{-41.2,-12}},
              color={0,0,127}));
          connect(vector_rectangle, subsystem_mp_circle_rectangle1[1].vector_rectangle)
            annotation (Line(
              points={{-106,-20},{-41.2,-20}},
              color={0,0,127}));
          connect(vector_rectangle, subsystem_mp_circle_rectangle1[2].vector_rectangle)
            annotation (Line(
              points={{-106,-20},{-41.2,-20}},
              color={0,0,127}));
          connect(vector_rectangle, subsystem_mp_circle_rectangle1[3].vector_rectangle)
            annotation (Line(
              points={{-106,-20},{-41.2,-20}},
              color={0,0,127}));
          connect(vector_rectangle, subsystem_mp_circle_rectangle1[4].vector_rectangle)
            annotation (Line(
              points={{-106,-20},{-41.2,-20}},
              color={0,0,127}));
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
                origin={-106,20})));
          Modelica.Blocks.Interfaces.RealInput vector_rectangle[12]
          "L/W-direction and L_W_H"
            annotation (Placement(transformation(extent={{-6,-6},{6,6}},
                origin={-106,-20})));
      public
          Modelica.Mechanics.MultiBody.Forces.Force force_cr(resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a,
              animation=false) "supporting force resolved in frame-a circle"
            annotation (Placement(transformation(
                extent={{-8,-8},{8,8}},
                origin={-46,60})));
          Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP_cr(resolveInFrame=
                Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "Relative position move point rectangle resolved in frame center of circle"
            annotation (Placement(transformation(
                extent={{-6,-6},{6,6}},
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
                origin={-30,-24})));
          Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP(resolveInFrame=
                Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "Relative position move point circle resolved in frame center of rectangle"
            annotation (Placement(transformation(
                extent={{-6,-6},{6,6}},
                origin={4,-92})));
      public
          Modelica.Mechanics.MultiBody.Forces.Force force_rc2(
                                                             resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a,
              animation=false) "supporting force resolved in frame-a rectangle"
            annotation (Placement(transformation(
                extent={{-8,-8},{8,8}},
                origin={-32,-60})));
          Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP_l(resolveInFrame=
                Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "relative position offset_x move point box resolved in frame center of planar surface"
            annotation (Placement(transformation(
                extent={{-6,-6},{6,6}},
                origin={-28,6})));
          Modelica.Mechanics.MultiBody.Sensors.RelativePosition rP_w(resolveInFrame=
                Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
          "relative position offset_z move point box resolved in frame center of planar surface"
            annotation (Placement(transformation(
                extent={{-6,-6},{6,6}},
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
              thickness=0.5));
          connect(force_cr.frame_a, frame_a3) annotation (Line(
              points={{-54,60},{-76,60}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_cr.frame_a, frame_a3) annotation (Line(
              points={{-52,80},{-54,80},{-54,60},{-76,60}},
              color={95,95,95},
              thickness=0.5));
          connect(force_rc1.frame_a, frame_a4) annotation (Line(
              points={{-38,-24},{-48,-24},{-48,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(rP.frame_a, frame_a4)     annotation (Line(
              points={{-2,-92},{-64,-92},{-64,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(force_rc2.frame_a, frame_a4) annotation (Line(
              points={{-40,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_l.frame_a, frame_a4) annotation (Line(
              points={{-34,6},{-48,6},{-48,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_w.frame_a, frame_a4) annotation (Line(
              points={{-38,-80},{-48,-80},{-48,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(movepointRechtangle.frame_a, frame_a1)
                                                annotation (Line(
              points={{74,82},{74,60},{102,60}},
              color={95,95,95},
              thickness=0.5));
          connect(rP.frame_b, frame_a2) annotation (Line(
              points={{10,-92},{92,-92},{92,-60},{102,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(rP1.frame_a, frame_a4) annotation (Line(
              points={{-64,0},{-64,-60},{-102,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(rP1.frame_b, frame_a3) annotation (Line(
              points={{-64,12},{-64,60},{-76,60}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_cr.frame_b, force_cr.frame_b) annotation (Line(
              points={{-40,80},{-38,80},{-38,60}},
              color={95,95,95},
              thickness=0.5));
          connect(pos_L.support, variablePrism_L.support) annotation (Line(
              points={{47,-30},{51.2,-30},{51.2,-24.8}},
              color={0,0,0}));
          connect(pos_L.flange, variablePrism_L.axis) annotation (Line(
              points={{40,-37},{40,-24.8},{41.6,-24.8}},
              color={0,127,0}));
          connect(rP_l.frame_b, variablePrism_L.frame_b) annotation (Line(
              points={{-22,6},{-3,6},{-3,-20},{40,-20}},
              color={95,95,95},
              thickness=0.5));
          connect(variablePrism_L.frame_a, frame_a2) annotation (Line(
              points={{56,-20},{80,-20},{80,-60},{102,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(force_rc1.frame_b, variablePrism_L.frame_b) annotation (Line(
              points={{-22,-24},{-2,-24},{-2,-20},{40,-20}},
              color={95,95,95},
              thickness=0.5));
          connect(fixpoint1.frame_a, variablePrism_L.frame_b) annotation (Line(
              points={{17,-1},{17,-20.5},{40,-20.5},{40,-20}},
              color={95,95,95},
              thickness=0.5));
          connect(pos_W.support, variablePrism_W.support) annotation (Line(
              points={{49,-68},{51.2,-68},{51.2,-64.8}},
              color={0,0,0}));
          connect(variablePrism_W.axis, pos_W.flange) annotation (Line(
              points={{41.6,-64.8},{41.6,-70.4},{42,-70.4},{42,-75}},
              color={0,127,0}));
          connect(variablePrism_W.frame_a, frame_a2) annotation (Line(
              points={{56,-60},{102,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(variablePrism_W.frame_b, force_rc2.frame_b) annotation (Line(
              points={{40,-60},{-24,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(rP_w.frame_b, variablePrism_W.frame_b) annotation (Line(
              points={{-26,-80},{-12,-80},{-12,-60},{40,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(fixpoint2.frame_a, variablePrism_W.frame_b) annotation (Line(
              points={{-1,-49},{-0.5,-49},{-0.5,-60},{40,-60}},
              color={95,95,95},
              thickness=0.5));
          connect(deMultiplex2.u, vector_circle) annotation (Line(
              points={{-93.2,20},{-106,20}},
              color={0,0,127}));
          connect(deMultiplex3.u, vector_rectangle) annotation (Line(
              points={{-93.2,-20},{-106,-20}},
              color={0,0,127}));
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
                origin={-106,-20})));
          Modelica.Blocks.Interfaces.RealInput vector_rectangle[12]
          "L/W-direction and L_W_H"
            annotation (Placement(transformation(extent={{-6,-6},{6,6}},
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
              thickness=0.5));
          connect(pris_r.frame_b, frame_b2) annotation (Line(
              points={{80,-40},{102,-40}},
              color={95,95,95},
              thickness=0.5));
          connect(pris_c.frame_a, frame_a1) annotation (Line(
              points={{60,40},{0,40},{0,102}},
              color={95,95,95},
              thickness=0.5));
          connect(pris_c.frame_b, frame_b1) annotation (Line(
              points={{80,40},{102,40}},
              color={95,95,95},
              thickness=0.5));
          connect(deMultiplex2.u, vector_circle) annotation (Line(
              points={{-87.2,-20},{-106,-20}},
              color={0,0,127}));
          connect(vector_rectangle, deMultiplex3.u) annotation (Line(
              points={{-106,-60},{-87.2,-60}},
              color={0,0,127}));
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


  package Components
  extends Modelica.Icons.BasesPackage;
    package VectorCalculations "Package provides custom vector calculations"
      extends Modelica.Icons.BasesPackage;

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
        annotation (Inline=true, Documentation(info="<html>
<p>The function returns the <b>unit vector</b> <code>v/length(v)</code> of vector v. If length(v) is close to zero (more precisely, if length(v) &lt; eps), a zero vector is returned to avoid division by zero. The constant eps is set to 100*Modelica.Constants.eps. The function is based on <a href=\"Modelica://Modelica.Math.Vectors.normalize\">Modelica.Math.Vectors.normalize</a>.</p>
<h4>See also</h4>
<p><a href=\"Modelica://Modelica.Math.Vectors.length\">Modelica.Math.Vectors.length</a></p>
</html>"));
      end vectorNormalization;

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

        annotation ( Documentation(info="<html>
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
        annotation ( Documentation(info="<!DOCTYPE html><html>
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
        annotation ( Documentation(info="<html>
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
          annotation (Placement(transformation(extent={{60,-10},{80,10}})));
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
            points={{81,0},{110,0}},
            color={0,0,127}));
        annotation ( Documentation(info="<html>
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
            color={0,0,127}));
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
            color={0,0,127}));
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
                pattern=LinePattern.Solid,
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid,
                lineColor={0,0,255}),
              Rectangle(
                extent={{-100,40},{-30,50}},
                pattern=LinePattern.Solid,
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid,
                lineColor={0,0,255}),
              Rectangle(
                extent={{-30,-30},{100,20}},
                pattern=LinePattern.Solid,
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid,
                lineColor={0,0,255}),
              Rectangle(
                extent={{-30,20},{100,30}},
                pattern=LinePattern.Solid,
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
                pattern=LinePattern.Solid,
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid,
                lineColor={0,0,255}),
              Text(
                extent={{17,-101},{107,-80}},
                lineColor={0,0,0},
                textString="s_ref")}),
          Documentation(info="<!DOCTYPE html><html>
<p>This joint is a modification of the Modelica.Mechanics.MultiBody.Joints.Prismatic joint. The axis of translation can be now be set via the input n. Furthermore, the input s_ref sets the distance between the to frames (compare to useAxisFlange option of the original block).</p>
</html>"));
      end variablePrism1;

      model variableRevol1
      "Revolute joint (1 rotational degree-of-freedom, 2 potential states, optional axis flange)"

        import SI = Modelica.SIunits;

        Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a
        "Coordinate system fixed to the joint with one cut-force and cut-torque"
          annotation (Placement(transformation(extent={{-116,-16},{-84,16}})));
        Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b
        "Coordinate system fixed to the joint with one cut-force and cut-torque"
          annotation (Placement(transformation(extent={{84,-16},{116,16}})));

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
          annotation (Placement(transformation(extent={{90,50},{70,70}})));
        Modelica.Mechanics.Translational.Interfaces.Flange_b support
        "1-dim. translational flange of the drive drive support (assumed to be fixed in the world frame, NOT in the joint)"
          annotation (Placement(transformation(extent={{-30,50},{-50,70}})));
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
            color={0,127,0}));
        connect(internalAxis.flange, axis)    annotation (Line(
            points={{80,40},{80,60}},
            color={0,127,0}));

        annotation (
          Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={
              Rectangle(
                extent={{-100,-50},{-30,41}},
                pattern=LinePattern.Solid,
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid,
                lineColor={0,0,255}),
              Rectangle(
                extent={{-100,40},{-30,50}},
                pattern=LinePattern.Solid,
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid,
                lineColor={0,0,255}),
              Rectangle(
                extent={{-30,-30},{100,20}},
                pattern=LinePattern.Solid,
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid,
                lineColor={0,0,255}),
              Rectangle(
                extent={{-30,20},{100,30}},
                pattern=LinePattern.Solid,
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
                pattern=LinePattern.Solid,
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid,
                lineColor={0,0,255})}),
          Documentation(info="<!DOCTYPE html><html>
<p>This joint is a modification of the Modelica.Mechanics.MultiBody.Joints.Prismatic joint. The axis of translation can be now be set via the input n.</p>
</html>"));
      end variablePrism2;

      model variableRevol2
      "Revolute joint (1 rotational degree-of-freedom, 2 potential states, optional axis flange)"

        import SI = Modelica.SIunits;

        Modelica.Mechanics.Rotational.Interfaces.Flange_a axis
        "1-dim. rotational flange that drives the joint"
          annotation (Placement(transformation(extent={{10,90},{-10,110}})));
        Modelica.Mechanics.Rotational.Interfaces.Flange_b support
        "1-dim. rotational flange of the drive support (assumed to be fixed in the world frame, NOT in the joint)"
          annotation (Placement(transformation(extent={{-70,90},{-50,110}})));

        Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a
        "Coordinate system fixed to the joint with one cut-force and cut-torque"
          annotation (Placement(transformation(extent={{-116,-16},{-84,16}})));
        Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b
        "Coordinate system fixed to the joint with one cut-force and cut-torque"
          annotation (Placement(transformation(extent={{84,-16},{116,16}})));
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
            color={0,0,0}));
        connect(internalAxis.flange, axis) annotation (Line(
            points={{0,80},{0,100}},
            color={0,0,0}));
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
                color={0,0,0}),
              Line(
                visible=useAxisFlange,
                points={{20,70},{50,70},{50,60}},
                color={0,0,0}),
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
          Documentation(info="<!DOCTYPE html><html>
<p>This joint is a modification of the Modelica.Mechanics.MultiBody.Joints.Revolute joint. The axis of rotation can be now be set via the input n.</p>
</html>"));
      end variableRevol2;

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
          Documentation(info="<!DOCTYPE html><html><p>This model is a modification of <a href=\"modelica://Modelica.Mechanics.MultiBody.Visualizers.FixedShape\">Modelica.Mechanics.MultiBody.Visualizers.FixedShape</a>. The animation can be disabled via the boolean input. Therefore, the dimensions of the animation are set to 0.
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
                lineColor={0,0,255})}));
      end FixedShapeVarAnimation;

      model PointMassVarAnimation
      "Rigid body where body rotation and inertia tensor is neglected (6 potential states)"

        import SI = Modelica.SIunits;
        import Modelica.Mechanics.MultiBody.Types;
        Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a
        "Coordinate system fixed at center of mass point"
          annotation (Placement(transformation(extent={{-16,-16},{16,16}})));
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
");
          frame_a.R = Modelica.Mechanics.MultiBody.Frames.nullRotation();
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
          Documentation(info="<!DOCTYPE html><HTML><p>This rigid body is a modification of <a href=\"modelica://Modelica.Mechanics.MultiBody.Parts.PointMass\">Modelica.Mechanics.MultiBody.Parts.PointMass</a>. The animation can be disabled via the boolean input. Therefore, the diameter of the sphere is set to 0.
</p></HTML>"));
      end PointMassVarAnimation;
     annotation(preferredView="info");
    end Utilities;

    partial model PartialContactBlock "base model for the contact blocks"

      Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_b "port2_frame"
        annotation (Placement(transformation(extent={{-118,-76},{-86,-44}})));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a "port1_frame"
        annotation (Placement(transformation(extent={{-118,44},{-86,76}})));
      Modelica.Blocks.Interfaces.RealInput vector_1[12] "port1_vector"
                                                           annotation (
          Placement(transformation(
            extent={{-8,-8},{8,8}},
            origin={-108,10})));
      Modelica.Blocks.Interfaces.RealInput vector_2[12] "port2_vector"
                                                           annotation (
          Placement(transformation(
            extent={{-8,-8},{8,8}},
            origin={-108,-30})));
    end PartialContactBlock;
   annotation(preferredView="info");
  end Components;


  package Interfaces
    extends Modelica.Icons.InterfacesPackage;
    connector Contact_a
      import B = Modelica.Blocks;
      import A = Modelica.Mechanics.MultiBody;
    A.Interfaces.Frame_a frame;
    B.Interfaces.RealOutput u[12];

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}),
                       graphics={Rectangle(
              extent={{-60,60},{60,-60}},
              lineColor={255,128,0},
              fillColor={255,128,0},
              fillPattern=FillPattern.Solid)}), Documentation(info="<html>
<p>Interface of the surface definition.</p>
</html>"));
    end Contact_a;

    connector Contact_b
      import B = Modelica.Blocks;
      import A = Modelica.Mechanics.MultiBody;
    A.Interfaces.Frame_a frame;
    B.Interfaces.RealInput u[12];

      annotation (Icon(graphics={Rectangle(
              extent={{-60,60},{60,-60}},
              lineColor={255,128,0},
              fillColor={255,128,0},
              fillPattern=FillPattern.Solid)}), Documentation(info="<html>
<p>Interface of the contact block.</p>
</html>"));
    end Contact_b;
   annotation(preferredView="info", Documentation(info="<html>
<p>In order to be able to use the dimensions of the contact surfaces in the contact block a new interfaces to connect the surface definition with a contact block is introduced. This adds a scalar vector to the MultiBody frame of the Modelica Standard Library that comprises maximum three terms to describe the surface geometry and the three direction vectors to resolve them in the connected frame. The latter constitutes the body coordinate system (BCS) of the contact surface.</p>
</html>"));
  end Interfaces;


  annotation (version="0.1.0", uses(Modelica(version="3.2")), preferredView="info");
end IdealizedContact;
