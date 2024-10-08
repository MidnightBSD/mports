PORTNAME=	backuppc
PORTVERSION=	3.3.2
CATEGORIES=	sysutils
MASTER_SITES=	https://github.com/backuppc/backuppc/releases/download/${PORTVERSION}/ \
		SF
DISTNAME=	BackupPC-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Multi-platform backup to disk-based storage
WWW=		https://backuppc.github.io/backuppc/

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	p5-CGI>0:www/p5-CGI \
		p5-File-Listing>=0:sysutils/p5-File-Listing

USES=		cpe perl5

CONFLICTS_INSTALL=	backuppc4 backuppc-devel

USE_RC_SUBR=	backuppc
CPE_VENDOR=	craig_barratt
NO_ARCH=	yes
NO_BUILD=	yes

USERS=		backuppc
GROUPS=		backuppc

CGIDIR?=	${TRUE_PREFIX}/www/cgi-bin

SUB_FILES=	pkg-deinstall pkg-message update.sh
SUB_LIST=	CGIDIR=${CGIDIR}

PLIST_SUB+=	CGIDIR=${CGIDIR:S,^${PREFIX}/,,} \
		DISTVERSION=${DISTVERSION}

PORTDOCS=	ChangeLog LICENSE README

OPTIONS_DEFINE=		ARCHIVE_ZIP COMPRESS_ZLIB DOCS FILE_RSYNCP SMB \
			XML_RSS

OPTIONS_RADIO=		GRAPHS
OPTIONS_RADIO_GRAPHS=	RRD_GRAPHS RRDTOOL

OPTIONS_DEFAULT=	ARCHIVE_ZIP COMPRESS_ZLIB RRD_GRAPHS

ARCHIVE_ZIP_DESC=	Perl module for Zip archive files
COMPRESS_ZLIB_DESC=	Perl5 interface to zlib compression library
FILE_RSYNCP_DESC=	Perl Rsync client
RRD_GRAPHS_DESC=	Apply graphs patch (but not install RRDTool)
RRDTOOL_DESC=		Use RRDTool to generate pool statistic graphs
SMB_DESC=		NetBIOS Name lookup and Samba client
XML_RSS_DESC=		Perl extension to manage RSS files

ARCHIVE_ZIP_RUN_DEPENDS=	p5-Archive-Zip>=0:archivers/p5-Archive-Zip
COMPRESS_ZLIB_RUN_DEPENDS=	p5-IO-Compress>=0:archivers/p5-IO-Compress
FILE_RSYNCP_RUN_DEPENDS=	p5-File-RsyncP>=0:net/p5-File-RsyncP
RRDTOOL_RUN_DEPENDS=		rrdtool:databases/rrdtool
SMB_USES=			samba:run # nmblookup, smbclient
XML_RSS_RUN_DEPENDS=		p5-XML-RSS>=0:textproc/p5-XML-RSS
RRD_GRAPHS_EXTRA_PATCHES=	${FILESDIR}/extra-patch-bin-BackupPC \
				${FILESDIR}/extra-patch-lib-BackupPC-CGI-GeneralInfo.pm
RRDTOOL_EXTRA_PATCHES=		${FILESDIR}/extra-patch-bin-BackupPC \
				${FILESDIR}/extra-patch-lib-BackupPC-CGI-GeneralInfo.pm

pre-patch:
	@${CP} ${WRKSRC}/configure.pl ${WRKSRC}/update.pl

post-patch:
	@${REINPLACE_CMD} \
		-e 's|/etc/BackupPC\(/config.pl\)|${LOCALBASE}/${ETCDIR_REL}\1|' \
		-e 's|^\(foreach my $$dir ( qw(bin \)doc$$|\1${DOCSDIR_REL}|' \
		-e 's|\($$DestDir$$Conf{InstallDir}/\)doc|\1${DOCSDIR_REL}|' \
		${WRKSRC}/configure.pl ${WRKSRC}/update.pl
	@${REINPLACE_CMD} -E \
		-e 's|^(use lib ")\.(/lib";)$$|\1${PREFIX}\2|' \
		${WRKSRC}/update.pl
	@${REINPLACE_CMD} \
		-e 's|STDERR "Please su |STDERR "Please su [-m] |' \
		${WRKSRC}/lib/BackupPC/Lib.pm
	@${REINPLACE_CMD} \
		-e 's| you can use the -s| you can use the -m|' \
		-e 's|option to su to explicitly run|option to su to run|' \
		-e 's|su -s /bin/bash __BACKUPPCUSER__|su -m __BACKUPPCUSER__|' \
		${WRKSRC}/doc/BackupPC.html ${WRKSRC}/doc/BackupPC.pod

do-install:
	cd ${WRKSRC} && ${PERL} configure.pl	\
		--batch				\
		--backuppc-user ${USERS}	\
		--bin-path perl=${PERL}		\
		--config-dir ${ETCDIR}		\
		--cgi-dir ${CGIDIR}		\
		--data-dir /var/db/BackupPC	\
		--dest-dir ${FAKE_DESTDIR}		\
		--fhs				\
		--html-dir ${TRUE_PREFIX}/${WWWDIR_REL}		\
		--html-dir-url /${PORTNAME}	\
		--install-dir ${TRUE_PREFIX}		\
		--log-dir /var/log/BackupPC	\
		--no-set-perms			\
		--uid-ignore

	pod2man --section=1 --release=${PORTVERSION} \
		--name=BackupPC --center="BackupPC user guide" \
		${WRKSRC}/doc/BackupPC.pod ${WRKSRC}/${PORTNAME}.1
	${INSTALL_MAN} ${WRKSRC}/${PORTNAME}.1 ${PREFIX}/share/man/man1
	${MKDIR} ${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${PORTDOCS} ${DOCSDIR}
	${CP} ${WRKSRC}/doc/BackupPC.html ${WWWDIR}
	${MKDIR} ${ETCDIR}
	-${RM} ${ETCDIR}/config.pl
	-${RM} ${ETCDIR}/hosts
	${CP} ${WRKSRC}/conf/config.pl ${ETCDIR}/config.pl.sample
	${CP} ${WRKSRC}/conf/hosts ${ETCDIR}/hosts.sample
	${CP} ${WRKDIR}/update.sh ${ETCDIR}/update.sh
	${MKDIR} ${PREFIX}/libexec/backuppc
	${CP} ${WRKSRC}/update.pl ${PREFIX}/libexec/backuppc/update.pl
	${REINPLACE_CMD} -e 's|${FAKE_DESTDIR}||g' ${PREFIX}/lib/BackupPC/Lib.pm \
		${PREFIX}/share/doc/backuppc/BackupPC.html \
		${PREFIX}/share/doc/backuppc/BackupPC.pod


.include <bsd.port.mk>
