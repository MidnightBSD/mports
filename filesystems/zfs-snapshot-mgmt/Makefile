PORTNAME=	zfs-snapshot-mgmt
PORTVERSION=	20090201
PORTREVISION=	1
CATEGORIES=	filesystems sysutils
MASTER_SITES=	http://marcin.studio4plus.com/files/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Automatic ZFS snapshot management tool

LICENSE=	bsd2

USES=		ruby:run shebangfix
SHEBANG_FILES=	zfs-snapshot-mgmt

NO_BUILD=	yes

SUB_FILES=	pkg-message

post-patch:	.SILENT
	${FIND} ${WRKSRC} -type f -exec ${REINPLACE_CMD} \
		-e 's|/usr/local|${PREFIX}|g' {} +

do-install:
	@${INSTALL_SCRIPT} ${WRKSRC}/${PORTNAME} ${PREFIX}/bin
	@${INSTALL_MAN} ${WRKSRC}/${PORTNAME}.8 ${PREFIX}/share/man/man8
	@${INSTALL_DATA} ${WRKSRC}/${PORTNAME}.conf.sample ${PREFIX}/etc

.include <bsd.port.mk>
