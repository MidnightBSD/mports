PORTNAME=	sysctlbyname-improved-kmod
DISTVERSION=	20221211
CATEGORIES=	sysutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Internal sysctl object to implement an improved sysctlbyname(3)
WWW=		https://gitlab.com/alfix/sysctlbyname-improved/

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		kmod
USE_GITLAB=	yes
GL_ACCOUNT=	alfix
GL_PROJECT=	sysctlbyname-improved
GL_TAGNAME=	22bdff50867ff927edd098091608e871503291b6

PLIST_FILES=	${KMODDIR}/sysctlbyname_improved.ko

PORTEXAMPLES=	*

OPTIONS_DEFINE=		EXAMPLES
OPTIONS_DEFAULT=	EXAMPLES

.include <bsd.port.pre.mk>

do-install:
	${INSTALL_KLD} ${WRKSRC}/sysctlbyname_improved.ko ${KMODDIR}

do-install-EXAMPLES-on:
	@${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}
.for e in ${PORTEXAMPLES}
	${INSTALL_DATA} ${WRKSRC}/examples/${e} ${FAKE_DESTDIR}${EXAMPLESDIR}
.endfor

.include <bsd.port.post.mk>
