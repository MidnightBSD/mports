PORTNAME=	duo
PORTVERSION=	2.0.1
CATEGORIES=	security
MASTER_SITES=	https://dl.duosecurity.com/ \
		ZI
DISTNAME=	${PORTNAME}_unix-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Duo unix integration package
WWW=		https://duosecurity.com

LICENSE=	gpl2

CONFIGURE_ARGS=	--with-pam=${PREFIX}/lib/security --sysconfdir=${PREFIX}/etc \
		--docdir=${DOCSDIR} --includedir=${PREFIX}/include/${PORTNAME}
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd12.4
GNU_CONFIGURE=	yes
USES=		libtool pathfix ssl
USE_LDCONFIG=	yes

SUB_FILES=	pkg-message

SUID_DESC=	Install login_duo with suid bit set
OPTIONS_DEFINE=	DOCS SUID
OPTIONS_SUB=	yes

post-patch:
	${REINPLACE_CMD} -e 's| /etc| ${PREFIX}/etc|g' \
		${WRKSRC}/pam_duo/pam_duo.8 \
		${WRKSRC}/login_duo/login_duo.8

post-install:
	@${STRIP_CMD} ${PREFIX}/lib/security/pam_duo.so
	${INSTALL_DATA} ${WRKSRC}/login_duo/login_duo.conf \
		${PREFIX}/etc/login_duo.conf.sample
	${INSTALL_DATA} ${WRKSRC}/pam_duo/pam_duo.conf \
		${PREFIX}/etc/pam_duo.conf.sample

.include <bsd.port.mk>
