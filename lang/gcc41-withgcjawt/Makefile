# ex:ts=8
# Ports collection makefile for:	gcc with gcj+AWT
# Date created:				17 April 2006
# Whom:					Maho Nakata <maho@FreeBSD.org>
#
# $MidnightBSD: mports/lang/gcc41-withgcjawt/Makefile,v 1.2 2008/05/29 21:15:17 laffer1 Exp $
# $FreeBSD: ports/lang/gcc41-withgcjawt/Makefile,v 1.9 2006/08/10 07:53:06 maho Exp $
#

PKGNAMESUFFIX=	-withgcjawt

MAINTAINER=	ports@MidnightBSD.org

MASTERDIR=	${.CURDIR}/../../lang/gcc41

DESCR=	${.CURDIR}/pkg-descr

ONLY_FOR_ARCH=	i386

WITH_JAVA_AWT=	yes

.if defined (WITHOUT_JAVA)
BROKEN=		"Does not build gcj"
.endif

#weird libtool issue http://gcc.gnu.org/bugzilla/show_bug.cgi?id=28442
EXTRA_PATCHES+=	${.CURDIR}/files/patch-configure
USE_AUTOTOOLS=	libtool:15
USE_XORG=	xtst xt xaw xmu

pre-build:
	@${REINPLACE_CMD} -e 's|%%LOCALBASE%%|${LOCALBASE}|' ${SRCDIR}/libjava/configure
	@${REINPLACE_CMD} -e 's|%%LOCALBASE%%|${LOCALBASE}|' ${SRCDIR}/libjava/classpath/configure

.include "${MASTERDIR}/Makefile"
