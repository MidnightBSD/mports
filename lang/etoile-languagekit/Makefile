# $MidnightBSD: mports/lang/etoile-languagekit/Makefile,v 1.1 2010/01/23 19:12:10 laffer1 Exp $

PORTNAME=	languagekit
PORTVERSION=	0.4.1
CATEGORIES=	lang gnustep
MASTER_SITES=	http://download.gna.org/etoile/
PKGNAMEPREFIX=	etoile-
DISTNAME=	etoile-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Etoile Project LanguageKit framework
LICENSE=	bsd2

BROKEN=		needs llvm 2.6 to build

BUILD_DEPENDS=	llc:${PORTSDIR}/devel/llvm-devel

USE_BZIP2=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LDCONFIG=	${GNUSTEP_LOCAL_LIBRARIES}
USE_GNUSTEP_LOCAL_LIBS+=	EtoileFoundation:${FOUNDATION_PORT}
USE_PERL5_BUILD=	yes

DEFAULT_LIBVERSION=	0.6
WRKSRC=	${WRKDIR}/Etoile-${PORTVERSION}
USE_GNUSTEP_MAKE_DIRS+=	Languages/LanguageKit
DEFAULT_LIBVERSION2=	0.0.1
PLIST_SUB+=	LIBVERSION2=${DEFAULT_LIBVERSION2}
PLIST_SUB+=	MAJORLIBVERSION2=${DEFAULT_LIBVERSION2:C/([0-9]).*/\1/1}

FOUNDATION_PORT?=	devel/etoile-foundation

post-configure:
	${REINPLACE_CMD} -e 's|-Werror||' ${WRKSRC}/etoile.make

.include <bsd.port.mk>
