PORTNAME=	scala
DISTVERSION=	3.3.5
CATEGORIES=	lang java
MASTER_SITES=	https://github.com/scala/scala3/releases/download/${DISTVERSION}/
DISTNAME=	scala3-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Scala Programming Language
WWW=		https://www.scala-lang.org/

LICENSE=	Apache-2.0

RUN_DEPENDS=	bash:shells/bash

USES=		cpe java
CPE_VENDOR=	${PORTNAME}-lang

NO_ARCH=	yes
NO_BUILD=	yes

SCALA_HOME=	${DATADIR}
SCALA_SHRDIRS=	lib
SCALA_BINS=	common scala scalac scaladoc

PLIST_FILES=	${SCALA_BINS:S,^,bin/,}

PORTDATA=	*

pre-patch:
	@${ECHO_MSG} "Installation settings:"
	@${ECHO_MSG} "   SCALA_HOME:    ${SCALA_HOME}"

do-install:
	@${MKDIR} ${STAGEDIR}${SCALA_HOME}/bin
.for f in ${SCALA_BINS}
	${INSTALL_SCRIPT} ${WRKSRC}/bin/${f} ${STAGEDIR}${SCALA_HOME}/bin/${f}
	${RLN} ${STAGEDIR}${SCALA_HOME}/bin/${f} ${STAGEDIR}${PREFIX}/bin/${f}
.endfor
.for d in ${SCALA_SHRDIRS}
	(cd ${WRKSRC}/${d} && ${COPYTREE_SHARE} . ${STAGEDIR}${SCALA_HOME}/${d})
.endfor

.include <bsd.port.mk>
