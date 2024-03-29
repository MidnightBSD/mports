PORTNAME=	openjdk17
PORTVERSION=	17.0.1.12.1
CATEGORIES=	java devel
MASTER_SITES=	FREEBSD_LOCAL/glewis/bootstrap-openjdk17 \
		FREEBSD_LOCAL/pkubaj/bootstrap-openjdk17
PKGNAMEPREFIX=	bootstrap-
DISTNAME=	${JDK_PORT}-${JDK_ARCH}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Java Development Kit 17
WWW=		https://openjdk.java.net/

LICENSE=	gpl2

USES=		tar:xz

NO_BUILD=	yes
PLIST_SUB=	JDK_ROOT=${JDK_ROOT}
WRKSRC=		${WRKDIR}/${JDK_ROOT}

JDK_PORT=	${PKGNAMEPREFIX}${PORTNAME}
JDK_ROOT=	${PKGNAMEPREFIX}${PORTNAME}
JDK_ARCH=	${ARCH:C/armv.*/arm/}${JDK_ARCH_SUFFIX_${ARCH}}
JDK_ARCH_SUFFIX_powerpc64=	-${PPC_ABI:tl}

INSTALLDIR=	${STAGEDIR}${PREFIX}/${JDK_ROOT}

.include <bsd.mport.options.mk>

.if ${ARCH:Mpowerpc64*}
PLIST_SUB+=	NOT_PPC64="@comment "
.else
PLIST_SUB+=	NOT_PPC64=""
.endif

.if ${ARCH} == i386
PLIST_SUB+=	NOT_I386="@comment "
.else
PLIST_SUB+=	NOT_I386=""
.endif

do-install:
	@cd ${WRKSRC} && ${COPYTREE_SHARE} . ${INSTALLDIR}
	@cd ${WRKSRC} && ${COPYTREE_BIN} bin ${INSTALLDIR}
	@${CHMOD} a+x ${INSTALLDIR}/lib/jspawnhelper

.include <bsd.port.mk>
