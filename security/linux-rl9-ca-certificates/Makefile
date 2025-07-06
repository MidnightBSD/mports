PORTNAME=	ca-certificates
PORTVERSION=	2024.2.69
DISTVERSIONSUFFIX=	_v8.0.303-91.4.el9_4
PORTREVISION=	3
CATEGORIES=	security linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mozilla CA root certificate bundle (Rocky Linux ${LINUX_DIST_VER})

LICENSE=	publicdom

USES=		linux:rl9
USE_LINUX=	p11-kit
USE_LINUX_RPM=	noarch

OPTIONS_DEFINE=	DOCS

post-fake:
	cd ${FAKE_DESTDIR} && ${LINUXBASE}/bin/sh \
		./${PREFIX}/usr/bin/update-ca-trust extract \
		-o ./${PREFIX}/etc/pki/ca-trust/extracted
	${FIND} ${FAKE_DESTDIR}${PREFIX} -type l -exec \
		${SH} -c "tgt=\$$(readlink {}) ; [ \$$tgt != \$${tgt#/} ] && ${RLN} ${FAKE_DESTDIR}${PREFIX}\$$tgt {}" \; || ${TRUE}
	cd ${FAKE_DESTDIR}${PREFIX} && \
		${FIND} etc/pki/ca-trust/extracted/pem/directory-hash -type f -or -type l >> ${TMPPLIST}


.include <bsd.port.mk>
