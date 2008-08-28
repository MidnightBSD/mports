# $FreeBSD: ports/textproc/aspell/Makefile.inc,v 1.1 2006/07/15 14:28:41 thierry Exp $
# To be included by dictionaries ports.

MASTER_SITES?=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR?=	aspell/dict/${DICT}
DISTNAME?=	aspell${DISTVERSION}

.if ${PORTNAME} == "en-aspell" || defined(WITHOUT_DICTEN)
LIB_DEPENDS=	aspell:${PORTSDIR}/textproc/aspell-without-dicten
.else
LIB_DEPENDS=	aspell:${PORTSDIR}/textproc/aspell
.endif

USE_BZIP2=	yes
USE_GMAKE=	yes
HAS_CONFIGURE=	yes

PLIST_SUB=	VER=${VER}

.include <bsd.port.pre.mk>
.if exists(${LOCALBASE}/etc/aspell.ver)
. include "${LOCALBASE}/etc/aspell.ver"
.endif
