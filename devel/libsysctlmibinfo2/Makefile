PORTNAME=	libsysctlmibinfo2
DISTVERSION=	2.0.1
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sysctl MIB-Tree API (improved version)
WWW=		https://gitlab.com/alfix/sysctlmibinfo2/

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${LOCALBASE}/include/sysctlinfo.h:sysutils/sysctlinfo-kmod
RUN_DEPENDS=	${KMODDIR}/sysctlbyname_improved.ko:sysutils/sysctlbyname-improved-kmod \
		${KMODDIR}/sysctlinfo.ko:sysutils/sysctlinfo-kmod

USE_LDCONFIG=	yes
USE_GITLAB=	yes

GL_ACCOUNT=	alfix
GL_PROJECT=	sysctlmibinfo2
GL_TAGNAME=	de427a99fc515c22a057998a29c92221e2581592\

PLIST_FILES=	include/sysctlmibinfo2.h \
		lib/libsysctlmibinfo2.a \
		lib/libsysctlmibinfo2.so \
		lib/libsysctlmibinfo2.so.2.0.1 \
		share/man/man3/sysctlmibinfo2.3.gz

PORTEXAMPLES=	*

OPTIONS_DEFINE=	EXAMPLES
OPTIONS_DEFAULT=	EXAMPLES

do-install:
	${INSTALL_DATA} ${WRKSRC}/sysctlmibinfo2.h ${STAGEDIR}${PREFIX}/include
	${INSTALL_DATA} ${WRKSRC}/libsysctlmibinfo2.a ${STAGEDIR}${PREFIX}/lib
	${INSTALL_LIB} ${WRKSRC}/libsysctlmibinfo2.so.2.0.1 ${STAGEDIR}${PREFIX}/lib
	${RLN} ${STAGEDIR}${PREFIX}/lib/libsysctlmibinfo2.so.2.0.1 ${STAGEDIR}${PREFIX}/lib/libsysctlmibinfo2.so
	${INSTALL_MAN} ${WRKSRC}/sysctlmibinfo2.3.gz ${STAGEDIR}${PREFIX}/share/man/man3

do-install-EXAMPLES-on:
	@${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}
.for e in ${PORTEXAMPLES}
	${INSTALL_DATA} ${WRKSRC}/examples/${e} ${FAKE_DESTDIR}${EXAMPLESDIR}
.endfor

.include <bsd.port.mk>
