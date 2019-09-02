PORTNAME=	tigervnc
DISTVERSIONPREFIX=	v
DISTVERSION=	1.9.0
CATEGORIES=	net x11-servers

MAINTAINER?=	ports@MidnightBSD.org

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/LICENCE.TXT

USES+=		cmake:insource,noninja
USE_GITHUB=	yes

GH_ACCOUNT=	TigerVNC
CONFLICTS=	tightvnc-[0-9]*
PLIST_SUB+=	TIGERVNC_COMPONENT=${PORTNAME}${PKGNAMESUFFIX}-

CMAKE_ARGS+=	-G "Unix Makefiles"
MAKE_ARGS+=	TIGERVNC_SRCDIR=${WRKSRC}

DOCS=	LICENCE.TXT README.rst

.include <bsd.port.pre.mk>

PLIST=	${.CURDIR}/pkg-plist

do-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
.for f in ${DOCS}
	(cd ${WRKSRC} && ${INSTALL_DATA} ${f} ${FAKE_DESTDIR}${DOCSDIR}/${PORTNAME}${PKGNAMESUFFIX}-${f})
.endfor

.include <bsd.port.post.mk>
