PORTNAME=	openapi-generator
DISTVERSION=	7.22.0
CATEGORIES=	devel java
MASTER_SITES=	https://github.com/OpenAPITools/${PORTNAME}/releases/download/v${DISTVERSION}/
DISTNAME=	${PORTNAME}-cli-${DISTVERSION}
EXTRACT_SUFX=	.jar
EXTRACT_ONLY=	# empty

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	OpenAPI Generator CLI
WWW=		https://openapi-generator.tech/

LICENSE=	Apache-2.0

USES=		java:run

NO_ARCH=	yes
NO_BUILD=	yes

PLIST_FILES=	bin/openapi-generator \
		${JAVAJARDIR:S,^${PREFIX}/,,}/openapi-generator-cli.jar

do-install:
	@${MKDIR} ${JAVAJARDIR} ${PREFIX}/bin
	${INSTALL_DATA} ${DISTDIR}/${DISTNAME}${EXTRACT_SUFX} \
		${JAVAJARDIR}/openapi-generator-cli.jar
	${PRINTF} "#!/bin/sh\nexec ${JAVA} -jar ${TRUE_PREFIX}/${JAVAJARDIR:S,^${PREFIX}/,,}/openapi-generator-cli.jar \"\$$@\"\n" \
		> ${PREFIX}/bin/openapi-generator
	${CHMOD} +x ${PREFIX}/bin/openapi-generator

.include <bsd.port.mk>
