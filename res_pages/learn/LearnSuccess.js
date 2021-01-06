

import * as React from "react";
import * as Markdown$Ocamlorg from "../../components/Markdown.js";

function $$default(param) {
  return React.createElement(React.Fragment, undefined, React.createElement("h1", undefined, "Success Stories"), React.createElement("h2", undefined, "Jane Street"), React.createElement(Markdown$Ocamlorg.LINK.make, {
                  href: "http://janestreet.com/technology/",
                  children: React.createElement("img", {
                        alt: "Jane Street logo",
                        src: "/static/jane-street.jpeg"
                      })
                }), React.createElement("p", undefined, "Jane Street is a proprietary trading firm that uses OCaml as its primary development platform. \n      Our operation runs at a large scale, generating billions of dollars of transactions every day from \n      our offices in Hong Kong, London and New York, with strategies that span many asset classes, \n      time-zones and regulatory regimes."), React.createElement("p", undefined, "Almost all of of our software is written in OCaml, from statistical research code to \n      systems-administration tools to our real-time trading infrastructure. OCaml’s type system acts \n      as a rich and well-integrated set of static analysis tools that help improve the quality \n      of our code, catching bugs at the earliest possible stage. Billions of dollars of transactions \n      flow through our systems every day, so getting it right matters. At the same time, OCaml is \n      highly productive, helping us quickly adapt to changing market conditions."), React.createElement("p", undefined, "Jane Street has been contributing open-source libraries back to the wider community for many years, \n      including Core, our alternative standard library, Async, a cooperative concurrency library, and several \n      syntax extensions like binprot and sexplib. All of these can be found at ", React.createElement(Markdown$Ocamlorg.LINK.make, {
                      href: "http://janestreet.github.io/",
                      children: "http://janestreet.github.io"
                    }), ". All in, we\'ve open-sourced more than 200k lines of code."), React.createElement("h2", undefined, "The Unison File Synchronizer"), React.createElement(Markdown$Ocamlorg.LINK.make, {
                  href: "/static/unison.png",
                  children: React.createElement("img", {
                        alt: "Unison user interface thumbnail",
                        src: "/static/unison-thumb.jpeg"
                      })
                }), React.createElement("p", undefined, React.createElement(Markdown$Ocamlorg.LINK.make, {
                      href: "http://www.cis.upenn.edu/%7Ebcpierce/unison/",
                      children: "Unison"
                    }), " is a popular file-synchronization tool for Windows and most flavors of Unix. It allows two \n      replicas of a collection of files and directories to be stored on different hosts (or different \n      disks on the same host), modified separately, and then brought up to date by propagating the changes \n      in each replica to the other. Unlike simple mirroring or backup utilities, Unison can deal with \n      updates to both replicas: updates that do not conflict are propagated automatically and conflicting \n      updates are detected and displayed. Unison is also resilient to failure: it is careful to leave \n      the replicas and its own private structures in a sensible state at all times, even in case of \n      abnormal termination or communication failures."), React.createElement("p", undefined, React.createElement("em", undefined, React.createElement(Markdown$Ocamlorg.LINK.make, {
                          href: "http://www.cis.upenn.edu/%7Ebcpierce/",
                          children: "Benjamin C. Pierce"
                        }), " (University of Pennsylvania), Unison project leader, says:"), " \"I think Unison is a very clear success for OCaml – in particular, for the extreme portability \n      and overall excellent engineering of the compiler and runtime system. OCaml\'s strong static typing, \n      in combination with its powerful module system, helped us organize a large and intricate codebase \n      with a high degree of encapsulation. This has allowed us to maintain a high level of robustness \n      through years of work by many different programmers. In fact, Unison may be unique among large OCaml \n      projects in having been ", "translated", " from Java to OCaml midway through its development. Moving to OCaml was like a breath of fresh air.\""), React.createElement("h2", undefined, "The MLdonkey peer-to-peer client"), React.createElement(Markdown$Ocamlorg.LINK.make, {
                  href: "/static/mldonkey.jpg",
                  children: React.createElement("img", {
                        alt: "MLDonkey screenshot thumbnail",
                        src: "/static/mldonkey-thumb.jpg"
                      })
                }), React.createElement("p", undefined, React.createElement(Markdown$Ocamlorg.LINK.make, {
                      href: "http://mldonkey.sourceforge.net/Main_Page",
                      children: "MLdonkey"
                    }), " is a multi-platform multi-networks peer-to-peer client. It was the first open-source client to access \n      the eDonkey network. Today, MLdonkey supports several other large networks, among which Overnet, Bittorrent, \n      Gnutella, Gnutella2, Fasttrack, Soulseek, Direct-Connect, and Opennap. Searches can be conducted over several \n      networks concurrently; files are downloaded from and uploaded to multiple peers concurrently."), React.createElement("p", undefined, React.createElement("em", undefined, "An MLdonkey developer says:"), " \"Early in 2002, we decided to use OCaml to program a network application in the emerging world of peer-to-peer \n      systems. The result of our work, MLdonkey, has surpassed our hopes: MLdonkey is currently the most popular \n      peer-to-peer file-sharing client according to ", React.createElement(Markdown$Ocamlorg.LINK.make, {
                      href: "http://freecode.com/",
                      children: "free(code)"
                    }), " (formerly \"freshmeat.net\"), with about 10,000 daily users. Moreover, MLdonkey is the only client able \n      to connect to several peer-to-peer networks, to download and share files. It works as a daemon, running \n      unattended on the computer, and can be controlled remotely using a choice of three different kinds of \n      interfaces: GTK, web and telnet.\""), React.createElement("h2", undefined, "LexiFi\'s Modeling Language for Finance"), React.createElement(Markdown$Ocamlorg.LINK.make, {
                  href: "/static/lexifi.jpg",
                  children: React.createElement("img", {
                        alt: "Thumbnail of report produced by LexiFi",
                        src: "/static/lexifi-thumb.jpg"
                      })
                }), React.createElement("p", undefined, "Developed by the company ", React.createElement(Markdown$Ocamlorg.LINK.make, {
                      href: "http://www.lexifi.com/",
                      children: "LexiFi"
                    }), ", the Modeling Language for Finance (MLFi) is the first formal language that accurately describes the \n      most sophisticated capital market, credit, and investment products. MLFi is implemented as an extension of OCaml."), React.createElement("p", undefined, "MLFi users derive two important benefits from a functional programming approach. First, the declarative formalism \n      of functional programming languages is well suited for ", React.createElement("em", undefined, "specifying"), " complex data structures and algorithms. Second, functional programming languages have strong ", React.createElement("em", undefined, "list processing"), " capabilities. Lists play a central role in finance where they are used extensively to define contract \n      event and payment schedules."), React.createElement("p", undefined, "In addition, MLFi provides crucial business integration capabilities inherited from OCaml and related tools \n      and libraries. This enables users, for example, to interoperate with C and Java programs, manipulate XML schemas \n      and documents, and interface with SQL databases."), React.createElement("p", undefined, "Data models and object models aiming to encapsulate the definitions and behavior of financial instruments were \n      developed by the banking industry over the past two decades, but face inherent limitations that OCaml helped overcome."), React.createElement("p", undefined, "LexiFi\'s approach to modeling complex financial contracts received an academic award in 2000, and the \n      MLFi implementation was elected \"Software Product of the Year 2001\" by the magazine ", React.createElement("em", undefined, "Risk"), ", the leading financial trading and risk management publication. MLFi-based solutions are gaining growing \n      acceptance throughout Europe and are contributing to spread the use of OCaml in the financial services industry."), React.createElement("h2", undefined, "The Coq Proof Assistant"), React.createElement(Markdown$Ocamlorg.LINK.make, {
                  href: "/static/coq.jpg",
                  children: React.createElement("img", {
                        alt: "Coq thumbnail",
                        src: "/static/coq-thumb.jpg"
                      })
                }), React.createElement("p", undefined, React.createElement("em", undefined, React.createElement(Markdown$Ocamlorg.LINK.make, {
                          href: "https://www.lri.fr/~filliatr/",
                          children: "Jean-Christophe Filliâtre"
                        }), " (CNRS), a Coq developer, says:"), " \"The ", React.createElement(Markdown$Ocamlorg.LINK.make, {
                      href: "http://coq.inria.fr/",
                      children: "Coq"
                    }), " tool is a systemfor manipulating formal mathematical proofs; a proof carried out in Coq is mechanically \n      verified by the machine. In addition to its applications in mathematics, Coq also allows certifying the \n      correctness of computer programs.\""), React.createElement("p", undefined, "\"From the Coq standpoint, OCaml is attractive on multiple grounds. First, the OCaml language is perfectly \n      suited for symbolic manipulations, which are of paramount importance in a proof assistant. Furthermore, \n      OCaml\'s type system, and particularly its notion of abstract type, allow securely encapsulating Coq\'s critical \n      code base, which guarantees the logical consistency of the whole system. Last, OCaml\'s strong type system ", React.createElement("em", undefined, "de facto"), " grants Coq\'s code a high level of quality: errors such as \"segmentation faults\" cannot occur during execution, \n      which is indispensable for a tool whose primary goal is precisely rigor.\""), React.createElement("h2", undefined, "The ASTRÉE Static Analyzer"), React.createElement(Markdown$Ocamlorg.LINK.make, {
                  href: "http://www.airbus.com/",
                  children: React.createElement("img", {
                        alt: "A340",
                        src: "/static/astree.gif"
                      })
                }), React.createElement("p", undefined, React.createElement("em", undefined, React.createElement(Markdown$Ocamlorg.LINK.make, {
                          href: "http://www-verimag.imag.fr/~monniaux/",
                          children: "David Monniaux"
                        }), " (CNRS), member of the ASTRÉE project, says:"), " \"", React.createElement(Markdown$Ocamlorg.LINK.make, {
                      href: "http://www.astree.ens.fr/",
                      children: "ASTRÉE"
                    }), " is a ", React.createElement("em", undefined, " static analyzer"), " based on ", React.createElement("em", undefined, React.createElement(Markdown$Ocamlorg.LINK.make, {
                          href: "http://www.di.ens.fr/%7Ecousot/aiintro.shtml",
                          children: "abstract interpretation"
                        })), " that aims at proving the absence of runtime errors in a safety-critical software written in a subset of the C\n      programming language.\""), React.createElement("p", undefined, "\"Automatically analyzing programs for exactly checking properties such as the absence of runtime errors is \n      impossible in general, for mathematical reasons. Static analysis by abstract interpretation works around this \n      impossibility and proves program properties by over-approximating the possible behaviors of the program: it \n      is possible to design pessimistic approximations that, in practice, allow proving the desired property on a \n      wide range of software.\""), React.createElement("p", undefined, "\"So far, ASTRÉE has proved the absence of runtime errors in the primary control software of the ", React.createElement(Markdown$Ocamlorg.LINK.make, {
                      href: "https://www.airbus.com/aircraft/previous-generation-aircraft/a340-family.html",
                      children: "Airbus A340 family"
                    }), ". This would be impossible by ", React.createElement("em", undefined, "software testing"), ", for testing only considers a limited ", React.createElement("em", undefined, "subset"), " of the test cases, while abstract interpretation considers a ", React.createElement("em", undefined, "superset"), " of all possible outcomes of the system.\""), React.createElement("p", undefined, "\"", React.createElement(Markdown$Ocamlorg.LINK.make, {
                      href: "http://www.astree.ens.fr/",
                      children: "ASTRÉE"
                    }), " is written in OCaml and is about 44000 lines long (plus external libraries). We needed a language with good \n      performance (speed and memory usage) on reasonable equipment, easy support for advanced data structures, and type \n      memory safety. OCaml also allows for modular, clear and compact source code and makes it easy to work with \n      recursive structures such as syntax trees.\""), React.createElement("h2", undefined, "SLAM"), React.createElement("p", undefined, "The ", React.createElement(Markdown$Ocamlorg.LINK.make, {
                      href: "http://research.microsoft.com/en-us/projects/slam/",
                      children: "SLAM"
                    }), " project originated in Microsoft Research in early 2000. Its goal was to automatically check that a C program \n      correctly uses the interface to an external library. The project used and extended ideas from symbolic model checking, \n      program analysis and theorem proving in novel ways to address this problem. The SLAM analysis engine forms the \n      core of a new tool called Static Driver Verifier (SDV) that systematically analyzes the source code of Windows \n      device drivers against a set of rules that define what it means for a device driver to properly interact with \n      the Windows operating system kernel."), React.createElement("p", undefined, React.createElement("em", undefined, "In technical report ", React.createElement(Markdown$Ocamlorg.LINK.make, {
                          href: "http://research.microsoft.com/apps/pubs/default.aspx?id=70038",
                          children: "MSR-TR-2004-08"
                        }), ", T.Ball, B.Cook, V.Levin and S.K.Rajamani, the SLAM developers, write:"), " \"The Right Tools for the Job: We developed SLAM using Inria\'s OCaml functional programming language. The \n      expressiveness of this language and robustness of its implementation provided a great productivity boost.\""), React.createElement("h2", undefined, "FFTW"), React.createElement("p", undefined, React.createElement(Markdown$Ocamlorg.LINK.make, {
                      href: "http://www.fftw.org/",
                      children: "FFTW"
                    }), " is a ", React.createElement(Markdown$Ocamlorg.LINK.make, {
                      href: "http://www.fftw.org/benchfft/",
                      children: "very fast"
                    }), " C library for computing Discrete Fourier Transforms (DFT). It uses a powerful symbolic optimizer written in \n      OCaml which, given an integer N, generates highly optimized C code to compute DFTs of size N. FFTW was awarded the 1999 ", React.createElement(Markdown$Ocamlorg.LINK.make, {
                      href: "https://en.wikipedia.org/wiki/J._H._Wilkinson_Prize_for_Numerical_Software",
                      children: "Wilkinson prize"
                    }), " for numerical software."), React.createElement("p", undefined, "Benchmarks, performed on on a variety of platforms, show that FFTW\'s performance is typically superior to that \n      of other publicly available DFT software, and is even competitive with vendor-tuned codes. In contrast to vendor-tuned \n      codes, however, FFTW\'s performance is portable: the same program will perform well on most architectures without \n      modification. Hence the name, \"FFTW,\" which stands for the somewhat whimsical title of \"Fastest Fourier Transform \n      in the West.\""), React.createElement("h2", undefined, "Liquidsoap"), React.createElement("p", undefined, React.createElement(Markdown$Ocamlorg.LINK.make, {
                      href: "http://liquidsoap.fm/",
                      children: "Liquidsoap"
                    }), " is clearly well established in the (internet) radio industry. Liquidsoap is well known as a tool with unique \n      abilities, and has lots of users including big commercial ones. It is not developed as a business, but companies \n      develop services or software on top of it. For example, Sourcefabric develops and sells Airtime on top of Liquidsoap."), React.createElement("h2", undefined, "Haxe"), React.createElement("p", undefined, React.createElement(Markdown$Ocamlorg.LINK.make, {
                      href: "http://haxe.org/",
                      children: "Haxe"
                    }), " is an open source toolkit based on a modern, high level, strictly typed programming language, a cross-compiler, \n      a complete cross-platform standard library and ways to access each platform\'s native capabilities. The Haxe compiler \n      was entirely written in OCaml."));
}

export {
  $$default ,
  $$default as default,
  
}
/* react Not a pure module */
