# $MidnightBSD: mports/devel/p5-subversion/Makefile,v 1.2 2010/05/05 23:30:49 laffer1 Exp $

PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl bindings for Version control system
LICENSE=	other

MASTERDIR=	${.CURDIR}/../../devel/subversion
PKGDIR=		${.CURDIR}

USE_PERL5=	yes

MAN3=		SVN::Base.3 \
		SVN::Client.3 \
		SVN::Core.3 \
		SVN::Delta.3 \
		SVN::Fs.3 \
		SVN::Ra.3 \
		SVN::Repos.3 \
		SVN::Wc.3

SVN_BUILD_BINDINGS=yes

.include "${MASTERDIR}/Makefile.common"

CATEGORIES+=	perl5

do-build:
	${MKDIR} ${PREFIX}/lib/perl5/${PERL_VERSION}
	cd ${WRKSRC} ; ${MAKE} ${FAKE_MAKEARGS} swig-pl-lib ; ${MAKE} ${FAKE_MAKEARGS} swig-pl

do-install:
	cd ${WRKSRC} ; \
	${REINPLACE_CMD} '/SWIG_PL_DIR/s, install$$, all pure_install,g' ${WRKSRC}/Makefile ; \
	${MAKE} ${FAKE_MAKEARGS} install-swig-pl

.include <bsd.port.post.mk>
