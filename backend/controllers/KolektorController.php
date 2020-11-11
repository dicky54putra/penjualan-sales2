<?php

namespace backend\controllers;

use Yii;
use backend\models\Kolektor;
use backend\models\KolektorSearch;
use backend\models\Login;
use backend\models\Userrole;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * KolektorController implements the CRUD actions for Kolektor model.
 */
class KolektorController extends Controller
{
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    /**
     * Lists all Kolektor models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new KolektorSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Kolektor model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Kolektor model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Kolektor();

        if ($model->load(Yii::$app->request->post())) {
            $login = new Login();
            $login->username = $model->nama_kolektor . $model->tlp;
            $login->password = 123;
            $login->nama = $model->nama_kolektor;
            $login->save(false);

            $hakakses = new Userrole();
            $hakakses->id_system_role = 24;
            $hakakses->id_login = $login->id_login;
            $hakakses->save(false);

            $model->save();
            return $this->redirect(['view', 'id' => $model->id_kolektor]);
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing Kolektor model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);
        $cek_login = Login::find()->where(['username' => $model->nama_kolektor . $model->tlp])->one();

        if ($model->load(Yii::$app->request->post())) {
            if (!empty($cek_login)) {
                $cek_login->username = $model->nama_kolektor . $model->tlp;
                $cek_login->password = 123;
                $cek_login->nama = $model->nama_kolektor;
                $cek_login->save(false);
            } else {
                $login = new Login();
                $login->username = $model->nama_kolektor . $model->tlp;
                $login->password = 123;
                $login->nama = $model->nama_kolektor;
                $login->save(false);

                $hakakses = new Userrole();
                $hakakses->id_system_role = 24;
                $hakakses->id_login = $login->id_login;
                $hakakses->save(false);
            }
            $model->save();
            return $this->redirect(['view', 'id' => $model->id_kolektor]);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing Kolektor model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Kolektor model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Kolektor the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Kolektor::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
