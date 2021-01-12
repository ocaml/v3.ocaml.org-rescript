module LINK = Markdown.LINK

let s = React.string

let default = () =>
  <>
  <h1>{s(`OCaml's License`)}</h1>
  <p>
    {s(`In the following, “the OCaml Core System” refers to all files marked “Copyright INRIA” in this distribution.`)}
  </p>
  <p>
    {s(`The OCaml Core System is distributed under the terms of the `)}
    <LINK href="#the-gnu-lesser-general">{s(`GNU Lesser General Public License version 2.1`)}</LINK>
    {s(` (included below). `)}
  </p>
  <p>
    {s(`As a special exception to the GNU Lesser General Public License, you may link, statically 
    or dynamically, a "work that uses the OCaml Core System" with a publicly distributed version 
    of the OCaml Core System to produce an executable file containing portions of the OCaml Core 
    System, and distribute that executable file under terms of your choice, without any of the additional 
    requirements listed in clause 6 of the GNU Lesser General Public License. By "a publicly distributed 
    version of the OCaml Core System", we mean either the unmodified OCaml Core System as distributed by 
    INRIA, or a modified version of the OCaml Core System that is distributed under the conditions defined 
    in clause 2 of the GNU Lesser General Public License. This exception does not however invalidate any 
    other reasons why the executable file might be covered by the GNU Lesser General Public License. `)}
  </p>
  <h2 id="the-gnu-lesser-general">{s(`The GNU Lesser General Public License, version 2.1`)}</h2>
  <div>
    <p>
      {s(
`Copyright (C) 1991, 1999 Free Software Foundation, Inc.
51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
Everyone is permitted to copy and distribute verbatim copies
of this license document, but changing it is not allowed.`)}
    </p>
    <p>
      {s(`[This is the first released version of the Lesser GPL.  It also counts as the successor of 
      the GNU Library Public License, version 2, hence the version number 2.1.]`)}
    </p>
    <h3>{s(`Preamble`)}</h3>
    <p>
      {s(`The licenses for most software are designed to take away your freedom to share and change it. 
      By contrast, the GNU General Public Licenses are intended to guarantee your freedom to share and 
      change free software--to make sure the software is free for all its users.`)}
    </p>
    <p>
      {s(`This license, the Lesser General Public License, applies to some specially designated software 
      packages--typically libraries--of the Free Software Foundation and other authors who decide 
      to use it. You can use it too, but we suggest you first think carefully about whether this license 
      or the ordinary General Public License is the better strategy to use in any particular case, 
      based on the explanations below.`)}
    </p>
    <p>
      {s(`When we speak of free software, we are referring to freedom of use, not price. Our General Public 
      Licenses are designed to make sure that you have the freedom to distribute copies of free software 
      (and charge for this service if you wish); that you receive source code or can get it if you want it; 
      that you can change the software and use pieces of it in new free programs; and that you are 
      informed that you can do these things.`)}
    </p>
    <p>
      {s(`To protect your rights, we need to make restrictions that forbid distributors to deny you these 
      rights or to ask you to surrender these rights. These restrictions translate to certain responsibilities 
      for you if you distribute copies of the library or if you modify it.`)}
    </p>
    <p>
      {s(`For example, if you distribute copies of the library, whether gratis or for a fee, you must 
      give the recipients all the rights that we gave you. You must make sure that they, too, receive 
      or can get the source code. If you link other code with the library, you must provide complete 
      object files to the recipients, so that they can relink them with the library after making changes 
      to the library and recompiling it. And you must show them these terms so they know their rights.`)}
    </p>
    <p>
      {s(`We protect your rights with a two-step method: (1) we copyright the library, and (2) we offer you 
      this license, which gives you legal permission to copy, distribute and/or modify the library.`)}
    </p>
    <p>
      {s(`To protect each distributor, we want to make it very clear that there is no warranty for the free 
      library. Also, if the library is modified by someone else and passed on, the recipients should know 
      that what they have is not the original version, so that the original author's reputation will not 
      be affected by problems that might be introduced by others.`)}
    </p>
    <p>
      {s(`Finally, software patents pose a constant threat to the existence of any free program. We wish 
      to make sure that a company cannot effectively restrict the users of a free program by obtaining a 
      restrictive license from a patent holder. Therefore, we insist that any patent license obtained for 
      a version of the library must be consistent with the full freedom of use specified in this license.`)}
    </p>
    <p>
      {s(`Most GNU software, including some libraries, is covered by the ordinary GNU General Public 
      License. This license, the GNU Lesser General Public License, applies to certain designated 
      libraries, and is quite different from the ordinary General Public License. We use this license 
      for certain libraries in order to permit linking those libraries into non-free programs.`)}
    </p>
    <p>
      {s(`When a program is linked with a library, whether statically or using a shared library, the 
      combination of the two is legally speaking a combined work, a derivative of the original library. 
      The ordinary General Public License therefore permits such linking only if the entire combination 
      fits its criteria of freedom. The Lesser General Public License permits more lax criteria for 
      linking other code with the library.`)}
    </p>
    <p>
      {s(`We call this license the "Lesser" General Public License because it does Less to protect the 
      user's freedom than the ordinary General Public License. It also provides other free software 
      developers Less of an advantage over competing non-free programs. These disadvantages are the 
      reason we use the ordinary General Public License for many libraries. However, the Lesser 
      license provides advantages in certain special circumstances.`)}
    </p>
    <p>
      {s(`For example, on rare occasions, there may be a special need to encourage the widest possible 
      use of a certain library, so that it becomes a de-facto standard. To achieve this, non-free 
      programs must be allowed to use the library. A more frequent case is that a free library does 
      the same job as widely used non-free libraries. In this case, there is little to gain by limiting 
      the free library to free software only, so we use the Lesser General Public License.`)}
    </p>
    <p>
      {s(`In other cases, permission to use a particular library in non-free programs enables a greater 
      number of people to use a large body of free software. For example, permission to use the GNU C 
      Library in non-free programs enables many more people to use the whole GNU operating system, 
      as well as its variant, the GNU/Linux operating system.`)}
    </p>
    <p>
      {s(`Although the Lesser General Public License is Less protective of the users' freedom, it does 
      ensure that the user of a program that is linked with the Library has the freedom and the 
      wherewithal to run that program using a modified version of the Library.`)}
    </p>
    <p>
      {s(`The precise terms and conditions for copying, distribution and modification follow. Pay close 
      attention to the difference between a "work based on the library" and a "work that uses the library". 
      The former contains code derived from the library, whereas the latter must be combined with the 
      library in order to run.`)}
    </p>

    <h3>{s(`TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION`)}</h3>
    <p>
      {s(`0. This License Agreement applies to any software library or other program which contains a 
      notice placed by the copyright holder or other authorized party saying it may be distributed under 
      the terms of this Lesser General Public License (also called "this License"). Each licensee is 
      addressed as "you".`)}
    </p>
    <p>
      {s(`A "library" means a collection of software functions and/or data prepared so as to be conveniently 
      linked with application programs (which use some of those functions and data) to form executables.`)}
    </p>
    <p>
      {s(`The "Library", below, refers to any such software library or work which has been distributed under 
      these terms. A "work based on the Library" means either the Library or any derivative work under 
      copyright law: that is to say, a work containing the Library or a portion of it, either verbatim 
      or with modifications and/or translated straightforwardly into another language. (Hereinafter, 
      translation is included without limitation in the term "modification".)`)}
    </p>
    <p>
      {s(`"Source code" for a work means the preferred form of the work for making modifications to it. 
      For a library, complete source code means all the source code for all modules it contains, plus 
      any associated interface definition files, plus the scripts used to control compilation and 
      installation of the library.`)}
    </p>
    <p>
      {s(`Activities other than copying, distribution and modification are not covered by this License; 
      they are outside its scope. The act of running a program using the Library is not restricted, and 
      output from such a program is covered only if its contents constitute a work based on the 
      Library (independent of the use of the Library in a tool for writing it). Whether that is true 
      depends on what the Library does and what the program that uses the Library does.`)}
    </p>
    <p>
      {s(`1. You may copy and distribute verbatim copies of the Library's complete source code as you 
      receive it, in any medium, provided that you conspicuously and appropriately publish on each 
      copy an appropriate copyright notice and disclaimer of warranty; keep intact all the notices 
      that refer to this License and to the absence of any warranty; and distribute a copy of 
      this License along with the Library.`)}
    </p>
    <p>
      {s(`You may charge a fee for the physical act of transferring a copy, and you may at your option 
      offer warranty protection in exchange for a fee.`)}
    </p>
    <p>
      {s(`2. You may modify your copy or copies of the Library or any portion of it, thus forming a 
      work based on the Library, and copy and distribute such modifications or work under the terms of 
      Section 1 above, provided that you also meet all of these conditions:`)}
      <ol>
        <li>{s(`a) The modified work must itself be a software library.`)}</li>
        <li>{s(`b) You must cause the files modified to carry prominent notices stating that 
        you changed the files and the date of any change.`)}</li>
        <li>{s(`c) You must cause the whole of the work to be licensed at no charge to all 
        third parties under the terms of this License.`)}</li>
        <li>{s(`d) If a facility in the modified Library refers to a function or a table of data 
        to be supplied by an application program that uses the facility, other than as an argument 
        passed when the facility is invoked, then you must make a good faith effort to ensure that, 
        in the event an application does not supply such function or table, the facility still 
        operates, and performs whatever part of its purpose remains meaningful.`)}</li>
      </ol>
      {s(`(For example, a function in a library to compute square roots has a purpose that is entirely 
      well-defined independent of the application. Therefore, Subsection 2d requires that any 
      application-supplied function or table used by this function must be optional: if the 
      application does not supply it, the square root function must still compute square roots.)`)}
    </p>
    <p>
      {s(`These requirements apply to the modified work as a whole. If identifiable sections of that 
      work are not derived from the Library, and can be reasonably considered independent and separate 
      works in themselves, then this License, and its terms, do not apply to those sections when you 
      distribute them as separate works. But when you distribute the same sections as part of a whole 
      which is a work based on the Library, the distribution of the whole must be on the terms of this 
      License, whose permissions for other licensees extend to the entire whole, and thus to each and 
      every part regardless of who wrote it.`)}
    </p>
    <p>
      {s(`Thus, it is not the intent of this section to claim rights or contest your rights to work 
      written entirely by you; rather, the intent is to exercise the right to control the distribution 
      of derivative or collective works based on the Library.`)}
    </p>
    <p>
      {s(`In addition, mere aggregation of another work not based on the Library with the Library 
      (or with a work based on the Library) on a volume of a storage or distribution medium does 
      not bring the other work under the scope of this License.`)}
    </p>
    <p>
      {s(`3. You may opt to apply the terms of the ordinary GNU General Public License instead of this 
      License to a given copy of the Library. To do this, you must alter all the notices that refer to 
      this License, so that they refer to the ordinary GNU General Public License, version 2, instead 
      of to this License. (If a newer version than version 2 of the ordinary GNU General Public License 
      has appeared, then you can specify that version instead if you wish.) Do not make any other change 
      in these notices.`)}
    </p>
    <p>
      {s(`Once this change is made in a given copy, it is irreversible for that copy, so the ordinary 
      GNU General Public License applies to all subsequent copies and derivative works made from that 
      copy.`)}
    </p>
    <p>
      {s(`This option is useful when you wish to copy part of the code of the Library into a program 
      that is not a library.`)}
    </p>
    <p>
      {s(`4. You may copy and distribute the Library (or a portion or derivative of it, under Section 2) 
      in object code or executable form under the terms of Sections 1 and 2 above provided that you 
      accompany it with the complete corresponding machine-readable source code, which must be 
      distributed under the terms of Sections 1 and 2 above on a medium customarily used for software 
      interchange.`)}
    </p>
    <p>
      {s(`If distribution of object code is made by offering access to copy from a designated place, 
      then offering equivalent access to copy the source code from the same place satisfies the 
      requirement to distribute the source code, even though third parties are not compelled to 
      copy the source along with the object code.`)}
    </p>
    <p>
      {s(`5. A program that contains no derivative of any portion of the Library, but is designed to 
      work with the Library by being compiled or linked with it, is called a "work that uses the Library". 
      Such a work, in isolation, is not a derivative work of the Library, and therefore falls outside 
      the scope of this License.`)}
    </p>
    <p>
      {s(`However, linking a "work that uses the Library" with the Library creates an executable that 
      is a derivative of the Library (because it contains portions of the Library), rather than a "work 
      that uses the library". The executable is therefore covered by this License. Section 6 states 
      terms for distribution of such executables.`)}
    </p>
    <p>
      {s(`When a "work that uses the Library" uses material from a header file that is part of the Library, 
      the object code for the work may be a derivative work of the Library even though the source code is 
      not. Whether this is true is especially significant if the work can be linked without the Library, 
      or if the work is itself a library. The threshold for this to be true is not precisely defined by 
      law.`)}
    </p>
    

    <p>
      {s(``)}
    </p>
  </div>
  </>
