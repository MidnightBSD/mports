PORTNAME=	bsdec2-image-upload
PORTVERSION=	1.4.8
CATEGORIES=	net
MASTER_SITES=	http://freebsd-ec2-dist.s3.amazonaws.com/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tool for creating Amazon EC2 AMIs

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/COPYRIGHT

RUN_DEPENDS=	${LOCALBASE}/share/certs/ca-root-nss.crt:security/ca_root_nss

USES=		compiler ssl tar:tgz uidfix
CFLAGS+=	-I${OPENSSLINC}
LDFLAGS+=	-L${OPENSSLLIB}

MAKE_ARGS+=	BINDIR=${FAKE_DESTDIR}${TRUE_PREFIX}/bin

PLIST_FILES=	bin/bsdec2-image-upload

.include <bsd.port.mk>
