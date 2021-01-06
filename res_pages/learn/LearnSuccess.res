// module LINK = Markdown.LINK

let s = React.string

let default = () =>
  <>
  <h1>{s(`Success Stories`)}</h1>
    <h2>{s(`Jane Street`)}</h2>
      <p>
      {s(`Jane Street is a proprietary trading firm that uses OCaml as its primary development platform. 
      Our operation runs at a large scale, generating billions of dollars of transactions every day from 
      our offices in Hong Kong, London and New York, with strategies that span many asset classes, 
      time-zones and regulatory regimes.`)}
      </p>
      <p>
      {s(`Jane Street has been contributing open-source libraries back to the wider community for many years, 
      including Core, our alternative standard library, Async, a cooperative concurrency library, and several 
      syntax extensions like binprot and sexplib. All of these can be found at `)}
      {s(`http://janestreet.github.io`)}
      {s(`. All in, we've open-sourced more than 200k lines of code.`)}
      </p>
    <h2>{s(`The Unison File Synchronizer`)}</h2>
      <p>
      {s(`Unison`)}
      {s(` is a popular file-synchronization tool for Windows and most flavors of Unix. It allows two 
      replicas of a collection of files and directories to be stored on different hosts (or different 
      disks on the same host), modified separately, and then brought up to date by propagating the changes 
      in each replica to the other. Unlike simple mirroring or backup utilities, Unison can deal with 
      updates to both replicas: updates that do not conflict are propagated automatically and conflicting 
      updates are detected and displayed. Unison is also resilient to failure: it is careful to leave 
      the replicas and its own private structures in a sensible state at all times, even in case of 
      abnormal termination or communication failures.`)}
      </p>
      <p>
      {s(`Benjamin C. Pierce`)}
      {s(` (University of Pennsylvania), Unison project leader, says:`)}
      {s(` "I think Unison is a very clear success for OCaml – in particular, for the extreme portability 
      and overall excellent engineering of the compiler and runtime system. OCaml's strong static typing, 
      in combination with its powerful module system, helped us organize a large and intricate codebase 
      with a high degree of encapsulation. This has allowed us to maintain a high level of robustness 
      through years of work by many different programmers. In fact, Unison may be unique among large OCaml 
      projects in having been `)}
      {s(`translated`)}
      {s(` from Java to OCaml midway through its development. Moving to OCaml was like a breath of fresh air."`)}
      </p>
    <h2>{s(`The MLdonkey peer-to-peer client`)}</h2>
      <p>
      {s(`MLdonkey`)}
      {s(` is a multi-platform multi-networks peer-to-peer client. It was the first open-source client to access 
      the eDonkey network. Today, MLdonkey supports several other large networks, among which Overnet, Bittorrent, 
      Gnutella, Gnutella2, Fasttrack, Soulseek, Direct-Connect, and Opennap. Searches can be conducted over several 
      networks concurrently; files are downloaded from and uploaded to multiple peers concurrently.`)}
      </p>
      <p>
      {s(`An MLdonkey developer says:`)}
      {s(` "Early in 2002, we decided to use OCaml to program a network application in the emerging world of peer-to-peer 
      systems. The result of our work, MLdonkey, has surpassed our hopes: MLdonkey is currently the most popular 
      peer-to-peer file-sharing client according to `)}
      {s(`free(code)`)}
      {s(` (formerly "freshmeat.net"), with about 10,000 daily users. Moreover, MLdonkey is the only client able 
      to connect to several peer-to-peer networks, to download and share files. It works as a daemon, running 
      unattended on the computer, and can be controlled remotely using a choice of three different kinds of 
      interfaces: GTK, web and telnet."`)}
      </p>
    <h2>{s(`LexiFi's Modeling Language for Finance`)}</h2>
      <p>
      {s(`Developed by the company `)}
      {s(`LexiFi`)}
      {s(`, the Modeling Language for Finance (MLFi) is the first formal language that accurately describes the 
      most sophisticated capital market, credit, and investment products. MLFi is implemented as an extension of OCaml.`)}
      </p>
      <p>
      {s(`MLFi users derive two important benefits from a functional programming approach. First, the declarative formalism 
      of functional programming languages is well suited for `)}
      {s(`specifying`)}
      {s(`complex data structures and algorithms. Second, functional programming languages have strong `)}
      {s(`list processing`)}
      {s(`capabilities. Lists play a central role in finance where they are used extensively to define contract 
      event and payment schedules.`)}
      </p>
      <p>
      {s(`In addition, MLFi provides crucial business integration capabilities inherited from OCaml and related tools 
      and libraries. This enables users, for example, to interoperate with C and Java programs, manipulate XML schemas 
      and documents, and interface with SQL databases.`)}
      </p>
      <p>
      {s(`Data models and object models aiming to encapsulate the definitions and behavior of financial instruments were 
      developed by the banking industry over the past two decades, but face inherent limitations that OCaml helped overcome.`)}
      </p>
      <p>
      {s(`LexiFi's approach to modeling complex financial contracts received an academic award in 2000, and the 
      MLFi implementation was elected "Software Product of the Year 2001" by the magazine `)}
      {s(`Risk`)}
      {s(`, the leading financial trading and risk management publication. MLFi-based solutions are gaining growing 
      acceptance throughout Europe and are contributing to spread the use of OCaml in the financial services industry.`)}
      </p>
    <h2>{s(`The Coq Proof Assistant`)}</h2>
      <p>
      {s(`Jean-Christophe Filliâtre`)}
      {s(` (CNRS), a Coq developer, says:`)}
      {s(` "The `)}
      {s(`Coq`)}
      {s(` tool is a systemfor manipulating formal mathematical proofs; a proof carried out in Coq is mechanically 
      verified by the machine. In addition to its applications in mathematics, Coq also allows certifying the 
      correctness of computer programs."`)}
      </p>
      <p>
      {s(`"From the Coq standpoint, OCaml is attractive on multiple grounds. First, the OCaml language is perfectly 
      suited for symbolic manipulations, which are of paramount importance in a proof assistant. Furthermore, 
      OCaml's type system, and particularly its notion of abstract type, allow securely encapsulating Coq's critical 
      code base, which guarantees the logical consistency of the whole system. Last, OCaml's strong type system `)}
      {s(`de facto`)}
      {s(` grants Coq's code a high level of quality: errors such as "segmentation faults" cannot occur during execution, 
      which is indispensable for a tool whose primary goal is precisely rigor."`)}
      </p>
    <h2>{s(`The ASTRÉE Static Analyzer`)}</h2>
      <p>
      {s(`David Monniaux`)}
      {s(` (CNRS), member of the ASTRÉE project, says:`)}
      {s(` "`)}
      {s(`ASTRÉE`)}
      {s(` is a `)}
      {s(` static analyzer`)}
      {s(` based on `)}
      {s(`abstract interpretation`)}
      {s(` that aims at proving the absence of runtime errors in a safety-critical software written in a subset of the C
      programming language."`)}
      </p>
      <p>
      {s(`"Automatically analyzing programs for exactly checking properties such as the absence of runtime errors is 
      impossible in general, for mathematical reasons. Static analysis by abstract interpretation works around this 
      impossibility and proves program properties by over-approximating the possible behaviors of the program: it 
      is possible to design pessimistic approximations that, in practice, allow proving the desired property on a 
      wide range of software."`)}
      </p>
      <p>
      {s(`"`)}
      {s(`ASTRÉE`)}
      {s(` is written in OCaml and is about 44000 lines long (plus external libraries). We needed a language with good 
      performance (speed and memory usage) on reasonable equipment, easy support for advanced data structures, and type 
      memory safety. OCaml also allows for modular, clear and compact source code and makes it easy to work with 
      recursive structures such as syntax trees."`)}
      </p>
    <h2>{s(`SLAM`)}</h2>
      <p>
      {s(`The `)}
      {s(`SLAM`)}
      {s(` project originated in Microsoft Research in early 2000. Its goal was to automatically check that a C program 
      correctly uses the interface to an external library. The project used and extended ideas from symbolic model checking, 
      program analysis and theorem proving in novel ways to address this problem. The SLAM analysis engine forms the 
      core of a new tool called Static Driver Verifier (SDV) that systematically analyzes the source code of Windows 
      device drivers against a set of rules that define what it means for a device driver to properly interact with 
      the Windows operating system kernel.`)}  
      </p>
      <p>
      {s(`In technical report `)}
      {s(`MSR-TR-2004-08`)}
      {s(`, T.Ball, B.Cook, V.Levin and S.K.Rajamani, the SLAM developers, write:`)}
      {s(` "The Right Tools for the Job: We developed SLAM using Inria's OCaml functional programming language. The 
      expressiveness of this language and robustness of its implementation provided a great productivity boost."`)}
      </p>
    <h2>{s(`FFTW`)}</h2>
      <p>
      {s(`FFTW`)}
      {s(` is a `)}
      {s(`very fast`)}
      {s(`C library for computing Discrete Fourier Transforms (DFT). It uses a powerful symbolic optimizer written in 
      OCaml which, given an integer N, generates highly optimized C code to compute DFTs of size N. FFTW was awarded the 1999 `)}
      {s(`Wilkinson prize`)}
      {s(` for numerical software.`)}
      </p>
      <p>
      {s(`Benchmarks, performed on on a variety of platforms, show that FFTW's performance is typically superior to that 
      of other publicly available DFT software, and is even competitive with vendor-tuned codes. In contrast to vendor-tuned 
      codes, however, FFTW's performance is portable: the same program will perform well on most architectures without 
      modification. Hence the name, "FFTW," which stands for the somewhat whimsical title of "Fastest Fourier Transform 
      in the West."`)}
      </p>
    <h2>{s(`Liquidsoap`)}</h2>
      <p>
      {s(`Liquidsoap`)}
      {s(` is clearly well established in the (internet) radio industry. Liquidsoap is well known as a tool with unique 
      abilities, and has lots of users including big commercial ones. It is not developed as a business, but companies 
      develop services or software on top of it. For example, Sourcefabric develops and sells Airtime on top of Liquidsoap.`)}
      </p>
    <h2>{s(`Haxe`)}</h2>
      <p>
      {s(`Haxe`)}
      {s(` is an open source toolkit based on a modern, high level, strictly typed programming language, a cross-compiler, 
      a complete cross-platform standard library and ways to access each platform's native capabilities. The Haxe compiler 
      was entirely written in OCaml.`)}
      </p>
  </>
