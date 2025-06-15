PORTNAME=	sysctlinfo-kmod
DISTVERSION=	20221211
CATEGORIES=	sysutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Kernel sysctl MIB-Tree interface
WWW=		https://gitlab.com/alfix/sysctlinfo

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		kmod
USE_GITLAB=	yes
GL_ACCOUNT=	alfix
GL_PROJECT=	sysctlinfo
GL_TAGNAME=	be57d5a892d0a908172664f87afeed0627e9ddf2

PLIST_FILES=	${KMODDIR}/sysctlinfo.ko \
		include/sysctlinfo.h \
		share/man/man3/sysctlinfo.3.gz \
		share/man/man4/sysctlinfo.4.gz

PORTEXAMPLES=	*

OPTIONS_DEFINE=		EXAMPLES
OPTIONS_DEFAULT=	EXAMPLES

.include <bsd.port.pre.mk>

do-install:
	${INSTALL_KLD} ${WRKSRC}/sysctlinfo.ko ${STAGEDIR}${KMODDIR}
	${INSTALL_DATA} ${WRKSRC}/sysctlinfo.h ${STAGEDIR}${PREFIX}/include
	${INSTALL_MAN} ${WRKSRC}/sysctlinfo.3 ${STAGEDIR}${PREFIX}/share/man/man3
	${INSTALL_MAN} ${WRKSRC}/sysctlinfo.4 ${STAGEDIR}${PREFIX}/share/man/man4

do-install-EXAMPLES-on:
	@${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}
.for e in ${PORTEXAMPLES}
	${INSTALL_DATA} ${WRKSRC}/examples/${e} ${FAKE_DESTDIR}${EXAMPLESDIR}
.endfor

.include <bsd.port.post.mk>
